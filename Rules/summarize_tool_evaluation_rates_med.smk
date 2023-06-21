rule evaluate_svps_w_syri_mummer_med:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Med.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Med.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Med.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Med.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Med.bed"), 
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.Med.bed"),                                  
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.Med.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.Med.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.Med.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Med.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DEL.Med.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INS.Med.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DUP.Med.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INV.Med.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.TRANS.Med.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Med.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Med.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Med.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Med.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Med.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Med.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="SVPS",
               toolB="SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDEL} {input.interOneDEL} {params.toolB} {input.toolTwoDEL} {input.interTwoDEL} DEL {output} W;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINS} {input.interOneINS} {params.toolB} {input.toolTwoINS} {input.interTwoINS} INS {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDUP} {input.interOneDUP} {params.toolB} {input.toolTwoDUP} {input.interTwoDUP} DUP {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINV} {input.interOneINV} {params.toolB} {input.toolTwoINV} {input.interTwoINV} INV {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneTRANS} {input.interOneTRANS} {params.toolB} {input.toolTwoTRANS} {input.interTwoTRANS} TRANS {output} A;\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svps_w_syri_minimap_med:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Med.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Med.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Med.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Med.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Med.bed"),
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.Med.bed"),
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.Med.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.Med.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.Med.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Med.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DEL.Med.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INS.Med.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DUP.Med.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INV.Med.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.TRANS.Med.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Med.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Med.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Med.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Med.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Med.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Med.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="SVPS",
               toolB="SYRI-MINI"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDEL} {input.interOneDEL} {params.toolB} {input.toolTwoDEL} {input.interTwoDEL} DEL {output} W;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINS} {input.interOneINS} {params.toolB} {input.toolTwoINS} {input.interTwoINS} INS {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDUP} {input.interOneDUP} {params.toolB} {input.toolTwoDUP} {input.interTwoDUP} DUP {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINV} {input.interOneINV} {params.toolB} {input.toolTwoINV} {input.interTwoINV} INV {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneTRANS} {input.interOneTRANS} {params.toolB} {input.toolTwoTRANS} {input.interTwoTRANS} TRANS {output} A;\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_w_svps_med:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Med.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Med.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Med.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Med.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Med.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Med.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Med.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Med.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Med.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Med.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.Med.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.Med.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.Med.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.Med.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.Med.bed"),
                toolTwoDEL=str(SVPS_REF_PREFIX + ".DEL.Med.bed"),
                toolTwoINS=str(SVPS_REF_PREFIX + ".INS.Med.bed"),
                toolTwoDUP=str(SVPS_REF_PREFIX + ".DUP.Med.bed"),
                toolTwoINV=str(SVPS_REF_PREFIX + ".INV.Med.bed"),
                toolTwoTRANS=str(SVPS_REF_PREFIX + ".TRANS.Med.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Med.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="MUMCO",
               toolB="SVPS"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDEL} {input.interOneDEL} {params.toolB} {input.toolTwoDEL} {input.interTwoDEL} DEL {output} W;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINS} {input.interOneINS} {params.toolB} {input.toolTwoINS} {input.interTwoINS} INS {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDUP} {input.interOneDUP} {params.toolB} {input.toolTwoDUP} {input.interTwoDUP} DUP {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINV} {input.interOneINV} {params.toolB} {input.toolTwoINV} {input.interTwoINV} INV {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneTRANS} {input.interOneTRANS} {params.toolB} {input.toolTwoTRANS} {input.interTwoTRANS} TRANS {output} A;\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_w_syri_mummer_med:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DEL.Med.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INS.Med.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DUP.Med.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INV.Med.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.TRANS.Med.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Med.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Med.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Med.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Med.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Med.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DEL.Med.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INS.Med.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DUP.Med.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INV.Med.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.TRANS.Med.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Med.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Med.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Med.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Med.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Med.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Med.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="MUMCO",
               toolB="SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDEL} {input.interOneDEL} {params.toolB} {input.toolTwoDEL} {input.interTwoDEL} DEL {output} W;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINS} {input.interOneINS} {params.toolB} {input.toolTwoINS} {input.interTwoINS} INS {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDUP} {input.interOneDUP} {params.toolB} {input.toolTwoDUP} {input.interTwoDUP} DUP {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINV} {input.interOneINV} {params.toolB} {input.toolTwoINV} {input.interTwoINV} INV {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneTRANS} {input.interOneTRANS} {params.toolB} {input.toolTwoTRANS} {input.interTwoTRANS} TRANS {output} A;\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_w_syri_minimap_med:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DEL.Med.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INS.Med.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DUP.Med.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INV.Med.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.TRANS.Med.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Med.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Med.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Med.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Med.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Med.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DEL.Med.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INS.Med.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DUP.Med.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INV.Med.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.TRANS.Med.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Med.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Med.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Med.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Med.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Med.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Med.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="MUMCO",
               toolB="SYRI-MINI"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDEL} {input.interOneDEL} {params.toolB} {input.toolTwoDEL} {input.interTwoDEL} DEL {output} W;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINS} {input.interOneINS} {params.toolB} {input.toolTwoINS} {input.interTwoINS} INS {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDUP} {input.interOneDUP} {params.toolB} {input.toolTwoDUP} {input.interTwoDUP} DUP {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINV} {input.interOneINV} {params.toolB} {input.toolTwoINV} {input.interTwoINV} INV {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneTRANS} {input.interOneTRANS} {params.toolB} {input.toolTwoTRANS} {input.interTwoTRANS} TRANS {output} A;\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_syri_mummer_w_syri_minimap_med:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Med.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Med.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Med.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Med.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Med.bed"),
                toolOneDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Med.bed"),
                toolOneINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Med.bed"),
                toolOneDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Med.bed"),
                toolOneINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Med.bed"),
                toolOneTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Med.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DEL.Med.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INS.Med.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DUP.Med.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INV.Med.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.TRANS.Med.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Med.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Med.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Med.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Med.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Med.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Med.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="SYRI-MINI",
               toolB="SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDEL} {input.interOneDEL} {params.toolB} {input.toolTwoDEL} {input.interTwoDEL} DEL {output} W;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINS} {input.interOneINS} {params.toolB} {input.toolTwoINS} {input.interTwoINS} INS {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDUP} {input.interOneDUP} {params.toolB} {input.toolTwoDUP} {input.interTwoDUP} DUP {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINV} {input.interOneINV} {params.toolB} {input.toolTwoINV} {input.interTwoINV} INV {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneTRANS} {input.interOneTRANS} {params.toolB} {input.toolTwoTRANS} {input.interTwoTRANS} TRANS {output} A;\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svps_syri_mummer_syri_minimap_med:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DEL.Med.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INS.Med.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DUP.Med.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INV.Med.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.TRANS.Med.bed"),
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.Med.bed"),
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.Med.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.Med.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.Med.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Med.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Med.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Med.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Med.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Med.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Med.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Med.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Med.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Med.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Med.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Med.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Med.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="SVPS",
               toolB="SYRI-MINI-SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDEL} {input.interOneDEL} {params.toolB} {input.toolTwoDEL} {input.interTwoDEL} DEL {output} W;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINS} {input.interOneINS} {params.toolB} {input.toolTwoINS} {input.interTwoINS} INS {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDUP} {input.interOneDUP} {params.toolB} {input.toolTwoDUP} {input.interTwoDUP} DUP {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINV} {input.interOneINV} {params.toolB} {input.toolTwoINV} {input.interTwoINV} INV {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneTRANS} {input.interOneTRANS} {params.toolB} {input.toolTwoTRANS} {input.interTwoTRANS} TRANS {output} A;\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_syri_mummer_syri_minimap_med:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DEL.Med.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INS.Med.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DUP.Med.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INV.Med.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.TRANS.Med.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Med.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Med.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Med.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Med.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Med.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Med.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Med.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Med.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Med.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Med.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Med.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Med.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Med.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Med.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Med.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Med.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="MUMCO",
               toolB="SYRI-MINI-SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDEL} {input.interOneDEL} {params.toolB} {input.toolTwoDEL} {input.interTwoDEL} DEL {output} W;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINS} {input.interOneINS} {params.toolB} {input.toolTwoINS} {input.interTwoINS} INS {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDUP} {input.interOneDUP} {params.toolB} {input.toolTwoDUP} {input.interTwoDUP} DUP {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINV} {input.interOneINV} {params.toolB} {input.toolTwoINV} {input.interTwoINV} INV {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneTRANS} {input.interOneTRANS} {params.toolB} {input.toolTwoTRANS} {input.interTwoTRANS} TRANS {output} A;\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_svps_syri_minimap_med:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DEL.Med.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INS.Med.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DUP.Med.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INV.Med.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.TRANS.Med.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Med.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Med.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Med.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Med.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Med.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DEL.Med.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INS.Med.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DUP.Med.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INV.Med.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.TRANS.Med.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Med.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Med.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Med.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Med.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Med.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Med.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="MUMCO",
               toolB="SVPS-SYRI-MINI"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDEL} {input.interOneDEL} {params.toolB} {input.toolTwoDEL} {input.interTwoDEL} DEL {output} W;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINS} {input.interOneINS} {params.toolB} {input.toolTwoINS} {input.interTwoINS} INS {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDUP} {input.interOneDUP} {params.toolB} {input.toolTwoDUP} {input.interTwoDUP} DUP {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINV} {input.interOneINV} {params.toolB} {input.toolTwoINV} {input.interTwoINV} INV {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneTRANS} {input.interOneTRANS} {params.toolB} {input.toolTwoTRANS} {input.interTwoTRANS} TRANS {output} A;\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_svps_syri_mummer_med:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DEL.Med.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INS.Med.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DUP.Med.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INV.Med.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.TRANS.Med.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Med.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Med.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Med.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Med.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Med.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DEL.Med.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INS.Med.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DUP.Med.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INV.Med.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.TRANS.Med.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Med.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Med.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Med.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Med.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Med.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Med.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="MUMCO",
               toolB="SVPS-SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDEL} {input.interOneDEL} {params.toolB} {input.toolTwoDEL} {input.interTwoDEL} DEL {output} W;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINS} {input.interOneINS} {params.toolB} {input.toolTwoINS} {input.interTwoINS} INS {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDUP} {input.interOneDUP} {params.toolB} {input.toolTwoDUP} {input.interTwoDUP} DUP {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINV} {input.interOneINV} {params.toolB} {input.toolTwoINV} {input.interTwoINV} INV {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneTRANS} {input.interOneTRANS} {params.toolB} {input.toolTwoTRANS} {input.interTwoTRANS} TRANS {output} A;\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_svps_syri_minimap_syri_mummer_med:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DEL.Med.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INS.Med.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DUP.Med.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INV.Med.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.TRANS.Med.bed"),
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Med.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Med.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Med.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Med.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Med.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Med.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Med.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Med.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Med.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Med.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Med.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Med.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Med.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Med.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Med.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Med.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="MUMCO-SVPS",
               toolB="SYRI-MINI-SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDEL} {input.interOneDEL} {params.toolB} {input.toolTwoDEL} {input.interTwoDEL} DEL {output} W;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINS} {input.interOneINS} {params.toolB} {input.toolTwoINS} {input.interTwoINS} INS {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneDUP} {input.interOneDUP} {params.toolB} {input.toolTwoDUP} {input.interTwoDUP} DUP {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneINV} {input.interOneINV} {params.toolB} {input.toolTwoINV} {input.interTwoINV} INV {output} A;\n"
                "bash ./Scripts/calculate-iou-from-bedtools-pair.sh {params.toolA} {input.toolOneTRANS} {input.interOneTRANS} {params.toolB} {input.toolTwoTRANS} {input.interTwoTRANS} TRANS {output} A;\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"
