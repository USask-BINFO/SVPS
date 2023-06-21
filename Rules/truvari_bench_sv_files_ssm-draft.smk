rule truvari_bench__w__SSm:
        input:
                setOneDEL=
                setOneINS=
                setOneDUP=
                setOneINV=
                setOneTRANS=
                setTwoDEL=
                setTwoINS=
                setTwoDUP=
                setTwoINV=
                setTwoTRANS=
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/-/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/-/INS/SSm/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/-/DUP/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/-/INV/SSm/summary.txt"),
                summaryTRANS=str(config["truvariResultsFolder"] + "/-/TRANS/SSm/summary.txt"),
                outputDELTPC=str(config["truvariResultsFolder"] + "/-/DEL/SSm/tp-call.vcf"),
                outputINSTPC=str(config["truvariResultsFolder"] + "/-/INS/SSm/tp-call.vcf"),
                outputDUPTPC=str(config["truvariResultsFolder"] + "/-/DUP/SSm/tp-call.vcf"),
                outputINVTPC=str(config["truvariResultsFolder"] + "/-/INV/SSm/tp-call.vcf"),
                outputTRANSTPC=str(config["truvariResultsFolder"] + "/-/TRANS/SSm/tp-call.vcf"),
                outputDELTPB=str(config["truvariResultsFolder"] + "/-/DEL/SSm/tp-base.vcf"),
                outputINSTPB=str(config["truvariResultsFolder"] + "/-/INS/SSm/tp-base.vcf"),
                outputDUPTPB=str(config["truvariResultsFolder"] + "/-/DUP/SSm/tp-base.vcf"),
                outputINVTPB=str(config["truvariResultsFolder"] + "/-/INV/SSm/tp-base.vcf"),
                outputTRANSTPB=str(config["truvariResultsFolder"] + "/-/TRANS/SSm/tp-base.vcf")
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
                toolsPrefix=""
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneDEL} {input.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneINS} {input.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.setOneDUP} {input.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.setOneINV} {input.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.setOneTRANS} {input.setTwoTRANS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/TRANS/SSm"
