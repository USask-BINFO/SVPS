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
                "bash ./Scripts/find-INS-gaps.sh {params.svType} {input} {output} {params.minSize}"

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
                "bash ./Scripts/find-INS-gaps.sh {params.svType} {input} {output} {params.minSize}"

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

rule select_ref_inverted_alignments:
        input:
                str(MUMMER_REF_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_REF_PREFIX + ".INV.align.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/find-invs.sh {input} {output}"

rule find_ref_inversion_locations:
        input:
                coordsFile=str(SVPS_REF_PREFIX + ".INV.align.coords"),
                #refIndex=str(config["refAssembly"] + ".fai"),
                #qryIndex=str(config["qryAssembly"] + ".fai"),
        output:
                str(SVPS_REF_PREFIX + ".INV.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                neighbourSize=config["neighbourSize"],
                simThresh=config["invNeighbourSimilarity"],
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED
        shell:
                "bash ./Scripts/filter-invs-locations.sh {input.coordsFile} {output} {params}" #{input.refIndex} {input.qryIndex}"

rule select_qry_inverted_alignments:
        input:
                str(MUMMER_QRY_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_QRY_PREFIX + ".INV.align.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/find-invs.sh {input} {output}"

rule find_qry_inversion_locations:
        input:
                coordsFile=str(SVPS_QRY_PREFIX + ".INV.align.coords"),
                #refIndex=str(config["qryAssembly"] + ".fai"),
                #qryIndex=str(config["refAssembly"] + ".fai"),
        output:
                str(SVPS_QRY_PREFIX + ".INV.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                neighbourSize=config["neighbourSize"],
                simThresh=config["invNeighbourSimilarity"],
                refGenome=QRY_FILTERED,
                qryGenome=REF_FILTERED                
        shell:
                "bash ./Scripts/filter-invs-locations.sh {input.coordsFile} {output} {params}" #{input.refIndex} {input.qryIndex}"

rule find_ref_non_overlapping_locations:
        input:
                str(MUMMER_REF_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_REF_PREFIX + ".noOverlap.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/find-single-align-regions.sh {input} {output}"

rule filter_ref_non_overlapping_locations:
        input:
                str(SVPS_REF_PREFIX + ".noOverlap.coords")
        output:
                str(SVPS_REF_PREFIX + ".noOverlap.filtered.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["verifyThresholdMax"]
        shell:
                "bash ./Scripts/filter-single-align-regions.sh {input} {output} {params}"

rule find_ref_transloc_locations:
        input:
                #str(MUMMER_REF_PREFIX + ".reformatted.coords")
                str(SVPS_REF_PREFIX + ".noOverlap.filtered.coords")
        output:
                str(SVPS_REF_PREFIX + ".TRANS.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/find-trans.sh {input} {output}"

rule find_ref_transpos_locations:
        input:
                str(SVPS_REF_PREFIX + ".noOverlap.filtered.coords")
        output:
                #str(SVPS_REF_PREFIX + ".TRANSPOS.final.coords")
                str(SVPS_REF_PREFIX + ".noOverlap.filtered.coords.NeighbourAligns")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                neighbourSize=config["neighbourSize"],
                simThresh=config["transposNeighbourSimilarity"],
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED
        shell:
                "bash ./Scripts/find-transpos.sh {input} {output} {params}"

rule filter_ref_transpos_locations:
        input:
                str(SVPS_REF_PREFIX + ".noOverlap.filtered.coords.NeighbourAligns")
        output:
                str(SVPS_REF_PREFIX + ".TRANSPOS.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                simThresh=config["transposNeighbourSimilarity"]
        shell:
                "bash ./Scripts/transpos-filtering.sh {input} {output} {params}"
                
rule find_qry_non_overlapping_locations:
        input:
                str(MUMMER_QRY_PREFIX + ".reformatted.coords")
        output:
                str(SVPS_QRY_PREFIX + ".noOverlap.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/find-single-align-regions.sh {input} {output}"

rule filter_qry_non_overlapping_locations:
        input:
                str(SVPS_QRY_PREFIX + ".noOverlap.coords") 
        output:
                str(SVPS_QRY_PREFIX + ".noOverlap.filtered.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["verifyThresholdMax"]
        shell:
                "bash ./Scripts/filter-single-align-regions.sh {input} {output} {params}"

rule find_qry_transloc_locations:
        input:
                #str(MUMMER_QRY_PREFIX + ".reformatted.coords")
                str(SVPS_QRY_PREFIX + ".noOverlap.filtered.coords")
        output:
                str(SVPS_QRY_PREFIX + ".TRANS.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/find-trans.sh {input} {output}"

rule find_qry_transpos_locations:
        input:
                str(SVPS_QRY_PREFIX + ".noOverlap.filtered.coords")
        output:
                #str(SVPS_QRY_PREFIX + ".TRANSPOS.final.coords")
                str(SVPS_QRY_PREFIX + ".noOverlap.filtered.coords.NeighbourAligns")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                neighbourSize=config["neighbourSize"],
                simThresh=config["transposNeighbourSimilarity"],
                refGenome=QRY_FILTERED,
                qryGenome=REF_FILTERED
        shell:
                "bash ./Scripts/find-transpos.sh {input} {output} {params}"

rule filter_qry_transpos_locations:
        input:
                str(SVPS_QRY_PREFIX + ".noOverlap.filtered.coords.NeighbourAligns")
        output:
                str(SVPS_QRY_PREFIX + ".TRANSPOS.final.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVPS.SVCalling.benchmarking.tsv"), BENCH_REPEAT)
        params:
                simThresh=config["transposNeighbourSimilarity"]
        shell:
                "bash ./Scripts/transpos-filtering.sh {input} {output} {params}"
