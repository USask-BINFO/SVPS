rule bedtools_intersect_svps_w_syri_mummer_SSm_ref:
        input:
                setOneDEL=str(SVPS_REF_PREFIX + ".DEL.SSm.bed"),
                setOneINS=str(SVPS_REF_PREFIX + ".INS.SSm.bed"),
                setOneDUP=str(SVPS_REF_PREFIX + ".DUP.SSm.bed"),
                setOneINV=str(SVPS_REF_PREFIX + ".INV.SSm.bed"),
                setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.SSm.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.SSm.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.SSm.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.SSm.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.SSm.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.SSm.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.SSm.bed"),

                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.TRANS.SSm.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS SSm"

               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneDEL} -b {input.setTwoDEL} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.DEL.SSm.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneINS} -b {input.setTwoINS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.INS.SSm.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneDUP} -b {input.setTwoDUP} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.DUP.SSm.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneINV} -b {input.setTwoINV} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.INV.SSm.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wa -a {input.setOneTRANS} -b {input.setTwoTRANS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolA}.TRANS.SSm.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneDEL} -b {input.setTwoDEL} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.DEL.SSm.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneINS} -b {input.setTwoINS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.INS.SSm.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneDUP} -b {input.setTwoDUP} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.DUP.SSm.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneINV} -b {input.setTwoINV} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.INV.SSm.bed;\n"
               #"bedtools intersect -f {params.minOverlap} -F {params.minOverlap} -wb -a {input.setOneTRANS} -b {input.setTwoTRANS} | sort -k 1,1 -k 2,2n | uniq > {params.outputDir}/{params.toolsPrefix}/REF/{params.toolB}.TRANS.SSm.bed"

rule bedtools_intersect_svps_w_syri_minimap_SSm_ref:
        input:
                setOneDEL=str(SVPS_REF_PREFIX + ".DEL.SSm.bed"),
                setOneINS=str(SVPS_REF_PREFIX + ".INS.SSm.bed"),
                setOneDUP=str(SVPS_REF_PREFIX + ".DUP.SSm.bed"),
                setOneINV=str(SVPS_REF_PREFIX + ".INV.SSm.bed"),
                setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.SSm.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.SSm.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.SSm.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.SSm.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.SSm.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.SSm.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.SSm.bed"),

                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.TRANS.SSm.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS SSm"

rule bedtools_intersect_mumco_w_svps_SSm_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                setTwoDEL=str(SVPS_REF_PREFIX + ".DEL.SSm.bed"),
                setTwoINS=str(SVPS_REF_PREFIX + ".INS.SSm.bed"),
                setTwoDUP=str(SVPS_REF_PREFIX + ".DUP.SSm.bed"),
                setTwoINV=str(SVPS_REF_PREFIX + ".INV.SSm.bed"),
                setTwoTRANS=str(SVPS_REF_PREFIX + ".TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.SSm.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.SSm.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL SSm\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS SSm"

rule bedtools_intersect_mumco_w_syri_mummer_SSm_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.SSm.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.SSm.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.SSm.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.SSm.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.TRANS.SSm.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.TRANS.SSm.bed") 
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS SSm"

rule bedtools_intersect_mumco_w_syri_minimap_SSm_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.SSm.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.SSm.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.SSm.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.SSm.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.SSm.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.TRANS.SSm.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.TRANS.SSm.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS SSm"

rule bedtools_intersect_syri_minimap_w_syri_mummer_SSm_ref:
        input:
                setOneDEL=str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.SSm.bed"),
                setOneINS=str(SYRI_REF_PREFIX +".syri.minimap.final.INS.SSm.bed"),
                setOneDUP=str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.SSm.bed"),
                setOneINV=str(SYRI_REF_PREFIX +".syri.minimap.final.INV.SSm.bed"),
                setOneTRANS=str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.SSm.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.SSm.bed"),
                setTwoINS=str(SYRI_REF_PREFIX +".syri.mummer.final.INS.SSm.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.SSm.bed"),
                setTwoINV=str(SYRI_REF_PREFIX +".syri.mummer.final.INV.SSm.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.SSm.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.SSm.bed"),

                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.TRANS.SSm.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS SSm"

rule bedtools_intersect_svps_syri_minimap_syri_mummer_SSm_ref:
        input:
                setOneDEL=str(SVPS_REF_PREFIX + ".DEL.SSm.bed"),
                setOneINS=str(SVPS_REF_PREFIX + ".INS.SSm.bed"),
                setOneDUP=str(SVPS_REF_PREFIX + ".DUP.SSm.bed"),
                setOneINV=str(SVPS_REF_PREFIX + ".INV.SSm.bed"),
                setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.SSm.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.SSm.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.SSm.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.SSm.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.SSm.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.SSm.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.TRANS.SSm.bed"),

                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.SSm.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS SSm"

rule bedtools_intersect_mumco_syri_minimap_syri_mummer_SSm_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.SSm.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.SSm.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.SSm.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.SSm.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.SSm.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.TRANS.SSm.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.SSm.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS SSm"

rule bedtools_intersect_mumco_svps_syri_mummer_SSm_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.SSm.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.SSm.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.SSm.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.SSm.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.SSm.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.TRANS.SSm.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.TRANS.SSm.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS SSm"

rule bedtools_intersect_mumco_svps_syri_minimap_SSm_ref:
        input:
                setOneDEL=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DEL.SSm.bed"),
                setOneINS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INS.SSm.bed"),
                setOneDUP=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_DUP.SSm.bed"),
                setOneINV=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_INV.SSm.bed"),
                setOneTRANS=str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME + ".SVs_TRANS.SSm.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.SSm.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.SSm.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.SSm.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.SSm.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.SSm.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.TRANS.SSm.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.TRANS.SSm.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS SSm"

rule bedtools_intersect_mumco_svps_syri_minimap_syri_mummer_SSm_ref:
        input:
                setOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.SSm.bed"),
                setOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.SSm.bed"),
                setOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.SSm.bed"),
                setOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.SSm.bed"),
                setOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.SSm.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.SSm.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.SSm.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.SSm.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.SSm.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.SSm.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.TRANS.SSm.bed"),

                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.SSm.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.SSm.bed")
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
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDEL} {input.setTwoDEL} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DEL SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINS} {input.setTwoINS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INS SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneDUP} {input.setTwoDUP} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} DUP SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneINV} {input.setTwoINV} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} INV SSm;\n"
               "bash ./Scripts/bedtools-intersect-bed-files.sh REF {params.minOverlap} {input.setOneTRANS} {input.setTwoTRANS} {params.outputDir} {params.toolsPrefix} {params.toolA} {params.toolB} TRANS SSm"
