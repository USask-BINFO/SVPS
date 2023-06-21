rule nucmer_align_qry_to_ref:
        input:
                filteredRef=REF_FILTERED,
                filteredQry=QRY_FILTERED
        output:
                str(MUMMER_REF_PREFIX + ".delta")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Nucmer.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minMatchSize=config["minMatchLen"],
                minClusterSize=config["minClusterSize"],
                maxExtend=config["maxEntend"],
                mummerPrefix=MUMMER_REF_PREFIX
        shell:
                "nucmer --threads {threads} --maxmatch -l {params.minMatchSize} -c {params.minClusterSize} -b {params.maxExtend} -p {params.mummerPrefix} {input.filteredRef} {input.filteredQry}"


rule delta_filter_qry_to_ref:
        input:
                str(MUMMER_REF_PREFIX + ".delta")
        output:
                str(MUMMER_REF_PREFIX + ".delta_filter")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/DeltaFilt.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minIdentity=config["minIdentity"],
                minLength=config["minToFilter"]
        shell:
                "delta-filter -m -i {params.minIdentity} -l {params.minLength} {input} > {output}"

rule show_coords_qry_to_ref:
        input:
                str(MUMMER_REF_PREFIX + ".delta_filter")
        output:
                str(MUMMER_REF_PREFIX + ".coords")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/ShowCoords.SVPS.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "show-coords -T -H -r -c -l -d {input} > {output}"

rule reformat_and_sort_mummer_ref_coords:
        input:
                str(MUMMER_REF_PREFIX + ".coords")
        output:
                str(MUMMER_REF_PREFIX + ".reformatted.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/ReformatCoords.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/reformat-and-sort-coords.sh {input} {output}"

rule nucmer_align_ref_to_qry:
        input:
                filteredRef=REF_FILTERED,
                filteredQry=QRY_FILTERED
        output:
                str(MUMMER_QRY_PREFIX + ".delta")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Nucmer.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minMatchSize=config["minMatchLen"],
                minClusterSize=config["minClusterSize"],
                maxExtend=config["maxEntend"],
                mummerPrefix=MUMMER_QRY_PREFIX
        shell:
                "nucmer --threads {threads} --maxmatch -l {params.minMatchSize} -c {params.minClusterSize} -b {params.maxExtend} -p {params.mummerPrefix} {input.filteredQry} {input.filteredRef}"

rule delta_filter_ref_to_qry:
        input:
                str(MUMMER_QRY_PREFIX + ".delta")
        output:
                str(MUMMER_QRY_PREFIX + ".delta_filter")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/DeltaFilt.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minIdentity=config["minIdentity"],
                minLength=config["minToFilter"]
        shell:
                "delta-filter -m -i {params.minIdentity} -l {params.minLength} {input} > {output}"

rule show_coords_ref_to_qry:
        input:
                str(MUMMER_QRY_PREFIX + ".delta_filter")
        output:
                str(MUMMER_QRY_PREFIX + ".coords")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/ShowCoords.SVPS.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "show-coords -T -H -r -c -l -d {input} > {output}"

rule reformat_and_sort_mummer_qry_coords:
        input:
                str(MUMMER_QRY_PREFIX + ".coords")
        output:
                str(MUMMER_QRY_PREFIX + ".reformatted.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/ReformatCoords.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/reformat-and-sort-coords.sh {input} {output}"

rule show_coords_ref_to_qry_syri:
        input:
                str(MUMMER_QRY_PREFIX + ".delta_filter")
        output:
                str(MUMMER_QRY_PREFIX + ".syri.coords")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/ShowCoords.SyRI.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "show-coords -THrd {input} > {output}"

rule show_coords_qry_to_ref_syri:
        input:
                str(MUMMER_REF_PREFIX + ".delta_filter")
        output:
                str(MUMMER_REF_PREFIX + ".syri.coords")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/ShowCoords.SyRI.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "show-coords -THrd {input} > {output}"
