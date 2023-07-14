rule filter_ref_syri_mummer_headers:
        input:
                str(SYRI_REF_PREFIX + ".syri.mummer.out")
        output:
                str(SYRI_REF_PREFIX + ".syri.mummer.final.out")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outFile=str(SYRI_REF_PREFIX + ".mummer.filtered.out"),
                tempFile=str(SYRI_REF_PREFIX + ".syri.mummer.temp.out"),
                matchFile=str(SYRI_REF_PREFIX + ".mummer.matching.out"),
                finalFile=str(SYRI_REF_PREFIX + ".syri.mummer.final.out")
        shell:
                "bash ./Scripts/filter-syri-columns.sh {input} {params}"

rule filter_qry_syri_mummer_headers:
        input:
                str(SYRI_QRY_PREFIX + ".syri.mummer.out")
        output:
                str(SYRI_QRY_PREFIX + ".syri.mummer.final.out")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outFile=str(SYRI_QRY_PREFIX + ".mummer.filtered.out"),
                tempFile=str(SYRI_QRY_PREFIX + ".syri.mummer.temp.out"),
                matchFile=str(SYRI_QRY_PREFIX + ".mummer.matching.out"),
                finalFile=str(SYRI_QRY_PREFIX + ".syri.mummer.final.out")
        shell:
                "bash ./Scripts/filter-syri-columns.sh {input} {params}"

rule filter_ref_syri_minimap_headers:
        input:
                str(SYRI_REF_PREFIX + ".syri.minimap.out")
        output:
                str(SYRI_REF_PREFIX + ".syri.minimap.final.out") 
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outFile=str(SYRI_REF_PREFIX + ".minimap.filtered.out"),
                tempFile=str(SYRI_REF_PREFIX + ".syri.minimap.temp.out"),
                matchFile=str(SYRI_REF_PREFIX + ".minimap.matching.out"),
                finalFilePrefix=str(SYRI_REF_PREFIX + ".syri.minimap.final.out")
        shell:
                "bash ./Scripts/filter-syri-columns.sh {input} {params}"

rule filter_qry_syri_minimap_headers:
        input:
                str(SYRI_QRY_PREFIX + ".syri.minimap.out")
        output:
                str(SYRI_QRY_PREFIX + ".syri.minimap.final.out") 
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outFile=str(SYRI_QRY_PREFIX + ".minimap.filtered.out"),
                tempFile=str(SYRI_QRY_PREFIX + ".syri.minimap.temp.out"),
                matchFile=str(SYRI_QRY_PREFIX + ".minimap.matching.out"),
                finalFilePrefix=str(SYRI_QRY_PREFIX + ".syri.minimap.final.out")
        shell:
                "bash ./Scripts/filter-syri-columns.sh {input} {params}"

