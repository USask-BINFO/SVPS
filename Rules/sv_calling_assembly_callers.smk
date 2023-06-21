rule sv_calling_w_svim_asm:
        input:
                indexFile=str(MNMP2_GENOMES_PREFIX + ".sorted.bam.bai"),
                inputFile=str(MNMP2_GENOMES_PREFIX + ".sorted.bam")
        output:
                str(SVIM_ASM_PREFIX + ".ALL.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/SVCaller.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minMAPQ=config["minMAPQForSVs"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                svOutDir=str(SV_RESULTS_DIR +"/SVIM-ASM"),
                refGenome=REF_FILTERED
        conda:
                config["condaEnvYAML"]
        shell:
                "svim-asm haploid --min_mapq {params.minMAPQ} --min_sv_size {params.minSize} --max_sv_size {params.maxSize} {params.svOutDir} {input.inputFile} {params.refGenome};\n"
                "mv {params.svOutDir}/variants.vcf {output}"

rule verify_svim_asm_filtering_w_bcftools:
        input:
                str(SVIM_ASM_PREFIX + ".ALL.vcf")
        output:
                finalFilter=str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf"),
                removedNs=str(SVIM_ASM_PREFIX + ".ALL.NoN.vcf"),
                filteredInv=str(SVIM_ASM_PREFIX + ".filteredINV.ALL.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/SVCaller.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                minSupp=config["minSuppReadsForSVs"],
                minMAPQ=config["minMAPQForSVs"]
        shell:
                "bcftools filter -e \'REF ~ \"NNN*\" || ALT ~ \"NNN*\"\' -o {output.removedNs} {input};\n"
                "bcftools filter -e \'SVTYPE == \"INV\" && ((INFO/END-POS)<-{params.maxSize} || (INFO/END-POS)>{params.maxSize})\' -o {output.filteredInv} {output.removedNs};\n"
                "bcftools filter -e \'INFO/SVLEN<-{params.maxSize} || INFO/SVLEN>{params.maxSize}\' -o {output.finalFilter} {output.filteredInv}"

rule segment_svim_asm_SVs:
        input:
                str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf")
        output:
                str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                str(SVIM_ASM_PREFIX + ".INS.vcf"),
                str(SVIM_ASM_PREFIX + ".DUP.vcf"),
                str(SVIM_ASM_PREFIX + ".INV.vcf"),
                str(SVIM_ASM_PREFIX + ".BND.vcf")
        threads: 1 #config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/SVCaller.benchmarking.tsv"), BENCH_REPEAT)
        params:
                SVIM_ASM_PREFIX
        shell:
                "bash ./Scripts/segment-sv-types-w-bcftools.sh {input} {params}"
