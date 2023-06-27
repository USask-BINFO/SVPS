rule bedtools_intersect_ref_mumco_w_svps:
        input:
                setOneDEL=str(MUMCO_REF_PREFIX + ".DEL.bed"),
                setOneINS=str(MUMCO_REF_PREFIX + ".INS.bed"),
                setOneDUP=str(MUMCO_REF_PREFIX + ".DUP.bed"),
                setOneINV=str(MUMCO_REF_PREFIX + ".INV.bed"),
                setOneTRANS=str(MUMCO_REF_PREFIX + ".TRANS.bed"),
                setTwoDEL=str(SVPS_REF_PREFIX + ".DEL.bed"),
                setTwoINS=str(SVPS_REF_PREFIX + ".INS.bed"),
                setTwoDUP=str(SVPS_REF_PREFIX + ".DUP.bed"),
                setTwoINV=str(SVPS_REF_PREFIX + ".INV.bed"),
                setTwoTRANS=str(SVPS_REF_PREFIX + ".TRANS.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.intersect.bed")
        threads: 1
        params:
                toolOne="MUMCO",
                toolTwo="SVPS",
                setOnePrefix=MUMCO_REF_PREFIX,
                setTwoPrefix=SVPS_REF_PREFIX,
                bedtoolsDir=config["bedtoolsResultsFolder"],
                toolsPrefix="MUMCO-SVPS",
                minOverlap=config["overlapThreshold"],
        shell:
                "bash ./Scripts/compare-tools-w-bedtool-intersect.sh {params.toolOne} {params.setOnePrefix} {params.toolTwo} {params.setTwoPrefix} {params.bedtoolsDir}/{params.toolsPrefix}.REF {params.minOverlap}"

rule bedtools_intersect_qry_mumco_w_svps:
        input:
                setOneDEL=str(MUMCO_QRY_PREFIX + ".DEL.bed"),
                setOneINS=str(MUMCO_QRY_PREFIX + ".INS.bed"),
                setOneDUP=str(MUMCO_QRY_PREFIX + ".DUP.bed"),
                setOneINV=str(MUMCO_QRY_PREFIX + ".INV.bed"),
                setOneTRANS=str(MUMCO_QRY_PREFIX + ".TRANS.bed"),
                setTwoDEL=str(SVPS_QRY_PREFIX + ".DEL.bed"),
                setTwoINS=str(SVPS_QRY_PREFIX + ".INS.bed"),
                setTwoDUP=str(SVPS_QRY_PREFIX + ".DUP.bed"),
                setTwoINV=str(SVPS_QRY_PREFIX + ".INV.bed"),
                setTwoTRANS=str(SVPS_QRY_PREFIX + ".TRANS.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/MUMCO.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/MUMCO.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/MUMCO.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/MUMCO.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/MUMCO.TRANS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/SVPS.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/SVPS.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/SVPS.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/SVPS.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/SVPS.TRANS.intersect.bed")
        threads: 1
        params:
                toolOne="MUMCO",
                toolTwo="SVPS",
                setOnePrefix=MUMCO_QRY_PREFIX,
                setTwoPrefix=SVPS_QRY_PREFIX,
                bedtoolsDir=config["bedtoolsResultsFolder"],
                toolsPrefix="MUMCO-SVPS",
                minOverlap=config["overlapThreshold"],
        shell:
                "bash ./Scripts/compare-tools-w-bedtool-intersect.sh {params.toolOne} {params.setOnePrefix} {params.toolTwo} {params.setTwoPrefix} {params.bedtoolsDir}/{params.toolsPrefix}.QRY {params.minOverlap}"

