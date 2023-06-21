rule evaluate_svps_w_syri_mummer_sml:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Sml.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Sml.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Sml.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Sml.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Sml.bed"), 
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.Sml.bed"),                                  
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.Sml.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.Sml.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.Sml.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Sml.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DEL.Sml.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INS.Sml.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DUP.Sml.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INV.Sml.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.TRANS.Sml.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Sml.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Sml.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Sml.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Sml.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Sml.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_svps_w_syri_minimap_sml:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Sml.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Sml.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Sml.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Sml.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Sml.bed"),
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.Sml.bed"),
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.Sml.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.Sml.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.Sml.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Sml.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DEL.Sml.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INS.Sml.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DUP.Sml.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INV.Sml.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.TRANS.Sml.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Sml.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Sml.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Sml.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Sml.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Sml.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_w_svps_sml:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Sml.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Sml.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Sml.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Sml.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Sml.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.Sml.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.Sml.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.Sml.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.Sml.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.Sml.bed"),
                toolTwoDEL=str(SVPS_REF_PREFIX + ".DEL.Sml.bed"),
                toolTwoINS=str(SVPS_REF_PREFIX + ".INS.Sml.bed"),
                toolTwoDUP=str(SVPS_REF_PREFIX + ".DUP.Sml.bed"),
                toolTwoINV=str(SVPS_REF_PREFIX + ".INV.Sml.bed"),
                toolTwoTRANS=str(SVPS_REF_PREFIX + ".TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Sml.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_w_syri_mummer_sml:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DEL.Sml.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INS.Sml.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DUP.Sml.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INV.Sml.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.TRANS.Sml.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DEL.Sml.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INS.Sml.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DUP.Sml.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INV.Sml.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.TRANS.Sml.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Sml.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Sml.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Sml.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Sml.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Sml.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_w_syri_minimap_sml:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DEL.Sml.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INS.Sml.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DUP.Sml.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INV.Sml.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.TRANS.Sml.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DEL.Sml.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INS.Sml.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DUP.Sml.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INV.Sml.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.TRANS.Sml.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Sml.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Sml.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Sml.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Sml.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Sml.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_syri_mummer_w_syri_minimap_sml:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Sml.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Sml.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Sml.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Sml.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Sml.bed"),
                toolOneDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Sml.bed"),
                toolOneINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Sml.bed"),
                toolOneDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Sml.bed"),
                toolOneINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Sml.bed"),
                toolOneTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Sml.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DEL.Sml.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INS.Sml.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DUP.Sml.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INV.Sml.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.TRANS.Sml.bed"),
                toolTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Sml.bed"),
                toolTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Sml.bed"),
                toolTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Sml.bed"),
                toolTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Sml.bed"),
                toolTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Sml.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_svps_syri_mummer_syri_minimap_sml:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DEL.Sml.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INS.Sml.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DUP.Sml.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INV.Sml.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.TRANS.Sml.bed"),
                toolOneDEL=str(SVPS_REF_PREFIX + ".DEL.Sml.bed"),
                toolOneINS=str(SVPS_REF_PREFIX + ".INS.Sml.bed"),
                toolOneDUP=str(SVPS_REF_PREFIX + ".DUP.Sml.bed"),
                toolOneINV=str(SVPS_REF_PREFIX + ".INV.Sml.bed"),
                toolOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Sml.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Sml.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Sml.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Sml.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Sml.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Sml.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Sml.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Sml.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Sml.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Sml.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Sml.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_syri_mummer_syri_minimap_sml:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DEL.Sml.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INS.Sml.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DUP.Sml.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INV.Sml.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.TRANS.Sml.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Sml.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Sml.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Sml.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Sml.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Sml.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Sml.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Sml.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Sml.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Sml.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Sml.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_svps_syri_minimap_sml:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DEL.Sml.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INS.Sml.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DUP.Sml.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INV.Sml.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.TRANS.Sml.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DEL.Sml.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INS.Sml.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DUP.Sml.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INV.Sml.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.TRANS.Sml.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Sml.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Sml.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Sml.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Sml.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Sml.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_svps_syri_mummer_sml:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DEL.Sml.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INS.Sml.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DUP.Sml.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INV.Sml.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.TRANS.Sml.bed"),
                toolOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                toolOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                toolOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                toolOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                toolOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DEL.Sml.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INS.Sml.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DUP.Sml.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INV.Sml.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.TRANS.Sml.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Sml.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Sml.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Sml.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Sml.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Sml.benchmarking.tsv"), BENCH_REPEAT)
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

rule evaluate_mumco_svps_syri_minimap_syri_mummer_sml:
        input:
                interOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DEL.Sml.bed"),
                interOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INS.Sml.bed"),
                interOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DUP.Sml.bed"),
                interOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INV.Sml.bed"),
                interOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.TRANS.Sml.bed"),
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Sml.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Sml.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Sml.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Sml.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Sml.bed"),
                interTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Sml.bed"),
                interTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Sml.bed"),
                interTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Sml.bed"),
                interTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Sml.bed"),
                interTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Sml.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Sml.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Sml.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Sml.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Sml.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Sml.benchmarking.tsv"), BENCH_REPEAT)
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
