rule combine_ref_svps_types_to_all_bed_file:
        input:
                str(SVPS_REF_PREFIX + ".DEL.merged.bed"),
                str(SVPS_REF_PREFIX + ".INS.merged.bed"),
                str(SVPS_REF_PREFIX + ".DUP.merged.bed"),
                str(SVPS_REF_PREFIX + ".INV.merged.bed"),
                str(SVPS_REF_PREFIX + ".TRANS.merged.bed")
        output:
                str(SVPS_REF_PREFIX + ".ALL.fromMerged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output} {input}"

rule combine_qry_svps_types_to_all_bed_file:
        input:
                str(SVPS_QRY_PREFIX + ".DEL.merged.bed"),
                str(SVPS_QRY_PREFIX + ".INS.merged.bed"),
                str(SVPS_QRY_PREFIX + ".DUP.merged.bed"),
                str(SVPS_QRY_PREFIX + ".INV.merged.bed"),
                str(SVPS_QRY_PREFIX + ".TRANS.merged.bed")
        output:
                str(SVPS_QRY_PREFIX + ".ALL.fromMerged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output} {input}"

rule combine_ref_mumco_svps_intersects_to_all_bed_file:
        input:
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.intersect.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.intersect.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.intersect.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.intersect.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.intersect.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.intersect.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.intersect.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.intersect.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.intersect.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.intersect.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.ALL.intersect.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.toolOneDEL} {input.toolOneINS} {input.toolOneDUP} {input.toolOneINV} {input.toolOneTRANS};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.toolTwoDEL} {input.toolTwoINS} {input.toolTwoDUP} {input.toolTwoINV} {input.toolTwoTRANS}"

rule combine_qry_mumco_svps_intersects_to_all_bed_file:
        input:
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/MUMCO.DEL.intersect.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/MUMCO.INS.intersect.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/MUMCO.DUP.intersect.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/MUMCO.INV.intersect.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/MUMCO.TRANS.intersect.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/SVPS.DEL.intersect.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/SVPS.INS.intersect.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/SVPS.DUP.intersect.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/SVPS.INV.intersect.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/SVPS.TRANS.intersect.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/MUMCO.ALL.intersect.bed")
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/QRY/SVPS.ALL.intersect.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.toolOneDEL} {input.toolOneINS} {input.toolOneDUP} {input.toolOneINV} {input.toolOneTRANS};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.toolTwoDEL} {input.toolTwoINS} {input.toolTwoDUP} {input.toolTwoINV} {input.toolTwoTRANS}"

rule combine_ref_mumco_syri_intersects_to_all_bed_file:
        input:
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/MUMCO.DEL.intersect.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/MUMCO.INS.intersect.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/MUMCO.DUP.intersect.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/MUMCO.INV.intersect.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/MUMCO.TRANS.intersect.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/SYRI.DEL.intersect.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/SYRI.INS.intersect.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/SYRI.DUP.intersect.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/SYRI.INV.intersect.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/SYRI.TRANS.intersect.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/MUMCO.ALL.intersect.bed")
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/REF/SYRI.ALL.intersect.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.toolOneDEL} {input.toolOneINS} {input.toolOneDUP} {input.toolOneINV} {input.toolOneTRANS};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.toolTwoDEL} {input.toolTwoINS} {input.toolTwoDUP} {input.toolTwoINV} {input.toolTwoTRANS}"

rule combine_qry_mumco_syri_intersects_to_all_bed_file:
        input:
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/MUMCO.DEL.intersect.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/MUMCO.INS.intersect.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/MUMCO.DUP.intersect.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/MUMCO.INV.intersect.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/MUMCO.TRANS.intersect.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/SYRI.DEL.intersect.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/SYRI.INS.intersect.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/SYRI.DUP.intersect.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/SYRI.INV.intersect.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/SYRI.TRANS.intersect.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/MUMCO.ALL.intersect.bed")
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI/QRY/SYRI.ALL.intersect.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.toolOneDEL} {input.toolOneINS} {input.toolOneDUP} {input.toolOneINV} {input.toolOneTRANS};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.toolTwoDEL} {input.toolTwoINS} {input.toolTwoDUP} {input.toolTwoINV} {input.toolTwoTRANS}"

