rule reformat_and_sort_mummer_ref_coords:
        input:
                str(MUMMER_REF_PREFIX + ".coords")
        output:
                str(MUMMER_REF_PREFIX + ".reformatted.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFormatting.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/reformat-and-sort-coords.sh {input} {output}"

rule reformat_and_sort_mummer_qry_coords:
        input:
                str(MUMMER_QRY_PREFIX + ".coords")
        output:
                str(MUMMER_QRY_PREFIX + ".reformatted.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFormatting.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/reformat-and-sort-coords.sh {input} {output}"

rule sort_genomes_bam_file:
        input:
                str(MNMP2_GENOMES_PREFIX + ".sam")
        output:
                str(MNMP2_GENOMES_PREFIX + ".sorted.bam")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/AlignmentSorting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["memSettingForAssemblySort"]
        shell:
                "samtools sort -m{params} -@ {threads} -o {output} {input}"

rule index_sorted_genomes_bam_file:
        input:
                str(MNMP2_GENOMES_PREFIX + ".sorted.bam")
        output:
                str(MNMP2_GENOMES_PREFIX + ".sorted.bam.bai")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/AlignmentSorting.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "samtools index -@ {threads} {input}"
