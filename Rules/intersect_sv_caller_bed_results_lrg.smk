rule bedtools_intersect_svps_w_syri_mummer_Lrg_ref:
        input:
                setOneDEL=str(SVPS_REF_PREFIX + ".DEL.Lrg.bed"),
                setOneINS=str(SVPS_REF_PREFIX + ".INS.Lrg.bed"),
                setOneDUP=str(SVPS_REF_PREFIX + ".DUP.Lrg.bed"),
                setOneINV=str(SVPS_REF_PREFIX + ".INV.Lrg.bed"),
                setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Lrg.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Lrg.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Lrg.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Lrg.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Lrg.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Lrg.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Lrg.bed"),

                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Bedtools.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minOverlap=config["overlapThreshold"],
                outputDir=config["bedtoolsResultsFolder"],
                toolA="SVPS",
                toolB="SYRI-MUM",
                toolsPrefix="SVPS-SYRI-MUM"
        shell:
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Lrg"

#               "bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneDEL} -b {input.setTwoDEL} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.DEL.Lrg.bed;\n"
#               "bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneINS} -b {input.setTwoINS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.INS.Lrg.bed;\n"
#               "bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneDUP} -b {input.setTwoDUP} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.DUP.Lrg.bed;\n"
#               "bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneINV} -b {input.setTwoINV} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.INV.Lrg.bed;\n"
#               "bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneTRANS} -b {input.setTwoTRANS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.TRANS.Lrg.bed;\n"
#               "bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneDEL} -b {input.setTwoDEL} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.DEL.Lrg.bed;\n"
#               "bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneINS} -b {input.setTwoINS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.INS.Lrg.bed;\n"
#               "bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneDUP} -b {input.setTwoDUP} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.DUP.Lrg.bed;\n"
#               "bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneINV} -b {input.setTwoINV} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.INV.Lrg.bed;\n"
#               "bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneTRANS} -b {input.setTwoTRANS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.TRANS.Lrg.bed"

rule bedtools_intersect_svps_w_syri_minimap_Lrg_ref:
        input:
                setOneDEL=str(SVPS_REF_PREFIX + ".DEL.Lrg.bed"),
                setOneINS=str(SVPS_REF_PREFIX + ".INS.Lrg.bed"),
                setOneDUP=str(SVPS_REF_PREFIX + ".DUP.Lrg.bed"),
                setOneINV=str(SVPS_REF_PREFIX + ".INV.Lrg.bed"),
                setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Lrg.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Lrg.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Lrg.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Lrg.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Lrg.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Lrg.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Lrg.bed"),

                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Bedtools.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minOverlap=config["overlapThreshold"],
                outputDir=config["bedtoolsResultsFolder"],
                toolA="SVPS",
                toolB="SYRI-MINI",
                toolsPrefix="SVPS-SYRI-MINI"
        shell:
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Lrg"

