rule build_ref_DUP_verification_sample:
        input:
                chromNames=str(config["genomesFolder"] + "/RefSeqNamesToInclude.txt"),
                inputCoords=str(SVPS_REF_PREFIX + ".DUP.final.noN.coords")
        output:
                str(SVPS_REF_PREFIX + ".DUP.verifySample.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["verificationSampSize"]
        shell:
                "bash ./Scripts/generate-random-sample-to-verify.sh {input} {output} {params}"

rule verify_ref_DUP_predictions:
        input:
                str(SVPS_REF_PREFIX + ".DUP.verifySample.coords")
        output:
                str(config["verifyAlignFolder"] + "/REF/DUP-SimilarityResults.out")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED,
                outputDir=str(config["verifyAlignFolder"]+"/REF"),
                svType="DUP"
        shell:
                "bash ./Scripts/verify-alignment-regions.sh {params.refGenome} {params.qryGenome} {input} {params.outputDir} {params.svType}"

rule build_qry_DUP_verification_sample:
        input:
                chromNames=str(config["genomesFolder"] + "/QrySeqNamesToInclude.txt"),
                inputCoords=str(SVPS_QRY_PREFIX + ".DUP.final.noN.coords")
        output:
                str(SVPS_QRY_PREFIX + ".DUP.verifySample.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["verificationSampSize"]
        shell:
                "bash ./Scripts/generate-random-sample-to-verify.sh {input} {output} {params}"

rule verify_qry_DUP_predictions:
        input:
                str(SVPS_QRY_PREFIX + ".DUP.verifySample.coords")
        output:
                str(config["verifyAlignFolder"] + "/QRY/DUP-SimilarityResults.out") 
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=QRY_FILTERED,
                qryGenome=REF_FILTERED,
                outputDir=str(config["verifyAlignFolder"] + "/QRY"),
                svType="DUP"
        shell:
                "bash ./Scripts/verify-alignment-regions.sh {params.refGenome} {params.qryGenome} {input} {params.outputDir} {params.svType}"

rule build_ref_INV_verification_sample:
        input:
                chromNames=str(config["genomesFolder"] + "/RefSeqNamesToInclude.txt"),
                inputCoords=str(SVPS_REF_PREFIX + ".INV.final.noN.coords")
        output:
                str(SVPS_REF_PREFIX + ".INV.verifySample.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["verificationSampSize"]
        shell:
                "bash ./Scripts/generate-random-sample-to-verify.sh {input} {output} {params}"

rule verify_ref_INV_predictions:
        input:
                str(SVPS_REF_PREFIX + ".INV.verifySample.coords")
        output:
                str(config["verifyAlignFolder"] + "/REF/INV-SimilarityResults.out")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED,
                outputDir=str(config["verifyAlignFolder"]+"/REF"),
                svType="INV"
        shell:
                "bash ./Scripts/verify-alignment-regions.sh {params.refGenome} {params.qryGenome} {input} {params.outputDir} {params.svType}"

rule build_qry_INV_verification_sample:
        input:
                chromNames=str(config["genomesFolder"] + "/QrySeqNamesToInclude.txt"),
                inputCoords=str(SVPS_QRY_PREFIX + ".INV.final.noN.coords")
        output:
                str(SVPS_QRY_PREFIX + ".INV.verifySample.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["verificationSampSize"]
        shell:
                "bash ./Scripts/generate-random-sample-to-verify.sh {input} {output} {params}"

rule verify_qry_INV_predictions:
        input:
                str(SVPS_QRY_PREFIX + ".INV.verifySample.coords")
        output:
                str(config["verifyAlignFolder"] + "/QRY/INV-SimilarityResults.out")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=QRY_FILTERED,
                qryGenome=REF_FILTERED,
                outputDir=str(config["verifyAlignFolder"] + "/QRY"),
                svType="INV"
        shell:
                "bash ./Scripts/verify-alignment-regions.sh {params.refGenome} {params.qryGenome} {input} {params.outputDir} {params.svType}"

rule build_ref_TRANS_verification_sample:
        input:
                chromNames=str(config["genomesFolder"] + "/RefSeqNamesToInclude.txt"),
                inputCoords=str(SVPS_REF_PREFIX + ".TRANS.final.noN.coords")
        output:
                str(SVPS_REF_PREFIX + ".TRANS.verifySample.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["verificationSampSize"]
        shell:
                "bash ./Scripts/generate-random-sample-to-verify.sh {input} {output} {params}"

rule verify_ref_TRANS_predictions:
        input:
                str(SVPS_REF_PREFIX + ".TRANS.verifySample.coords")
        output:
                str(config["verifyAlignFolder"] + "/REF/TRANS-SimilarityResults.out")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED,
                outputDir=str(config["verifyAlignFolder"]+"/REF"),
                svType="TRANS"
        shell:
                "bash ./Scripts/verify-alignment-regions.sh {params.refGenome} {params.qryGenome} {input} {params.outputDir} {params.svType}"

rule build_qry_TRANS_verification_sample:
        input:
                chromNames=str(config["genomesFolder"] + "/QrySeqNamesToInclude.txt"),
                inputCoords=str(SVPS_QRY_PREFIX + ".TRANS.final.noN.coords")
        output:
                str(SVPS_QRY_PREFIX + ".TRANS.verifySample.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["verificationSampSize"]
        shell:
                "bash ./Scripts/generate-random-sample-to-verify.sh {input} {output} {params}"

rule verify_qry_TRANS_predictions:
        input:
                str(SVPS_QRY_PREFIX + ".TRANS.verifySample.coords")
        output:
                str(config["verifyAlignFolder"] + "/QRY/TRANS-SimilarityResults.out")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=QRY_FILTERED,
                qryGenome=REF_FILTERED,
                outputDir=str(config["verifyAlignFolder"] + "/QRY"),
                svType="TRANS"
        shell:
                "bash ./Scripts/verify-alignment-regions.sh {params.refGenome} {params.qryGenome} {input} {params.outputDir} {params.svType}"

rule build_ref_DEL_verification_sample:
        input:
                chromNames=str(config["genomesFolder"] + "/RefSeqNamesToInclude.txt"),
                inputCoords=str(SVPS_REF_PREFIX + ".DEL.final.noN.coords")
        output:
                str(SVPS_REF_PREFIX + ".DEL.verifySample.coords")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["verificationSampSize"]
        shell:
                "bash ./Scripts/generate-random-sample-to-verify.sh {input} {output} {params}"

rule index_samtools_depth_output:
        input:
                depthFile=str(MNMP2_GENOMES_PREFIX + ".ref.depth")
        output:
                indexFile=str(MNMP2_GENOMES_PREFIX + ".ref.depth.idx"),
                chrmInfoFile=str(MNMP2_GENOMES_PREFIX + ".ref.depth.chrinfo"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["indexInterval"]
        shell:
                "python ./Scripts/index_samtools_depth.py {input.depthFile} -i {params}"

rule verify_ref_gap_predictions:
        input:
                alignmentFile=str(MNMP2_GENOMES_PREFIX + ".ref.sam"),
                gapCoords=str(SVPS_REF_PREFIX + ".DEL.verifySample.coords"),
                depthFile=str(MNMP2_GENOMES_PREFIX + ".ref.depth"),
                indexFile=str(MNMP2_GENOMES_PREFIX + ".ref.depth.idx"),
                chrmInfoFile=str(MNMP2_GENOMES_PREFIX + ".ref.depth.chrinfo"),
        output:
                outputFile=str(config["verifyAlignFolder"] + "/REF/DEL-SimilarityResults.out")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VerifyAlignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                genomeFile=REF_FILTERED,
                outputDir=str(config["verifyAlignFolder"]+"/REF"),
                svType="DEL"
        shell:
                "python ./Scripts/verify-gap-regions.py {input.depthFile} {input.indexFile} {input.chrmInfoFile} {output.outputFile} {input.gapCoords}"