rule extract_ref_syri_mummer_bed_columns:
        input:
                str(SYRI_REF_PREFIX + ".syri.mummer.final.out")
        output:
                str(SYRI_REF_PREFIX +".syri.mummer.final.sorted.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tempFile=str(SYRI_REF_PREFIX +".syri.mummer.temp.bed"),
                maxDist=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-syri-bed-columns.sh {input} {params.tempFile} {output} {params.maxDist}"

rule extract_qry_syri_mummer_bed_columns:
        input:
                str(SYRI_QRY_PREFIX + ".syri.mummer.final.out")
        output:
                str(SYRI_QRY_PREFIX +".syri.mummer.final.sorted.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tempFile=str(SYRI_QRY_PREFIX +".syri.mummer.temp.bed"),
                maxDist=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-syri-bed-columns.sh {input} {params.tempFile} {output} {params.maxDist}"

rule extract_ref_syri_minimap_bed_columns:
        input:
                str(SYRI_REF_PREFIX + ".syri.minimap.final.out")
        output:
                str(SYRI_REF_PREFIX +".syri.minimap.final.sorted.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tempFile=str(SYRI_REF_PREFIX +".syri.minimap.temp.bed"),
                maxDist=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-syri-bed-columns.sh {input} {params.tempFile} {output} {params.maxDist}"

rule extract_qry_syri_minimap_bed_columns:
        input:
                str(SYRI_QRY_PREFIX + ".syri.minimap.final.out")
        output:
                str(SYRI_QRY_PREFIX +".syri.minimap.final.sorted.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tempFile=str(SYRI_QRY_PREFIX +".syri.minimap.temp.bed"),
                maxDist=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-syri-bed-columns.sh {input} {params.tempFile} {output} {params.maxDist}"

rule segment_ref_syri_mummer_headers:
        input:
                formattedInput=str(SYRI_REF_PREFIX + ".syri.mummer.final.out"),
                bedInput=str(SYRI_REF_PREFIX +".syri.mummer.final.sorted.bed")
        output:
                str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.INS.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.INV.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.TRANSPOS.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(SYRI_REF_PREFIX +".syri.mummer.final."),
                config["maxDistApart"]
        shell:
                "bash ./Scripts/segment-wga-tool-bed-outputs.sh {input.bedInput} {params}"

rule segment_qry_syri_mummer_headers:
        input:
                formattedInput=str(SYRI_QRY_PREFIX + ".syri.mummer.final.out"),
                bedInput=str(SYRI_QRY_PREFIX +".syri.mummer.final.sorted.bed")
        output:
                str(SYRI_QRY_PREFIX +".syri.mummer.final.DEL.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.INS.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.DUP.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.INV.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.TRANS.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.TRANSPOS.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(SYRI_QRY_PREFIX +".syri.mummer.final."),
                config["maxDistApart"]
        shell:
                "bash ./Scripts/segment-wga-tool-bed-outputs.sh {input.bedInput} {params}"

rule segment_ref_syri_minimap_headers:
        input:
                formattedInput=str(SYRI_REF_PREFIX + ".syri.minimap.final.out"),
                bedInput=str(SYRI_REF_PREFIX +".syri.minimap.final.sorted.bed")
        output:
                str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.INS.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.INV.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.TRANSPOS.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(SYRI_REF_PREFIX +".syri.minimap.final."),
                config["maxDistApart"]
        shell:
                "bash ./Scripts/segment-wga-tool-bed-outputs.sh {input.bedInput} {params}"

rule segment_qry_syri_minimap_headers:
        input:
                formattedInput=str(SYRI_QRY_PREFIX + ".syri.minimap.final.out"),
                bedInput=str(SYRI_QRY_PREFIX +".syri.minimap.final.sorted.bed")
        output:
                str(SYRI_QRY_PREFIX +".syri.minimap.final.DEL.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.INS.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.DUP.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.INV.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.TRANS.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.TRANSPOS.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SyRIFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(SYRI_QRY_PREFIX +".syri.minimap.final."),
                config["maxDistApart"]
        shell:
                "bash ./Scripts/segment-wga-tool-bed-outputs.sh {input.bedInput} {params}"

rule filter_mumco_w_ref:
        input:
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME +"_output/" + REF_SAMP_NAME +".SVs_all.tsv")
        output:
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME +"_output/" + REF_SAMP_NAME + ".SVs_ALL.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/MUMCOFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tempFile=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".temp.bed"),
                maxDist=config["maxDistApart"]
        shell:
                "bash ./Scripts/filter-mumco-columns.sh {input} {params.tempFile} {output} {params.maxDist}"

rule filter_mumco_w_qry:
        input:
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_all.tsv")
        output:
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_ALL.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/MUMCOFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tempFile=str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".temp.bed"),
                maxDist=config["maxDistApart"]
        shell:
                "bash ./Scripts/filter-mumco-columns.sh {input} {params.tempFile} {output} {params.maxDist}"

rule segment_ref_mumco_headers:
        input:
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME +"_output/" + REF_SAMP_NAME + ".SVs_ALL.bed")
        output:
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/MUMCOFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME +".SVs_")
        shell:
                "bash ./Scripts/segment-wga-tool-bed-outputs.sh {input} {params}"

rule segment_qry_mumco_headers:
        input:
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_ALL.bed")
        output:
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_DEL.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_INS.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_DUP.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_INV.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_TRANS.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/MUMCOFiltering.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_")
        shell:
                "bash ./Scripts/segment-wga-tool-bed-outputs.sh {input} {params}"