rule bedtools_intersect_ref_mumco_w_syri:
        input:
                setOneDEL=str(MUMCO_REF_PREFIX + ".DEL.bed"),
                setOneINS=str(MUMCO_REF_PREFIX + ".INS.bed"),
                setOneDUP=str(MUMCO_REF_PREFIX + ".DUP.bed"),
                setOneINV=str(MUMCO_REF_PREFIX + ".INV.bed"),
                setOneTRANS=str(MUMCO_REF_PREFIX + ".TRANS.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX + ".DEL.bed"),
                setTwoINS=str(SYRI_REF_PREFIX + ".INS.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX + ".DUP.bed"),
                setTwoINV=str(SYRI_REF_PREFIX + ".INV.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX + ".TRANS.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/MUMCO.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/MUMCO.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/MUMCO.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/MUMCO.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/MUMCO.TRANS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/SYRI.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/SYRI.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/SYRI.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/SYRI.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/SYRI.TRANS.intersect.bed")
        threads: 1
        params:
                toolOne="MUMCO",
                toolTwo="SYRI",
                setOnePrefix=MUMCO_REF_PREFIX,
                setTwoPrefix=SYRI_REF_PREFIX,
                bedtoolsDir=config["bedtoolsResultsFolder"],
                toolsPrefix="MUMCO-SYRI",
                minOverlap=config["overlapThreshold"],
        shell:
                "bash ./Scripts/compare-tools-w-bedtool-intersect.sh {params.toolOne} {params.setOnePrefix} {params.toolTwo} {params.setTwoPrefix} {params.bedtoolsDir}/{params.toolsPrefix}.REF {params.minOverlap}"

rule bedtools_intersect_qry_mumco_w_syri:
        input:
                setOneDEL=str(MUMCO_QRY_PREFIX + ".DEL.bed"),
                setOneINS=str(MUMCO_QRY_PREFIX + ".INS.bed"),
                setOneDUP=str(MUMCO_QRY_PREFIX + ".DUP.bed"),
                setOneINV=str(MUMCO_QRY_PREFIX + ".INV.bed"),
                setOneTRANS=str(MUMCO_QRY_PREFIX + ".TRANS.bed"),
                setTwoDEL=str(SYRI_QRY_PREFIX + ".DEL.bed"),
                setTwoINS=str(SYRI_QRY_PREFIX + ".INS.bed"),
                setTwoDUP=str(SYRI_QRY_PREFIX + ".DUP.bed"),
                setTwoINV=str(SYRI_QRY_PREFIX + ".INV.bed"),
                setTwoTRANS=str(SYRI_QRY_PREFIX + ".TRANS.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/MUMCO.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/MUMCO.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/MUMCO.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/MUMCO.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/MUMCO.TRANS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/SYRI.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/SYRI.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/SYRI.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/SYRI.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/SYRI.TRANS.intersect.bed")
        threads: 1
        params:
                toolOne="MUMCO",
                toolTwo="SYRI",
                setOnePrefix=MUMCO_QRY_PREFIX,
                setTwoPrefix=SYRI_QRY_PREFIX,
                bedtoolsDir=config["bedtoolsResultsFolder"],
                toolsPrefix="MUMCO-SYRI",
                minOverlap=config["overlapThreshold"],
        shell:
                "bash ./Scripts/compare-tools-w-bedtool-intersect.sh {params.toolOne} {params.setOnePrefix} {params.toolTwo} {params.setTwoPrefix} {params.bedtoolsDir}/{params.toolsPrefix}.QRY {params.minOverlap}"

rule bedtools_intersect_ref_svps_w_syri:
        input:
                setOneDEL=str(SVPS_REF_PREFIX + ".DEL.bed"),
                setOneINS=str(SVPS_REF_PREFIX + ".INS.bed"),
                setOneDUP=str(SVPS_REF_PREFIX + ".DUP.bed"),
                setOneINV=str(SVPS_REF_PREFIX + ".INV.bed"),
                setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.bed"),
                setTwoDEL=str(SYRI_REF_PREFIX + ".DEL.bed"),
                setTwoINS=str(SYRI_REF_PREFIX + ".INS.bed"),
                setTwoDUP=str(SYRI_REF_PREFIX + ".DUP.bed"),
                setTwoINV=str(SYRI_REF_PREFIX + ".INV.bed"),
                setTwoTRANS=str(SYRI_REF_PREFIX + ".TRANS.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.DEL.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.INS.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.DUP.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.INV.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.TRANS.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.DEL.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.INS.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.DUP.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.INV.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.TRANS.bed")
        threads: 1
        params:
                toolOne="SVPS",
                toolTwo="SYRI",
                setOnePrefix=SVPS_REF_PREFIX,
                setTwoPrefix=SYRI_REF_PREFIX,
                bedtoolsDir=config["bedtoolsResultsFolder"],
                toolsPrefix="SVPS-SYRI",
                minOverlap=config["overlapThreshold"],
        shell:
                "bash ./Scripts/compare-tools-w-bedtool-intersect.sh {params.toolOne} {params.setOnePrefix} {params.toolTwo} {params.setTwoPrefix} {params.bedtoolsDir}/{params.toolsPrefix}.REF {params.minOverlap}"

rule bedtools_intersect_qry_svps_w_syri:
        input:
                setOneDEL=str(SVPS_QRY_PREFIX + ".DEL.bed"),
                setOneINS=str(SVPS_QRY_PREFIX + ".INS.bed"),
                setOneDUP=str(SVPS_QRY_PREFIX + ".DUP.bed"),
                setOneINV=str(SVPS_QRY_PREFIX + ".INV.bed"),
                setOneTRANS=str(SVPS_QRY_PREFIX + ".TRANS.bed"),
                setTwoDEL=str(SYRI_QRY_PREFIX + ".DEL.bed"),
                setTwoINS=str(SYRI_QRY_PREFIX + ".INS.bed"),
                setTwoDUP=str(SYRI_QRY_PREFIX + ".DUP.bed"),
                setTwoINV=str(SYRI_QRY_PREFIX + ".INV.bed"),
                setTwoTRANS=str(SYRI_QRY_PREFIX + ".TRANS.bed")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.DEL.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.INS.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.DUP.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.INV.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.TRANS.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.DEL.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.INS.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.DUP.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.INV.bed"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.TRANS.bed")
        threads: 1
        params:
                toolOne="SVPS",
                toolTwo="SYRI",
                setOnePrefix=SVPS_QRY_PREFIX,
                setTwoPrefix=SYRI_QRY_PREFIX,
                bedtoolsDir=config["bedtoolsResultsFolder"],
                toolsPrefix="SVPS-SYRI",
                minOverlap=config["overlapThreshold"],
        shell:
                "bash ./Scripts/compare-tools-w-bedtool-intersect.sh {params.toolOne} {params.setOnePrefix} {params.toolTwo} {params.setTwoPrefix} {params.bedtoolsDir}/{params.toolsPrefix}.QRY {params.minOverlap}"

rule bedtools_intersect_ref_mumco_svps_syri:
        input:
                setOneDEL=str(MUMCO_REF_PREFIX + ".DEL.bed"),
                setOneINS=str(MUMCO_REF_PREFIX + ".INS.bed"),
                setOneDUP=str(MUMCO_REF_PREFIX + ".DUP.bed"),
                setOneINV=str(MUMCO_REF_PREFIX + ".INV.bed"),
                setOneTRANS=str(MUMCO_REF_PREFIX + ".TRANS.bed"),
                setTwoADEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.DEL.bed"),
                setTwoAINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.INS.bed"),
                setTwoADUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.DUP.bed"),
                setTwoAINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.INV.bed"),
                setTwoATRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.TRANS.bed"),
                setTwoBDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.DEL.bed"),
                setTwoBINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.INS.bed"),
                setTwoBDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.DUP.bed"),
                setTwoBINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.INV.bed"),
                setTwoBTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.TRANS.bed"),

        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/MUMCO.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/MUMCO.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/MUMCO.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/MUMCO.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/MUMCO.TRANS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SVPS.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SVPS.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SVPS.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SVPS.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SVPS.TRANS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SYRI.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SYRI.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SYRI.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SYRI.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SYRI.TRANS.intersect.bed")
        threads: 1
        params:
                toolOne="MUMCO",
                toolTwo="SVPS",
                toolThree="SYRI"
                setOnePrefix=MUMCO_REF_PREFIX,
                setTwoPrefix=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS"),
                setThreePrefix=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI"),
                bedtoolsDir=config["bedtoolsResultsFolder"],
                toolsPrefix="MUMCO-SVPS-SYRI",
                minOverlap=config["overlapThreshold"],
        shell:
                "bash ./Scripts/compare-tools-w-bedtool-intersect.sh {params.toolOne} {params.setOnePrefix} {params.toolTwo} {params.setTwoPrefix} {params.bedtoolsDir}/{params.toolsPrefix}.REF {params.minOverlap};\n"
                "bash ./Scripts/compare-tools-w-bedtool-intersect.sh {params.toolOne} {params.setOnePrefix} {params.toolThree} {params.setThreePrefix} {params.bedtoolsDir}/{params.toolsPrefix}.REF {params.minOverlap};\n"

rule bedtools_intersect_qry_mumco_svps_syri:
        input:
                setOneDEL=str(MUMCO_QRY_PREFIX + ".DEL.bed"),
                setOneINS=str(MUMCO_QRY_PREFIX + ".INS.bed"),
                setOneDUP=str(MUMCO_QRY_PREFIX + ".DUP.bed"),
                setOneINV=str(MUMCO_QRY_PREFIX + ".INV.bed"),
                setOneTRANS=str(MUMCO_QRY_PREFIX + ".TRANS.bed"),
                setTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.DEL.bed"),
                setTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.INS.bed"),
                setTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.DUP.bed"),
                setTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.INV.bed"),
                setTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.TRANS.bed")
                setThreeDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.DEL.bed"),
                setThreeINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.INS.bed"),
                setThreeDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.DUP.bed"),
                setThreeINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.INV.bed"),
                setThreeTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.TRANS.bed"),
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/MUMCO.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/MUMCO.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/MUMCO.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/MUMCO.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/MUMCO.TRANS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SVPS.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SVPS.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SVPS.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SVPS.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SVPS.TRANS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SYRI.DEL.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SYRI.INS.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SYRI.DUP.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SYRI.INV.intersect.bed"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SYRI.TRANS.intersect.bed")
        threads: 1
        params:
                toolOne="MUMCO",
                toolTwo="SVPS",
                toolThree="SYRI"
                setOnePrefix=MUMCO_QRY_PREFIX,
                setTwoPrefix=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS"),
                setThreePrefix=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI"),
                bedtoolsDir=config["bedtoolsResultsFolder"],
                toolsPrefix="MUMCO-SVPS-SYRI",
                minOverlap=config["overlapThreshold"],
        shell:
                "bash ./Scripts/compare-tools-w-bedtool-intersect.sh {params.toolOne} {params.setOnePrefix} {params.toolTwo} {params.setTwoPrefix} {params.bedtoolsDir}/{params.toolsPrefix}-QRY {params.minOverlap}"
                "bash ./Scripts/compare-tools-w-bedtool-intersect.sh {params.toolOne} {params.setOnePrefix} {params.toolThree} {params.setThreePrefix} {params.bedtoolsDir}/{params.toolsPrefix}-QRY {params.minOverlap};\n"

#rule bedtools_intersect_ref_A_w_B:
#        input:
#                setOneDEL=str(_REF_PREFIX + ".DEL.bed"),
#                setOneINS=str(_REF_PREFIX + ".INS.bed"),
#                setOneDUP=str(_REF_PREFIX + ".DUP.bed"),
#                setOneINV=str(_REF_PREFIX + ".INV.bed"),
#                setOneTRANS=str(_REF_PREFIX + ".TRANS.bed"),
#                setTwoDEL=str(_REF_PREFIX + ".DEL.bed"),
#                setTwoINS=str(_REF_PREFIX + ".INS.bed"),
#                setTwoDUP=str(_REF_PREFIX + ".DUP.bed"),
#                setTwoINV=str(_REF_PREFIX + ".INV.bed"),
#                setTwoTRANS=str(_REF_PREFIX + ".TRANS.bed")
#        output:
#                str(config["bedtoolsResultsFolder"] + "/-/DEL.intersect.bed"),
#                str(config["bedtoolsResultsFolder"] + "/-/INS.intersect.bed"),
#                str(config["bedtoolsResultsFolder"] + "/-/DUP.intersect.bed"),
#                str(config["bedtoolsResultsFolder"] + "/-/INV.intersect.bed"),
#                str(config["bedtoolsResultsFolder"] + "/-/TRANS.intersect.bed")
#        threads: 1
#        params:
#                setOnePrefix=str(),
#                setTwoPrefix=str(),
#                bedtoolsDir=config["bedtoolsResultsFolder"],
#                toolsPrefix="-",
#                minOverlap=config["overlapThreshold"],
#        shell:
#                "bash ./Scripts/compare-tools-w-bedtool-intersect.sh {params.toolOne} {params.setOnePrefix} {params.toolTwo} {params.setTwoPrefix} {params.bedtoolsDir}/{params.toolsPrefix} {params.minOverlap}"
