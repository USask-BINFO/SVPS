rule segment_svps_ref_bed_by_size:
        input:
                delInput=str(SVPS_REF_PREFIX + ".DEL.merged.bed"),
                insInput=str(SVPS_REF_PREFIX + ".INS.merged.bed"),
                dupInput=str(SVPS_REF_PREFIX + ".DUP.merged.bed"),
                invInput=str(SVPS_REF_PREFIX + ".INV.merged.bed"),
                transInput=str(SVPS_REF_PREFIX + ".TRANS.merged.bed"),
        output:
                str(SVPS_REF_PREFIX + ".DEL.SSm.bed"),
                str(SVPS_REF_PREFIX + ".DEL.Sml.bed"),
                str(SVPS_REF_PREFIX + ".DEL.Med.bed"),
                str(SVPS_REF_PREFIX + ".DEL.Lrg.bed"),

                str(SVPS_REF_PREFIX + ".INS.SSm.bed"),
                str(SVPS_REF_PREFIX + ".INS.Sml.bed"),
                str(SVPS_REF_PREFIX + ".INS.Med.bed"),
                str(SVPS_REF_PREFIX + ".INS.Lrg.bed"),

                str(SVPS_REF_PREFIX + ".DUP.SSm.bed"),
                str(SVPS_REF_PREFIX + ".DUP.Sml.bed"),
                str(SVPS_REF_PREFIX + ".DUP.Med.bed"),
                str(SVPS_REF_PREFIX + ".DUP.Lrg.bed"),

                str(SVPS_REF_PREFIX + ".INV.SSm.bed"),
                str(SVPS_REF_PREFIX + ".INV.Sml.bed"),
                str(SVPS_REF_PREFIX + ".INV.Med.bed"),
                str(SVPS_REF_PREFIX + ".INV.Lrg.bed"),

                str(SVPS_REF_PREFIX + ".TRANS.SSm.bed"),
                str(SVPS_REF_PREFIX + ".TRANS.Sml.bed"),
                str(SVPS_REF_PREFIX + ".TRANS.Med.bed"),
                str(SVPS_REF_PREFIX + ".TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SegmentSize.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outputPrefix=str(SVPS_REF_PREFIX + ".")
        shell:
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.delInput} DEL {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.insInput} INS {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.dupInput} DUP {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.invInput} INV {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.transInput} TRANS {params.outputPrefix}"

rule segment_svps_qry_bed_by_size:
        input:
                delInput=str(SVPS_QRY_PREFIX + ".DEL.merged.bed"),
                insInput=str(SVPS_QRY_PREFIX + ".INS.merged.bed"),
                dupInput=str(SVPS_QRY_PREFIX + ".DUP.merged.bed"),
                invInput=str(SVPS_QRY_PREFIX + ".INV.merged.bed"),
                transInput=str(SVPS_QRY_PREFIX + ".TRANS.merged.bed"),
        output:
                str(SVPS_QRY_PREFIX + ".DEL.SSm.bed"),
                str(SVPS_QRY_PREFIX + ".DEL.Sml.bed"),
                str(SVPS_QRY_PREFIX + ".DEL.Med.bed"),
                str(SVPS_QRY_PREFIX + ".DEL.Lrg.bed"),

                str(SVPS_QRY_PREFIX + ".INS.SSm.bed"),
                str(SVPS_QRY_PREFIX + ".INS.Sml.bed"),
                str(SVPS_QRY_PREFIX + ".INS.Med.bed"),
                str(SVPS_QRY_PREFIX + ".INS.Lrg.bed"),

                str(SVPS_QRY_PREFIX + ".DUP.SSm.bed"),
                str(SVPS_QRY_PREFIX + ".DUP.Sml.bed"),
                str(SVPS_QRY_PREFIX + ".DUP.Med.bed"),
                str(SVPS_QRY_PREFIX + ".DUP.Lrg.bed"),

                str(SVPS_QRY_PREFIX + ".INV.SSm.bed"),
                str(SVPS_QRY_PREFIX + ".INV.Sml.bed"),
                str(SVPS_QRY_PREFIX + ".INV.Med.bed"),
                str(SVPS_QRY_PREFIX + ".INV.Lrg.bed"),

                str(SVPS_QRY_PREFIX + ".TRANS.SSm.bed"),
                str(SVPS_QRY_PREFIX + ".TRANS.Sml.bed"),
                str(SVPS_QRY_PREFIX + ".TRANS.Med.bed"),
                str(SVPS_QRY_PREFIX + ".TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SegmentSize.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outputPrefix=str(SVPS_QRY_PREFIX + ".")
        shell:
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.delInput} DEL {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.insInput} INS {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.dupInput} DUP {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.invInput} INV {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.transInput} TRANS {params.outputPrefix}"

