rule bedtools_intersect_svps_w_syri_mummer_Sml_ref:
        input:
                setOneDEL=str(SVPS_REF_PREFIX + ".DEL.Sml.bed"),
                setOneINS=str(SVPS_REF_PREFIX + ".INS.Sml.bed"),
                setOneDUP=str(SVPS_REF_PREFIX + ".DUP.Sml.bed"),
                setOneINV=str(SVPS_REF_PREFIX + ".INV.Sml.bed"),
                setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Sml.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Sml.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Sml.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Sml.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Sml.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Sml.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Sml.bed"),

                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.TRANS.Sml.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Sml"

               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneDEL} -b {input.setTwoDEL} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.DEL.Sml.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneINS} -b {input.setTwoINS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.INS.Sml.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneDUP} -b {input.setTwoDUP} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.DUP.Sml.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneINV} -b {input.setTwoINV} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.INV.Sml.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneTRANS} -b {input.setTwoTRANS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.TRANS.Sml.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneDEL} -b {input.setTwoDEL} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.DEL.Sml.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneINS} -b {input.setTwoINS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.INS.Sml.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneDUP} -b {input.setTwoDUP} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.DUP.Sml.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneINV} -b {input.setTwoINV} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.INV.Sml.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneTRANS} -b {input.setTwoTRANS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.TRANS.Sml.bed"

rule bedtools_intersect_svps_w_syri_minimap_Sml_ref:
        input:
                setOneDEL=str(SVPS_REF_PREFIX + ".DEL.Sml.bed"),
                setOneINS=str(SVPS_REF_PREFIX + ".INS.Sml.bed"),
                setOneDUP=str(SVPS_REF_PREFIX + ".DUP.Sml.bed"),
                setOneINV=str(SVPS_REF_PREFIX + ".INV.Sml.bed"),
                setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Sml.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Sml.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Sml.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Sml.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Sml.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Sml.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Sml.bed"),

                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.TRANS.Sml.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Sml"

rule bedtools_intersect_mumco_w_svps_Sml_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                setTwoDEL=str(SVPS_REF_PREFIX + ".DEL.Sml.bed"),
                setTwoINS=str(SVPS_REF_PREFIX + ".INS.Sml.bed"),
                setTwoDUP=str(SVPS_REF_PREFIX + ".DUP.Sml.bed"),
                setTwoINV=str(SVPS_REF_PREFIX + ".INV.Sml.bed"),
                setTwoTRANS=str(SVPS_REF_PREFIX + ".TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Sml.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.Sml.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Sml"

rule bedtools_intersect_mumco_w_syri_mummer_Sml_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Sml.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Sml.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Sml.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Sml.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.TRANS.Sml.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.TRANS.Sml.bed") 
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Sml"

rule bedtools_intersect_mumco_w_syri_minimap_Sml_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Sml.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Sml.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Sml.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Sml.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Sml.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.TRANS.Sml.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.TRANS.Sml.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Sml"

rule bedtools_intersect_syri_minimap_w_syri_mummer_Sml_ref:
        input:
                setOneDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.Sml.bed"),
                setOneINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.Sml.bed"),
                setOneDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.Sml.bed"),
                setOneINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.Sml.bed"),
                setOneTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.Sml.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.Sml.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.Sml.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.Sml.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.Sml.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.Sml.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Sml.bed"),

                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.TRANS.Sml.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Sml"

rule bedtools_intersect_svps_syri_minimap_syri_mummer_Sml_ref:
        input:
                setOneDEL=str(SVPS_REF_PREFIX + ".DEL.Sml.bed"),
                setOneINS=str(SVPS_REF_PREFIX + ".INS.Sml.bed"),
                setOneDUP=str(SVPS_REF_PREFIX + ".DUP.Sml.bed"),
                setOneINV=str(SVPS_REF_PREFIX + ".INV.Sml.bed"),
                setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.Sml.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Sml.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Sml.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Sml.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Sml.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Sml.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.TRANS.Sml.bed"),

                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Sml.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Sml"

rule bedtools_intersect_mumco_syri_minimap_syri_mummer_Sml_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Sml.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Sml.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Sml.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Sml.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Sml.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.TRANS.Sml.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Sml.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Sml"

rule bedtools_intersect_mumco_svps_syri_mummer_Sml_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Sml.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Sml.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Sml.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Sml.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Sml.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.TRANS.Sml.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.TRANS.Sml.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Sml"

rule bedtools_intersect_mumco_svps_syri_minimap_Sml_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.Sml.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.Sml.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.Sml.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.Sml.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.Sml.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Sml.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Sml.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Sml.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Sml.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Sml.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.TRANS.Sml.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.TRANS.Sml.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Sml"

rule bedtools_intersect_mumco_svps_syri_minimap_syri_mummer_Sml_ref:
        input:
                setOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Sml.bed"),
                setOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Sml.bed"),
                setOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Sml.bed"),
                setOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Sml.bed"),
                setOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Sml.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Sml.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Sml.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Sml.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Sml.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Sml.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.TRANS.Sml.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Sml.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Sml.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV Sml;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS Sml"
