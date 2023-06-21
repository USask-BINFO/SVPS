rule evaluate_svps_w_syri_mummer_ssm:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.SSm.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.SSm.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.SSm.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.SSm.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.SSm.bed"), 
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.SSm.bed"),                                  
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.SSm.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.SSm.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.SSm.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.SSm.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DEL.SSm.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INS.SSm.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DUP.SSm.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INV.SSm.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.TRANS.SSm.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.SSm.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.SSm.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.SSm.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.SSm.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.SSm.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_svps_w_syri_minimap_ssm:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.SSm.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.SSm.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.SSm.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.SSm.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.SSm.bed"),
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.SSm.bed"),
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.SSm.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.SSm.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.SSm.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.SSm.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DEL.SSm.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INS.SSm.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DUP.SSm.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INV.SSm.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.TRANS.SSm.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.SSm.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.SSm.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.SSm.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.SSm.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.SSm.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_w_svps_ssm:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.SSm.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.SSm.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.SSm.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.SSm.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.SSm.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.SSm.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.SSm.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.SSm.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.SSm.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.SSm.bed"),
                toolTwoDEL=str(SVPS_REF_PREFIX + ".DEL.SSm.bed"),
                toolTwoINS=str(SVPS_REF_PREFIX + ".INS.SSm.bed"),
                toolTwoDUP=str(SVPS_REF_PREFIX + ".DUP.SSm.bed"),
                toolTwoINV=str(SVPS_REF_PREFIX + ".INV.SSm.bed"),
                toolTwoTRANS=str(SVPS_REF_PREFIX + ".TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.SSm.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_w_syri_mummer_ssm:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DEL.SSm.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INS.SSm.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DUP.SSm.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INV.SSm.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.TRANS.SSm.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DEL.SSm.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INS.SSm.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DUP.SSm.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INV.SSm.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.TRANS.SSm.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.SSm.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.SSm.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.SSm.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.SSm.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.SSm.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_w_syri_minimap_ssm:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DEL.SSm.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INS.SSm.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DUP.SSm.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INV.SSm.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.TRANS.SSm.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DEL.SSm.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INS.SSm.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DUP.SSm.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INV.SSm.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.TRANS.SSm.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.SSm.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.SSm.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.SSm.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.SSm.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.SSm.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_syri_mummer_w_syri_minimap_ssm:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.SSm.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.SSm.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.SSm.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.SSm.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.SSm.bed"),
                toolOneDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.SSm.bed"),
                toolOneINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.SSm.bed"),
                toolOneDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.SSm.bed"),
                toolOneINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.SSm.bed"),
                toolOneTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.SSm.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DEL.SSm.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INS.SSm.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DUP.SSm.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INV.SSm.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.TRANS.SSm.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.SSm.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.SSm.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.SSm.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.SSm.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.SSm.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_svps_syri_mummer_syri_minimap_ssm:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DEL.SSm.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INS.SSm.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DUP.SSm.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INV.SSm.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.TRANS.SSm.bed"),
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.SSm.bed"),
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.SSm.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.SSm.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.SSm.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.SSm.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.SSm.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.SSm.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.SSm.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.SSm.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.SSm.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.SSm.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.SSm.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.SSm.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.SSm.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.SSm.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_syri_mummer_syri_minimap_ssm:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DEL.SSm.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INS.SSm.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DUP.SSm.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INV.SSm.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.TRANS.SSm.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.SSm.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.SSm.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.SSm.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.SSm.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.SSm.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.SSm.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.SSm.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.SSm.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.SSm.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.SSm.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_svps_syri_minimap_ssm:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DEL.SSm.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INS.SSm.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DUP.SSm.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INV.SSm.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.TRANS.SSm.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DEL.SSm.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INS.SSm.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DUP.SSm.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INV.SSm.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.TRANS.SSm.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.SSm.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.SSm.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.SSm.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.SSm.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.SSm.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_svps_syri_mummer_ssm:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DEL.SSm.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INS.SSm.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DUP.SSm.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INV.SSm.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.TRANS.SSm.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DEL.SSm.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INS.SSm.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DUP.SSm.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INV.SSm.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.TRANS.SSm.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.SSm.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.SSm.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.SSm.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.SSm.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.SSm.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_svps_syri_minimap_syri_mummer_ssm:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DEL.SSm.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INS.SSm.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DUP.SSm.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INV.SSm.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.TRANS.SSm.bed"),
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.SSm.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.SSm.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.SSm.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.SSm.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.SSm.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.SSm.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.SSm.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.SSm.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.SSm.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.SSm.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.SSm.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.SSm.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.SSm.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.SSm.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.SSm.benchmarking.tsv"), BENCH_REPEAT)
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