rule bedtools_intersect_mumco_w_svps_Lrg_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                setTwoDEL=str(SVPS_REF_PREFIX + ".DEL.Lrg.bed"),
                setTwoINS=str(SVPS_REF_PREFIX + ".INS.Lrg.bed"),
                setTwoDUP=str(SVPS_REF_PREFIX + ".DUP.Lrg.bed"),
                setTwoINV=str(SVPS_REF_PREFIX + ".INV.Lrg.bed"),
                setTwoTRANS=str(SVPS_REF_PREFIX + ".TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Lrg.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Bedtools.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minOverlap=config["overlapThreshold"],
                outputDir=config["bedtoolsResultsFolder"],
                toolA="MUMCO",
                toolB="SVPS",
                toolsPrefix="MUMCO-SVPS"
        shell:
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Lrg"

rule bedtools_intersect_mumco_w_syri_mummer_Lrg_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Lrg.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Lrg.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Lrg.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Lrg.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.TRANS.Lrg.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.TRANS.Lrg.bed") 
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Bedtools.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minOverlap=config["overlapThreshold"],
                outputDir=config["bedtoolsResultsFolder"],
                toolA="MUMCO",
                toolB="SYRI-MUM",
                toolsPrefix="MUMCO-SYRI-MUM"
        shell:
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Lrg"

rule bedtools_intersect_mumco_w_syri_minimap_Lrg_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Lrg.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Lrg.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Lrg.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Lrg.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Lrg.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.TRANS.Lrg.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Bedtools.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minOverlap=config["overlapThreshold"],
                outputDir=config["bedtoolsResultsFolder"],
                toolA="MUMCO",
                toolB="SYRI-MINI",
                toolsPrefix="MUMCO-SYRI-MINI"
        shell:
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Lrg"

rule bedtools_intersect_syri_minimap_w_syri_mummer_Lrg_ref:
        input:
                setOneDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Lrg.bed"),
                setOneINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Lrg.bed"),
                setOneDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Lrg.bed"),
                setOneINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Lrg.bed"),
                setOneTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Lrg.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Lrg.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Lrg.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Lrg.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Lrg.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Lrg.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Lrg.bed"),

                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Bedtools.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minOverlap=config["overlapThreshold"],
                outputDir=config["bedtoolsResultsFolder"],
                toolA="SYRI-MINI",
                toolB="SYRI-MUM",
                toolsPrefix="SYRI-MINI-SYRI-MUM"
        shell:
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Lrg"

rule bedtools_intersect_svps_syri_minimap_syri_mummer_Lrg_ref:
        input:
                setOneDEL=str(SVPS_REF_PREFIX + ".DEL.Lrg.bed"),
                setOneINS=str(SVPS_REF_PREFIX + ".INS.Lrg.bed"),
                setOneDUP=str(SVPS_REF_PREFIX + ".DUP.Lrg.bed"),
                setOneINV=str(SVPS_REF_PREFIX + ".INV.Lrg.bed"),
                setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Lrg.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Lrg.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Lrg.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Lrg.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Lrg.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Lrg.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.TRANS.Lrg.bed"),

                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Bedtools.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minOverlap=config["overlapThreshold"],
                outputDir=config["bedtoolsResultsFolder"],
                toolA="SVPS",
                toolB="SYRI-MINI-SYRI-MUM",
                toolsPrefix="SVPS-SYRI-MINI-SYRI-MUM"
        shell:
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Lrg"

rule bedtools_intersect_mumco_syri_minimap_syri_mummer_Lrg_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Lrg.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Lrg.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Lrg.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Lrg.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Lrg.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.TRANS.Lrg.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Bedtools.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minOverlap=config["overlapThreshold"],
                outputDir=config["bedtoolsResultsFolder"],
                toolA="MUMCO",
                toolB="SYRI-MINI-SYRI-MUM",
                toolsPrefix="MUMCO-SYRI-MINI-SYRI-MUM"
        shell:
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Lrg"

rule bedtools_intersect_mumco_svps_syri_mummer_Lrg_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Lrg.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Lrg.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Lrg.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Lrg.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Lrg.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.TRANS.Lrg.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Bedtools.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minOverlap=config["overlapThreshold"],
                outputDir=config["bedtoolsResultsFolder"],
                toolA="MUMCO",
                toolB="SVPS-SYRI-MUM",
                toolsPrefix="MUMCO-SVPS-SYRI-MUM"
        shell:
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Lrg"

rule bedtools_intersect_mumco_svps_syri_minimap_Lrg_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Lrg.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Lrg.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Lrg.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Lrg.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Lrg.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Lrg.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Lrg.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Lrg.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Lrg.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Lrg.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.TRANS.Lrg.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Bedtools.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minOverlap=config["overlapThreshold"],
                outputDir=config["bedtoolsResultsFolder"],
                toolA="MUMCO",
                toolB="SVPS-SYRI-MINI",
                toolsPrefix="MUMCO-SVPS-SYRI-MINI"
        shell:
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Lrg"

rule bedtools_intersect_mumco_svps_syri_minimap_syri_mummer_Lrg_ref:
        input:
                setOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Lrg.bed"),
                setOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Lrg.bed"),
                setOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Lrg.bed"),
                setOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Lrg.bed"),
                setOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Lrg.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Lrg.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Lrg.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Lrg.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Lrg.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Lrg.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.TRANS.Lrg.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Lrg.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Lrg.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Bedtools.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minOverlap=config["overlapThreshold"],
                outputDir=config["bedtoolsResultsFolder"],
                toolA="MUMCO-SVPS",
                toolB="SYRI-MINI-SYRI-MUM",
                toolsPrefix="MUMCO-SVPS-SYRI-MINI-SYRI-MUM"
        shell:
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Lrg;\n"
                "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Lrg"
