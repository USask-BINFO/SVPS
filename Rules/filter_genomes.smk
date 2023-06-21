rule identify_ref_seq_details_of_interest:
        input:
                config["refAssembly"]
        output:
                str(config["genomesFolder"] + "/RefSeqDetails.txt"),
                str(config["genomesFolder"] + "/RefSeqNamesToInclude.txt"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/GenomePreprocessing.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["refChrmPrefix"]
        shell:
                "bash ./Scripts/identify-contigs-and-lengths.sh {input} {output} {params}"

rule extract_chroms_from_reference:
        input:
                config["refAssembly"],
                str(config["genomesFolder"] + "/RefSeqNamesToInclude.txt")
        output:
                REF_FILTERED
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/GenomePreprocessing.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/filter-genome-fasta.sh {input} {output}"

rule identify_qry_seq_details_of_interest:      
        input:
                config["qryAssembly"]
        output:
                str(config["genomesFolder"] + "/QrySeqDetails.txt"),
                str(config["genomesFolder"] + "/QrySeqNamesToInclude.txt"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/GenomePreprocessing.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["qryChrmPrefix"]
        shell:
                "bash ./Scripts/identify-contigs-and-lengths.sh {input} {output} {params}"

rule extract_chroms_from_query:
        input:
                config["qryAssembly"],
                str(config["genomesFolder"] + "/QrySeqNamesToInclude.txt")
        output:
                QRY_FILTERED
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/GenomePreprocessing.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/filter-genome-fasta.sh {input} {params} {output}"