rule segment_syri_mummer_ref_bed_by_size:
        input:
                delInput=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.bed"),
                insInput=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.bed"),
                dupInput=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.bed"),
                invInput=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.bed"),
                transInput=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.bed"),
        output:
                str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.SSm.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Sml.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Med.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Lrg.bed"),

                str(SYRI_REF_PREFIX +".syri.mummer.final.INS.SSm.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Sml.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Med.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Lrg.bed"),

                str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.SSm.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Sml.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Med.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Lrg.bed"),

                str(SYRI_REF_PREFIX +".syri.mummer.final.INV.SSm.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Sml.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Med.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Lrg.bed"),

                str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.SSm.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Sml.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Med.bed"),
                str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SegmentSize.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outputPrefix=str(SYRI_REF_PREFIX +".syri.mummer.final.")
        shell:
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.delInput} DEL {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.insInput} INS {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.dupInput} DUP {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.invInput} INV {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.transInput} TRANS {params.outputPrefix}"

rule segment_syri_mummer_qry_bed_by_size:
        input:
                delInput=str(SYRI_QRY_PREFIX +".syri.mummer.final.DEL.bed"),
                insInput=str(SYRI_QRY_PREFIX +".syri.mummer.final.INS.bed"),
                dupInput=str(SYRI_QRY_PREFIX +".syri.mummer.final.DUP.bed"),
                invInput=str(SYRI_QRY_PREFIX +".syri.mummer.final.INV.bed"),
                transInput=str(SYRI_QRY_PREFIX +".syri.mummer.final.TRANS.bed"),
        output:
                str(SYRI_QRY_PREFIX +".syri.mummer.final.DEL.SSm.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.DEL.Sml.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.DEL.Med.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.DEL.Lrg.bed"),

                str(SYRI_QRY_PREFIX +".syri.mummer.final.INS.SSm.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.INS.Sml.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.INS.Med.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.INS.Lrg.bed"),

                str(SYRI_QRY_PREFIX +".syri.mummer.final.DUP.SSm.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.DUP.Sml.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.DUP.Med.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.DUP.Lrg.bed"),

                str(SYRI_QRY_PREFIX +".syri.mummer.final.INV.SSm.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.INV.Sml.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.INV.Med.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.INV.Lrg.bed"),

                str(SYRI_QRY_PREFIX +".syri.mummer.final.TRANS.SSm.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.TRANS.Sml.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.TRANS.Med.bed"),
                str(SYRI_QRY_PREFIX +".syri.mummer.final.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SegmentSize.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outputPrefix=str(SYRI_QRY_PREFIX +".syri.mummer.final.")
        shell:
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.delInput} DEL {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.insInput} INS {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.dupInput} DUP {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.invInput} INV {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.transInput} TRANS {params.outputPrefix}"

