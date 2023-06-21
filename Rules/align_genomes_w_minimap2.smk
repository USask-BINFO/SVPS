rule align_both_assemblies_w_minimap2_ref:
        input:
                REF_FILTERED,
                QRY_FILTERED
        output:
                str(MNMP2_GENOMES_PREFIX + ".ref.sam")
        threads: 3
        benchmark:
                repeat(str(BENCH_DIR + "/Minimap2.benchmarking.tsv"), BENCH_REPEAT)
        params:
                mnmp2Preset=config["presetForAssemblies"]
        shell:
                #"minimap2 -a -x {params.mnmp2Preset} --cs -r2k -t {threads} {input} > {output}" #settings from svim-asm git
                "minimap2 -ax {params.mnmp2Preset} -t {threads} --eqx {input} > {output}" #settings from svim-asm git

rule align_both_assemblies_w_minimap2_qry:
        input:
                QRY_FILTERED,
                REF_FILTERED
        output:
                str(MNMP2_GENOMES_PREFIX + ".qry.sam")
        threads: 3
        benchmark:
                repeat(str(BENCH_DIR + "/Minimap2.benchmarking.tsv"), BENCH_REPEAT)
        params:
                mnmp2Preset=config["presetForAssemblies"]
        shell:
                #"minimap2 -a -x {params.mnmp2Preset} --cs -r2k -t {threads} {input} > {output}" #settings from svim-asm git
                "minimap2 -ax {params.mnmp2Preset} -t {threads} --eqx {input} > {output}" #settings from svim-asm git

rule sort_genomes_bam_file_ref:
        input:
                str(MNMP2_GENOMES_PREFIX + ".ref.sam")
        output:
                str(MNMP2_GENOMES_PREFIX + ".ref.sorted.bam")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Minimap2.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["memSettingForAssemblySort"]
        shell:
                "samtools sort -m{params} -@ {threads} -o {output} {input}"

rule sort_genomes_bam_file_qry:
        input:
                str(MNMP2_GENOMES_PREFIX + ".qry.sam")
        output:
                str(MNMP2_GENOMES_PREFIX + ".qry.sorted.bam")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Minimap2.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["memSettingForAssemblySort"]
        shell:
                "samtools sort -m{params} -@ {threads} -o {output} {input}"

rule index_sorted_genomes_bam_file_ref:
        input:
                str(MNMP2_GENOMES_PREFIX + ".ref.sorted.bam")
        output:
                str(MNMP2_GENOMES_PREFIX + ".ref.sorted.bam.bai")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Minimap2.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "samtools index -@ {threads} {input}"

rule index_sorted_genomes_bam_file_qry:
        input:
                str(MNMP2_GENOMES_PREFIX + ".qry.sorted.bam")
        output:
                str(MNMP2_GENOMES_PREFIX + ".qry.sorted.bam.bai")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Minimap2.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "samtools index -@ {threads} {input}"

rule calculate_alignment_depth_from_minimap2_ref_result:
        input:
                alignResult=str(MNMP2_GENOMES_PREFIX + ".ref.sorted.bam"),
		alignIndex=str(MNMP2_GENOMES_PREFIX + ".ref.sorted.bam.bai")
        output:
                str(MNMP2_GENOMES_PREFIX + ".ref.depth")
        threads: 3
        benchmark:
                repeat(str(BENCH_DIR + "/SamtoolsDepth.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "samtools depth -a -o {output} {input.alignResult}"

rule calculate_alignment_depth_from_minimap2_qry_result:
        input:
                alignResult=str(MNMP2_GENOMES_PREFIX + ".qry.sorted.bam"),
                alignIndex=str(MNMP2_GENOMES_PREFIX + ".qry.sorted.bam.bai")
        output:
                str(MNMP2_GENOMES_PREFIX + ".qry.depth")
        threads: 3
        benchmark:
                repeat(str(BENCH_DIR + "/SamtoolsDepth.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "samtools depth -a -o {output} {input.alignResult}"
