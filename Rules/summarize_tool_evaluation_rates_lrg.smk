rule evaluate_svps_w_syri_mummer_lrg:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Lrg.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Lrg.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Lrg.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Lrg.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Lrg.bed"), 
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.Lrg.bed"),                                  
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.Lrg.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.Lrg.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.Lrg.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Lrg.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DEL.Lrg.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INS.Lrg.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DUP.Lrg.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INV.Lrg.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.TRANS.Lrg.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Lrg.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Lrg.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Lrg.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Lrg.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_svps_w_syri_minimap_lrg:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Lrg.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Lrg.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Lrg.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Lrg.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Lrg.bed"),
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.Lrg.bed"),
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.Lrg.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.Lrg.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.Lrg.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Lrg.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DEL.Lrg.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INS.Lrg.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DUP.Lrg.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INV.Lrg.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.TRANS.Lrg.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Lrg.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Lrg.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Lrg.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Lrg.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_w_svps_lrg:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Lrg.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Lrg.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Lrg.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Lrg.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Lrg.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.Lrg.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.Lrg.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.Lrg.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.Lrg.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.Lrg.bed"),
                toolTwoDEL=str(SVPS_REF_PREFIX + ".DEL.Lrg.bed"),
                toolTwoINS=str(SVPS_REF_PREFIX + ".INS.Lrg.bed"),
                toolTwoDUP=str(SVPS_REF_PREFIX + ".DUP.Lrg.bed"),
                toolTwoINV=str(SVPS_REF_PREFIX + ".INV.Lrg.bed"),
                toolTwoTRANS=str(SVPS_REF_PREFIX + ".TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_w_syri_mummer_lrg:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DEL.Lrg.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INS.Lrg.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DUP.Lrg.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INV.Lrg.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.TRANS.Lrg.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DEL.Lrg.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INS.Lrg.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DUP.Lrg.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INV.Lrg.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.TRANS.Lrg.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Lrg.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Lrg.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Lrg.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Lrg.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_w_syri_minimap_lrg:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DEL.Lrg.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INS.Lrg.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DUP.Lrg.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INV.Lrg.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.TRANS.Lrg.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DEL.Lrg.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INS.Lrg.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DUP.Lrg.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INV.Lrg.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.TRANS.Lrg.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Lrg.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Lrg.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Lrg.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Lrg.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_syri_mummer_w_syri_minimap_lrg:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Lrg.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Lrg.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Lrg.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Lrg.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Lrg.bed"),
                toolOneDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Lrg.bed"),
                toolOneINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Lrg.bed"),
                toolOneDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Lrg.bed"),
                toolOneINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Lrg.bed"),
                toolOneTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Lrg.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DEL.Lrg.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INS.Lrg.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DUP.Lrg.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INV.Lrg.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.TRANS.Lrg.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Lrg.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Lrg.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Lrg.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Lrg.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_svps_syri_mummer_syri_minimap_lrg:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DEL.Lrg.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INS.Lrg.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DUP.Lrg.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INV.Lrg.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.TRANS.Lrg.bed"),
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.Lrg.bed"),
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.Lrg.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.Lrg.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.Lrg.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Lrg.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Lrg.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Lrg.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Lrg.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Lrg.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Lrg.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Lrg.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Lrg.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Lrg.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Lrg.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_syri_mummer_syri_minimap_lrg:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DEL.Lrg.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INS.Lrg.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DUP.Lrg.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INV.Lrg.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.TRANS.Lrg.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Lrg.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Lrg.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Lrg.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Lrg.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Lrg.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Lrg.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Lrg.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Lrg.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Lrg.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_svps_syri_minimap_lrg:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DEL.Lrg.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INS.Lrg.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DUP.Lrg.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INV.Lrg.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.TRANS.Lrg.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DEL.Lrg.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INS.Lrg.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DUP.Lrg.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INV.Lrg.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.TRANS.Lrg.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Lrg.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Lrg.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Lrg.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Lrg.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_svps_syri_mummer_lrg:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DEL.Lrg.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INS.Lrg.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DUP.Lrg.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INV.Lrg.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.TRANS.Lrg.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DEL.Lrg.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INS.Lrg.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DUP.Lrg.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INV.Lrg.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.TRANS.Lrg.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Lrg.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Lrg.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Lrg.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Lrg.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_svps_syri_minimap_syri_mummer_lrg:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DEL.Lrg.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INS.Lrg.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DUP.Lrg.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INV.Lrg.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.TRANS.Lrg.bed"),
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Lrg.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Lrg.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Lrg.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Lrg.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Lrg.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Lrg.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Lrg.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Lrg.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Lrg.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Lrg.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Lrg.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Lrg.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Lrg.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Lrg.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
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
