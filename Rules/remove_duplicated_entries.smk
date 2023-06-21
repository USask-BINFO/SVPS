rule remove_ref_trans_dup_entries:
        input:
                str(SVPS_REF_PREFIX + ".DUP.coords"),
        output:
                str(SVPS_REF_PREFIX + ".DUP.NoTrans.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/remove-trans-dups.sh {input} {output}"

rule remove_qry_trans_dup_entries:
        input:
                str(SVPS_QRY_PREFIX + ".DUP.coords"),
        output:
                str(SVPS_QRY_PREFIX + ".DUP.NoTrans.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/remove-trans-dups.sh {input} {output}"

rule remove_ref_inv_dup_entries:
        input:
                str(SVPS_REF_PREFIX + ".DUP.NoTrans.coords"),
        output:
                str(SVPS_REF_PREFIX + ".DUP.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/remove-inv-dups.sh {input} {output}"

rule remove_qry_inv_dup_entries:
        input:
                str(SVPS_QRY_PREFIX + ".DUP.NoTrans.coords"),
        output:
                str(SVPS_QRY_PREFIX + ".DUP.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPSCoordFiltering.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/remove-inv-dups.sh {input} {output}"

