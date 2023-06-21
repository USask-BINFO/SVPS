rule check_for_Ns_in_ref_DEL_predictions:
        input:
                str(SVPS_REF_PREFIX + ".DEL.final.coords")
        output:
                str(SVPS_REF_PREFIX + ".DEL.final.noN.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED
        shell:
                "python ./Scripts/check-looped-predictions-for-Ns.py {params} {input} {output}"

rule check_for_Ns_in_ref_DUP_predictions:
        input:
                str(SVPS_REF_PREFIX + ".DUP.final.coords")
        output:
                str(SVPS_REF_PREFIX + ".DUP.final.noN.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED
        shell:
                "python ./Scripts/check-looped-predictions-for-Ns.py {params} {input} {output}"

rule check_for_Ns_in_ref_INS_predictions:
        input:
                str(SVPS_REF_PREFIX + ".INS.final.coords")
        output:
                str(SVPS_REF_PREFIX + ".INS.final.noN.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED
        shell:
                "python ./Scripts/check-looped-predictions-for-Ns.py {params} {input} {output}"

rule check_for_Ns_in_ref_INV_predictions:
        input:
                str(SVPS_REF_PREFIX + ".INV.final.coords")
        output:
                str(SVPS_REF_PREFIX + ".INV.final.noN.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED
        shell:
                "python ./Scripts/check-awk-predictions-for-Ns.py {params} {input} {output}"

rule check_for_Ns_in_ref_TRANS_predictions:
        input:
                str(SVPS_REF_PREFIX + ".TRANS.final.coords")
        output:
                str(SVPS_REF_PREFIX + ".TRANS.final.noN.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED
        shell:
                "python ./Scripts/check-awk-predictions-for-Ns.py {params} {input} {output}"

rule check_for_Ns_in_qry_DEL_predictions:
        input:
                str(SVPS_QRY_PREFIX + ".DEL.final.coords")
        output:
                str(SVPS_QRY_PREFIX + ".DEL.final.noN.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=QRY_FILTERED,
                qryGenome=REF_FILTERED
        shell:
                "python ./Scripts/check-looped-predictions-for-Ns.py {params} {input} {output}"

rule check_for_Ns_in_qry_DUP_predictions:
        input:
                str(SVPS_QRY_PREFIX + ".DUP.final.coords")
        output:
                str(SVPS_QRY_PREFIX + ".DUP.final.noN.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=QRY_FILTERED,
                qryGenome=REF_FILTERED
        shell:
                "python ./Scripts/check-looped-predictions-for-Ns.py {params} {input} {output}"

rule check_for_Ns_in_qry_INS_predictions:
        input:
                str(SVPS_QRY_PREFIX + ".INS.final.coords")
        output:
                str(SVPS_QRY_PREFIX + ".INS.final.noN.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=QRY_FILTERED,
                qryGenome=REF_FILTERED
        shell:
                "python ./Scripts/check-looped-predictions-for-Ns.py {params} {input} {output}"

rule check_for_Ns_in_qry_INV_predictions:
        input:
                str(SVPS_QRY_PREFIX + ".INV.final.coords")
        output:
                str(SVPS_QRY_PREFIX + ".INV.final.noN.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=QRY_FILTERED,
                qryGenome=REF_FILTERED
        shell:
                "python ./Scripts/check-awk-predictions-for-Ns.py {params} {input} {output}"

rule check_for_Ns_in_qry_TRANS_predictions:
        input:
                str(SVPS_QRY_PREFIX + ".TRANS.final.coords")
        output:
                str(SVPS_QRY_PREFIX + ".TRANS.final.noN.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=QRY_FILTERED,
                qryGenome=REF_FILTERED
        shell:
                "python ./Scripts/check-awk-predictions-for-Ns.py {params} {input} {output}"
