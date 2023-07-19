rule run_syri_mummer_w_ref:
        input:
                coordsFile=str(MUMMER_REF_PREFIX + ".syri.coords"),
                deltaFiltFile=str(MUMMER_REF_PREFIX + ".delta_filter"),
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED
        output:
                str(SYRI_REF_PREFIX + ".syri.mummer.out")
        threads: config["numRefContigs"]
        benchmark:
                repeat(str(BENCH_DIR + "/SyRI.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        conda:
                config["syriCondaEnv"]
        params:
                outDir=str(SV_RESULTS_DIR + "/SYRI/REF"),
                sampName=REF_SAMP_NAME
        shell:
                "bash Scripts/run-syri-mummer.sh {threads} {input.coordsFile} {input.deltaFiltFile} {input.refGenome} {input.qryGenome} {params}"

rule run_syri_mummer_w_qry:
        input:
                coordsFile=str(MUMMER_QRY_PREFIX + ".syri.coords"),
                deltaFiltFile=str(MUMMER_QRY_PREFIX + ".delta_filter"),
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED,
                refResult=str(SYRI_REF_PREFIX + ".syri.mummer.out"),
        output:
                str(SYRI_QRY_PREFIX + ".syri.mummer.out")
        threads: config["numQryContigs"]
        benchmark:
                repeat(str(BENCH_DIR + "/SyRI.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        conda:
                config["syriCondaEnv"]
        params:
                outDir=str(SV_RESULTS_DIR + "/SYRI/QRY"),
                sampName=QRY_SAMP_NAME
        shell:
                "bash Scripts/run-syri-mummer.sh {threads} {input.coordsFile} {input.deltaFiltFile} {input.qryGenome} {input.refGenome} {params}"

rule run_syri_minimap_w_ref:
        input:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED,
                minimapAlign=str(MNMP2_GENOMES_PREFIX + ".ref.sorted.bam"),
                minimapIndex=str(MNMP2_GENOMES_PREFIX + ".ref.sorted.bam.bai"),
                prevOutput=str(SYRI_QRY_PREFIX + ".syri.mummer.out")
        output:
                str(SYRI_REF_PREFIX + ".syri.minimap.out")
        threads: config["numRefContigs"]
        benchmark:
                repeat(str(BENCH_DIR + "/SyRI.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        conda:
                config["syriCondaEnv"]
        params:
                outDir=str(SV_RESULTS_DIR + "/SYRI/REF"),
                sampName=REF_SAMP_NAME
        shell:
                "bash Scripts/run-syri-minimap.sh {threads} {input.minimapAlign} {input.refGenome} {input.qryGenome} {params}"

rule run_syri_minimap_w_qry:
        input:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED,
                refResult=str(SYRI_REF_PREFIX + ".syri.minimap.out"),
                minimapAlign=str(MNMP2_GENOMES_PREFIX + ".qry.sorted.bam"),
                minimapIndex=str(MNMP2_GENOMES_PREFIX + ".qry.sorted.bam.bai")
        output:
                str(SYRI_QRY_PREFIX + ".syri.minimap.out")
        threads: config["numQryContigs"]
        benchmark:
                repeat(str(BENCH_DIR + "/SyRI.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        conda:
                config["syriCondaEnv"]
        params:
                outDir=str(SV_RESULTS_DIR + "/SYRI/QRY"),
                sampName=QRY_SAMP_NAME
        shell:
                "bash Scripts/run-syri-minimap.sh {threads} {input.minimapAlign} {input.qryGenome} {input.refGenome} {params}"

rule run_mumco_w_ref:
        input:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED
        output:
                #str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME +"_output/" + REF_SAMP_NAME +".SVs_all.tsv"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + ".mumco_output/" + REF_SAMP_NAME +".mumco.SVs_all.tsv"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME +".mumco_output/" + REF_SAMP_NAME +".mumco.SVs_all.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/MUMCO.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        conda:
                config["condaEnvYAML"]
        params:
                mumCoScript=config["mumCoScript"],
                outDir=str(SV_RESULTS_DIR + "/MUMCO/REF"),
                genomeDetails=str(config["genomesFolder"] + "/RefSeqDetails.txt"), #config["refSize"],
                outPrefix=str(REF_SAMP_NAME+".mumco"),
                sampName=REF_SAMP_NAME
        shell:
               "mkdir -p {params.outDir};\n"
               "bash ./Scripts/run-mumco.sh {params.mumCoScript} {threads} {input.refGenome} {input.qryGenome} {params.genomeDetails} {params.outDir} {params.sampName} {params.outPrefix}"


rule filter_mumco_vcf_ref:
        input:
                refVCF=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME +".mumco_output/" + REF_SAMP_NAME +".mumco.SVs_all.vcf")
        output:
                #str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME +"_output/" + REF_SAMP_NAME +".SVs_filtered.vcf")
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME +".mumco_output/" + REF_SAMP_NAME +".mumco.SVs_filtered.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/MUMCO.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        conda:
                config["condaEnvYAML"]
        shell:
                "bcftools filter -e \'SVTYPE=\"CONTR\"\' -o {output} {input};\n"

rule run_mumco_w_qry:
        input:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED 
        output:
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME +"_output/" + QRY_SAMP_NAME +".SVs_all.tsv"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY" + QRY_SAMP_NAME + ".mumco_output/" + QRY_SAMP_NAME +".mumco.SVs_all.tsv"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME +".mumco_output/" + QRY_SAMP_NAME +".mumco.SVs_all.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/MUMCO.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        conda:
                config["condaEnvYAML"]
        params:
                mumCoScript=config["mumCoScript"],
                outPrefix=str(QRY_SAMP_NAME + ".mumco"),
                outDir=str(SV_RESULTS_DIR + "/MUMCO/QRY"),
                genomeDetails=str(config["genomesFolder"] + "/RefSeqDetails.txt"), #config["qrySize"],
                sampName=QRY_SAMP_NAME
        shell:
               "mkdir -p {params.outDir};\n"
               "bash ./Scripts/run-mumco.sh {params.mumCoScript} {threads} {input.qryGenome} {input.refGenome} {params.genomeDetails} {params.outDir} {params.sampName} {params.outPrefix}"

rule filter_mumco_vcf_qry:
        input:
                qryVCF=str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME +".mumco_output/" + QRY_SAMP_NAME +".mumco.SVs_all.vcf")
        output:
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME +"_output/" + QRY_SAMP_NAME +".SVs_filtered.vcf")
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME +".mumco_output/" + QRY_SAMP_NAME +".mumco.SVs_filtered.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/MUMCO.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        conda:
                config["condaEnvYAML"]
        shell:
                "bcftools filter -e \'SVTYPE=\"CONTR\"\' -o {output} {input};\n"