rule combine_ref_svps_syri_intersects_to_all_bed_file:
        input:
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.DEL.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.INS.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.DUP.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.INV.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.TRANS.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.DEL.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.INS.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.DUP.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.INV.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.TRANS.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SVPS.ALL.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/REF/SYRI.ALL.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.toolOneDEL} {input.toolOneINS} {input.toolOneDUP} {input.toolOneINV} {input.toolOneTRANS};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.toolTwoDEL} {input.toolTwoINS} {input.toolTwoDUP} {input.toolTwoINV} {input.toolTwoTRANS}"

rule combine_qry_svps_syri_intersects_to_all_bed_file:
        input:
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.DEL.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.INS.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.DUP.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.INV.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.TRANS.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.DEL.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.INS.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.DUP.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.INV.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.TRANS.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SVPS.ALL.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI/QRY/SYRI.ALL.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.toolOneDEL} {input.toolOneINS} {input.toolOneDUP} {input.toolOneINV} {input.toolOneTRANS};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.toolTwoDEL} {input.toolTwoINS} {input.toolTwoDUP} {input.toolTwoINV} {input.toolTwoTRANS}"

rule combine_ref_mumco_svps_syri_types_to_all_bed_file:
        input:
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/MUMCO.DEL.intersect.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/MUMCO.INS.intersect.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/MUMCO.DUP.intersect.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/MUMCO.INV.intersect.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/MUMCO.TRANS.intersect.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SVPS.DEL.intersect.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SVPS.INS.intersect.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SVPS.DUP.intersect.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SVPS.INV.intersect.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SVPS.TRANS.intersect.bed"),
                toolThreeDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SYRI.DEL.intersect.bed"),
                toolThreeINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SYRI.INS.intersect.bed"),
                toolThreeDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SYRI.DUP.intersect.bed"),
                toolThreeINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SYRI.INV.intersect.bed"),
                toolThreeTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SYRI.TRANS.intersect.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/MUMCO.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SVPS.ALL.intersect.bed"),
                toolThreeALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/REF/SYRI.ALL.intersect.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.toolOneDEL} {input.toolOneINS} {input.toolOneDUP} {input.toolOneINV} {input.toolOneTRANS};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.toolTwoDEL} {input.toolTwoINS} {input.toolTwoDUP} {input.toolTwoINV} {input.toolTwoTRANS};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolThreeALL} {input.toolThreeDEL} {input.toolThreeINS} {input.toolThreeDUP} {input.toolThreeINV} {input.toolThreeTRANS};\n"

rule combine_qry_mumco_svps_syri_types_to_all_bed_file:
        input:
                toolOneDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/MUMCO.DEL.intersect.bed"),
                toolOneINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/MUMCO.INS.intersect.bed"),
                toolOneDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/MUMCO.DUP.intersect.bed"),
                toolOneINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/MUMCO.INV.intersect.bed"),
                toolOneTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/MUMCO.TRANS.intersect.bed"),
                toolTwoDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SVPS.DEL.intersect.bed"),
                toolTwoINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SVPS.INS.intersect.bed"),
                toolTwoDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SVPS.DUP.intersect.bed"),
                toolTwoINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SVPS.INV.intersect.bed"),
                toolTwoTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SVPS.TRANS.intersect.bed"),
                toolThreeDEL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SYRI.DEL.intersect.bed"),
                toolThreeINS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SYRI.INS.intersect.bed"),
                toolThreeDUP=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SYRI.DUP.intersect.bed"),
                toolThreeINV=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SYRI.INV.intersect.bed"),
                toolThreeTRANS=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SYRI.TRANS.intersect.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/MUMCO.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SVPS.ALL.intersect.bed"),
                toolThreeALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI/QRY/SYRI.ALL.intersect.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.toolOneDEL} {input.toolOneINS} {input.toolOneDUP} {input.toolOneINV} {input.toolOneTRANS};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.toolTwoDEL} {input.toolTwoINS} {input.toolTwoDUP} {input.toolTwoINV} {input.toolTwoTRANS};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolThreeALL} {input.toolThreeDEL} {input.toolThreeINS} {input.toolThreeDUP} {input.toolThreeINV} {input.toolThreeTRANS};\n"
