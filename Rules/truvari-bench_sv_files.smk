rule truvari_bench_ref_svim-asm_w_svps:
        input:
                setTwoDEL=str(SVPS_REF_PREFIX + ".DEL.bed"),
                setTwoINS=str(SVPS_REF_PREFIX + ".INS.bed"),
                setTwoDUP=str(SVPS_REF_PREFIX + ".DUP.merged.bed"),
                setTwoINV=str(SVPS_REF_PREFIX + ".INV.merged.bed"),
                #setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.merged.bed"),
                setOneDEL=str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                setOneINS=str(SVIM_ASM_PREFIX + ".INS.vcf"),
                setOneDUP=str(SVIM_ASM_PREFIX + ".DUP.vcf"),
                setOneINV=str(SVIM_ASM_PREFIX + ".INV.vcf"),
                #setTwoBND=str(_PREFIX + ".BND.vcf"),
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/INV/summary.txt"),
                #summaryBND=str(config["truvariResultsFolder"] + "/-/BND/summary.txt"),
                tpCDEL=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/DEL/tp-call.vcf"),
                tpCINS=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/INS/tp-call.vcf"),
                tpCDUP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/DUP/tp-call.vcf"),
                tpCINV=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/INV/tp-call.vcf"),
                #tpCBND=str(config["truvariResultsFolder"] + "/-/BND/tp-call.vcf"),
                tpBDEL=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/DEL/tp-base.vcf"),
                tpBINS=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/INS/tp-base.vcf"),
                tpBDUP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/DUP/tp-base.vcf"),
                tpBINV=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVPS/INV/tp-base.vcf"),
                #tpBBND=str(config["truvariResultsFolder"] + "/-/BND/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="SVIM-ASM-SVPS"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneDEL} {input.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneINS} {input.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.setOneDUP} {input.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneINV} {input.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                #"bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.setOneBND} {input.setTwoBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_ref_svps_w_syri:
        input:
                setOneDEL=str(SVPS_REF_PREFIX + ".DEL.bed"),
                setOneINS=str(SVPS_REF_PREFIX + ".INS.bed"),
                setOneDUP=str(SVPS_REF_PREFIX + ".DUP.merged.bed"),
                setOneINV=str(SVPS_REF_PREFIX + ".INV.merged.bed"),
                setOneTRANS=str(SVPS_REF_PREFIX + ".TRANS.merged.bed"),
                setTwoDEL=str(_PREFIX + ".DEL.vcf"),
                setTwoINS=str(_PREFIX + ".INS.vcf"),
                setTwoDUP=str(_PREFIX + ".DUP.vcf"),
                setTwoINV=str(_PREFIX + ".INV.vcf"),
                setTwoBND=str(_PREFIX + ".BND.vcf"),
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/-/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/-/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/-/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/-/INV/summary.txt"),
                #summaryBND=str(config["truvariResultsFolder"] + "/-/BND/summary.txt"),
                tpCDEL=str(config["truvariResultsFolder"] + "/-/DEL/tp-call.vcf"),
                tpCINS=str(config["truvariResultsFolder"] + "/-/INS/tp-call.vcf"),
                tpCDUP=str(config["truvariResultsFolder"] + "/-/DUP/tp-call.vcf"),
                tpCINV=str(config["truvariResultsFolder"] + "/-/INV/tp-call.vcf"),
                #tpCBND=str(config["truvariResultsFolder"] + "/-/BND/tp-call.vcf"),
                tpBDEL=str(config["truvariResultsFolder"] + "/-/DEL/tp-base.vcf"),
                tpBINS=str(config["truvariResultsFolder"] + "/-/INS/tp-base.vcf"),
                tpBDUP=str(config["truvariResultsFolder"] + "/-/DUP/tp-base.vcf"),
                tpBINV=str(config["truvariResultsFolder"] + "/-/INV/tp-base.vcf"),
                #tpBBND=str(config["truvariResultsFolder"] + "/-/BND/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="-"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneDEL} {input.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneINS} {input.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.setOneDUP} {input.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneINV} {input.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                #"bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.setOneBND} {input.setTwoBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"



rule truvari_bench_ref_A_w_B:
        input:
                setOneDEL=str(_PREFIX + ".DEL.vcf"),
                setOneINS=str(_PREFIX + ".INS.vcf"),
                setOneDUP=str(_PREFIX + ".DUP.vcf"),
                setOneINV=str(_PREFIX + ".INV.vcf"),
                #setOneBND=str(_PREFIX + ".BND.vcf"),
                setTwoDEL=str(_PREFIX + ".DEL.vcf"),
                setTwoINS=str(_PREFIX + ".INS.vcf"),
                setTwoDUP=str(_PREFIX + ".DUP.vcf"),
                setTwoINV=str(_PREFIX + ".INV.vcf"),
                #setTwoBND=str(_PREFIX + ".BND.vcf"),
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/-/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/-/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/-/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/-/INV/summary.txt"),
                #summaryBND=str(config["truvariResultsFolder"] + "/-/BND/summary.txt"),
                tpCDEL=str(config["truvariResultsFolder"] + "/-/DEL/tp-call.vcf"),
                tpCINS=str(config["truvariResultsFolder"] + "/-/INS/tp-call.vcf"),
                tpCDUP=str(config["truvariResultsFolder"] + "/-/DUP/tp-call.vcf"),
                tpCINV=str(config["truvariResultsFolder"] + "/-/INV/tp-call.vcf"),
                #tpCBND=str(config["truvariResultsFolder"] + "/-/BND/tp-call.vcf"),
                tpBDEL=str(config["truvariResultsFolder"] + "/-/DEL/tp-base.vcf"),
                tpBINS=str(config["truvariResultsFolder"] + "/-/INS/tp-base.vcf"),
                tpBDUP=str(config["truvariResultsFolder"] + "/-/DUP/tp-base.vcf"),
                tpBINV=str(config["truvariResultsFolder"] + "/-/INV/tp-base.vcf"),
                #tpBBND=str(config["truvariResultsFolder"] + "/-/BND/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="-"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneDEL} {input.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneINS} {input.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.setOneDUP} {input.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneINV} {input.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                #"bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.setOneBND} {input.setTwoBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"