rule segment_syri_minimap_ref_bed_by_size:
        input:
                delInput=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.bed"),
                insInput=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.bed"),
                dupInput=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.bed"),
                invInput=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.bed"),
                transInput=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.bed"),
        output:
                str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.SSm.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Sml.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Med.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Lrg.bed"),

                str(SYRI_REF_PREFIX +".syri.minimap.final.INS.SSm.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Sml.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Med.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Lrg.bed"),

                str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.SSm.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Sml.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Med.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Lrg.bed"),

                str(SYRI_REF_PREFIX +".syri.minimap.final.INV.SSm.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Sml.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Med.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Lrg.bed"),

                str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.SSm.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Sml.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Med.bed"),
                str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SegmentSize.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outputPrefix=str(SYRI_REF_PREFIX +".syri.minimap.final.")
        shell:
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.delInput} DEL {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.insInput} INS {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.dupInput} DUP {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.invInput} INV {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.transInput} TRANS {params.outputPrefix}"

rule segment_syri_minimap_qry_bed_by_size:
        input:
                delInput=str(SYRI_QRY_PREFIX +".syri.minimap.final.DEL.bed"),
                insInput=str(SYRI_QRY_PREFIX +".syri.minimap.final.INS.bed"),
                dupInput=str(SYRI_QRY_PREFIX +".syri.minimap.final.DUP.bed"),
                invInput=str(SYRI_QRY_PREFIX +".syri.minimap.final.INV.bed"),
                transInput=str(SYRI_QRY_PREFIX +".syri.minimap.final.TRANS.bed"),
        output:
                str(SYRI_QRY_PREFIX +".syri.minimap.final.DEL.SSm.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.DEL.Sml.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.DEL.Med.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.DEL.Lrg.bed"),

                str(SYRI_QRY_PREFIX +".syri.minimap.final.INS.SSm.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.INS.Sml.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.INS.Med.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.INS.Lrg.bed"),

                str(SYRI_QRY_PREFIX +".syri.minimap.final.DUP.SSm.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.DUP.Sml.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.DUP.Med.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.DUP.Lrg.bed"),

                str(SYRI_QRY_PREFIX +".syri.minimap.final.INV.SSm.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.INV.Sml.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.INV.Med.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.INV.Lrg.bed"),

                str(SYRI_QRY_PREFIX +".syri.minimap.final.TRANS.SSm.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.TRANS.Sml.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.TRANS.Med.bed"),
                str(SYRI_QRY_PREFIX +".syri.minimap.final.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SegmentSize.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outputPrefix=str(SYRI_QRY_PREFIX +".syri.minimap.final.")
        shell:
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.delInput} DEL {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.insInput} INS {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.dupInput} DUP {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.invInput} INV {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.transInput} TRANS {params.outputPrefix}"

rule segment_mumco_ref_bed_by_size:
        input:
                delInput=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.bed"),
                insInput=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.bed"),
                dupInput=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.bed"),
                invInput=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.bed"),
                transInput=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.bed")
        output:
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Med.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),

                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Med.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),

                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Med.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),

                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Med.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),

                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Med.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SegmentSize.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outputPrefix=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_")
        shell:
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.delInput} DEL {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.insInput} INS {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.dupInput} DUP {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.invInput} INV {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.transInput} TRANS {params.outputPrefix}"

rule segment_mumco_qry_bed_by_size:
        input:
                delInput=str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_DEL.bed"),
                insInput=str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_INS.bed"),
                dupInput=str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_DUP.bed"),
                invInput=str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_INV.bed"),
                transInput=str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_TRANS.bed")
        output:
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_DEL.Med.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_DEL.Lrg.bed"),

                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_INS.SSm.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_INS.Sml.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_INS.Med.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_INS.Lrg.bed"),

                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_DUP.Med.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_DUP.Lrg.bed"),

                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_INV.SSm.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_INV.Sml.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_INV.Med.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_INV.Lrg.bed"),

                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_TRANS.Med.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SegmentSize.benchmarking.tsv"), BENCH_REPEAT)
        params:
                outputPrefix=str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME + ".SVs_")
        shell:
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.delInput} DEL {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.insInput} INS {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.dupInput} DUP {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.invInput} INV {params.outputPrefix};\n"
                "bash ./Scripts/segment-bed-files-by-sizes.sh {input.transInput} TRANS {params.outputPrefix}"
