rule find_ref_deletion_gap_locations:
        input:
                str(MUMMER_REF_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_REF_PREFIX + ".DEL.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                svType="DEL",
                minSize=config["svMinSize"]
        shell:
                "bash ./Scripts/find-gaps.sh {params.svType} {input} {output} {params.minSize}"

rule find_qry_deletion_gap_locations:
        input:
                str(MUMMER_QRY_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_QRY_PREFIX + ".DEL.final.coords") 
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                svType="DEL",
                minSize=config["svMinSize"]
        shell:
                "bash ./Scripts/find-gaps.sh {params.svType} {input} {output} {params.minSize}"

rule find_ref_insertion_gap_locations:
        input:
                str(MUMMER_QRY_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_REF_PREFIX + ".INS.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                svType="INS",
                minSize=config["svMinSize"]
        shell:
                "bash ./Scripts/find-gaps.sh {params.svType} {input} {output} {params.minSize}"

rule find_qry_insertion_gap_locations:
        input:
                str(MUMMER_REF_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_QRY_PREFIX + ".INS.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                svType="INS",
                minSize=config["svMinSize"]
        shell:
                "bash ./Scripts/find-gaps.sh {params.svType} {input} {output} {params.minSize}"

rule find_ref_repeated_locations:
        input:
                str(MUMMER_REF_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_REF_PREFIX + ".Repeat.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["svMinSize"]
        shell:
                "bash ./Scripts/find-dups.sh {input} {output} {params}"

rule find_ref_dup_locations_from_repeats:
        input:
                str(SVPS_REF_PREFIX + ".Repeat.coords")
        output:
                str(SVPS_REF_PREFIX + ".DUP.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["svMinSize"]
        shell:
                "python ./Scripts/find-cnvs-graph.py {input} {output}"

rule find_qry_repeated_locations:
        input:
                str(MUMMER_QRY_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_QRY_PREFIX + ".Repeat.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["svMinSize"]
        shell:
                "bash ./Scripts/find-dups.sh {input} {output} {params}"

rule find_qry_dup_locations_from_repeats:
        input:
                str(SVPS_QRY_PREFIX + ".Repeat.coords")
        output:
                str(SVPS_QRY_PREFIX + ".DUP.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "python ./Scripts/find-cnvs-graph.py {input} {output}"


rule find_ref_inversion_locations:
        input:
                str(MUMMER_REF_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_REF_PREFIX + ".INV.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/find-invs.sh {input} {output}"

rule find_qry_inversion_locations:
        input:
                str(MUMMER_QRY_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_QRY_PREFIX + ".INV.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/find-invs.sh {input} {output}"

rule find_ref_transloc_locations:
        input:
                str(MUMMER_REF_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_REF_PREFIX + ".TRANS.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/find-trans.sh {input} {output}"

rule find_qry_transloc_locations:
        input:
                str(MUMMER_QRY_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_QRY_PREFIX + ".TRANS.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/find-trans.sh {input} {output}"
