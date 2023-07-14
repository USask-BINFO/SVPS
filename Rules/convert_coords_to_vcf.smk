rule convert_ref_DEL_coords_to_vcf:
        input:
                str(SVPS_REF_PREFIX + ".DEL.final.noN.coords")
        output:
                str(SVPS_REF_PREFIX + ".DEL.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=config["refAssembly"],
                contigInfo=str(config["genomesFolder"] + "/RefSeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"]
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n" 
                "bash ./Scripts/convert-DEL-coords-to-vcf.sh {input} {output} {params.refGenome}"

rule convert_qry_DEL_coords_to_vcf:
        input:
                str(SVPS_QRY_PREFIX + ".DEL.final.noN.coords")
        output:
                str(SVPS_QRY_PREFIX + ".DEL.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=config["qryAssembly"],
                contigInfo=str(config["genomesFolder"] + "/QrySeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"]
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n"
                "bash ./Scripts/convert-DEL-coords-to-vcf.sh {input} {output} {params.refGenome}"

rule convert_ref_INS_coords_to_vcf:
        input:
                str(SVPS_REF_PREFIX + ".INS.final.noN.coords")
        output:
                str(SVPS_REF_PREFIX + ".INS.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                qryGenome=config["qryAssembly"],
                contigInfo=str(config["genomesFolder"] + "/RefSeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"]
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n"
                "bash ./Scripts/convert-INS-coords-to-vcf.sh {input} {output} {params.qryGenome}"

rule convert_qry_INS_coords_to_vcf:
        input:
                str(SVPS_QRY_PREFIX + ".INS.final.noN.coords")
        output:
                str(SVPS_QRY_PREFIX + ".INS.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                qryGenome=config["refAssembly"],
                contigInfo=str(config["genomesFolder"] + "/QrySeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"]
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n"
                "bash ./Scripts/convert-INS-coords-to-vcf.sh {input} {output} {params.qryGenome}"

rule convert_ref_DUP_coords_to_vcf:
        input:
                str(SVPS_REF_PREFIX + ".DUP.merged.bed")
        output:
                str(SVPS_REF_PREFIX + ".DUP.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=config["refAssembly"],
                contigInfo=str(config["genomesFolder"] + "/RefSeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"]
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n"
                "bash ./Scripts/convert-DUP-bed-to-vcf.sh {input} {output} {params.refGenome}"

rule convert_qry_DUP_coords_to_vcf:
        input:
                str(SVPS_QRY_PREFIX + ".DUP.merged.bed")
        output:
                str(SVPS_QRY_PREFIX + ".DUP.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=config["qryAssembly"],
                contigInfo=str(config["genomesFolder"] + "/QrySeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"]
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n"
                "bash ./Scripts/convert-DUP-bed-to-vcf.sh {input} {output} {params.refGenome}"

rule convert_ref_INV_coords_to_vcf:
        input:
                str(SVPS_REF_PREFIX + ".INV.merged.bed")
        output:
                str(SVPS_REF_PREFIX + ".INV.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=config["refAssembly"],
                contigInfo=str(config["genomesFolder"] + "/RefSeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"]
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n"
                "bash ./Scripts/convert-INV-bed-to-vcf.sh {input} {output} {params.refGenome}"

rule convert_qry_INV_coords_to_vcf:
        input:
                str(SVPS_QRY_PREFIX + ".INV.merged.bed")
        output:
                str(SVPS_QRY_PREFIX + ".INV.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=config["qryAssembly"],
                contigInfo=str(config["genomesFolder"] + "/QrySeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"]
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n"
                "bash ./Scripts/convert-INV-bed-to-vcf.sh {input} {output} {params.refGenome}"

rule convert_ref_TRANSLOC_coords_to_vcf:
        input:
                str(SVPS_REF_PREFIX + ".TRANS.merged.bed")
        output:
                str(SVPS_REF_PREFIX + ".TRANSLOC.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                contigInfo=str(config["genomesFolder"] + "/RefSeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"],
                svType="DEL:TRANSLOC"
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n"
                "bash ./Scripts/convert-TRANS-bed-to-vcf.sh {input} {output} {params.svType}"

rule convert_ref_TRANSPOS_coords_to_vcf:
        input:
                str(SVPS_REF_PREFIX + ".TRANSPOS.merged.bed")
        output:
                str(SVPS_REF_PREFIX + ".TRANSPOS.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                contigInfo=str(config["genomesFolder"] + "/RefSeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"],
                svType="DEL:TRANSPOS"
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n"
                "bash ./Scripts/convert-TRANS-bed-to-vcf.sh {input} {output} {params.svType}"

rule convert_qry_TRANSLOC_coords_to_vcf:
        input:
                str(SVPS_QRY_PREFIX + ".TRANS.merged.bed")
        output:
                str(SVPS_QRY_PREFIX + ".TRANSLOC.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                contigInfo=str(config["genomesFolder"] + "/QrySeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"],
                svType="DEL:TRANSLOC"
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n"
                "bash ./Scripts/convert-TRANS-bed-to-vcf.sh {input} {output} {params.svType}"

rule convert_qry_TRANSPOS_coords_to_vcf:
        input:
                str(SVPS_QRY_PREFIX + ".TRANSPOS.merged.bed")
        output:
                str(SVPS_QRY_PREFIX + ".TRANSPOS.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/VCFReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                contigInfo=str(config["genomesFolder"] + "/QrySeqDetails.txt"),
                mummerL=config["minMatchLen"],
                mummerC=config["minClusterSize"],
                mummerB=config["maxEntend"],
                svType="DEL:TRANSPOS"
        shell:
                "bash ./Scripts/prepend-vcf-header.sh {output} {params.contigInfo} {params.mummerL} {params.mummerC} {params.mummerB};\n"
                "bash ./Scripts/convert-TRANS-bed-to-vcf.sh {input} {output} {params.svType}"


rule merge_ref_vcfs_to_all_types_file:
       input:
               str(SVPS_REF_PREFIX + ".DEL.vcf"),
               str(SVPS_REF_PREFIX + ".INS.vcf"),
               str(SVPS_REF_PREFIX + ".DUP.vcf"),
               str(SVPS_REF_PREFIX + ".INV.vcf"),
               str(SVPS_REF_PREFIX + ".TRANSLOC.vcf"),
               str(SVPS_REF_PREFIX + ".TRANSPOS.vcf")
       output:
               str(SVPS_REF_PREFIX + ".ALL.sorted.vcf")
       threads: 1
       benchmark:
               repeat(str(BENCH_DIR + "/VCFMerging.benchmarking.tsv"), BENCH_REPEAT)
       params:
               str(SVPS_REF_PREFIX + ".ALL")
       shell:
              "bash ./Scripts/concat-vcf-files-bcftools.sh {params} {input}"

rule merge_qry_vcfs_to_all_types_file:
       input:
               str(SVPS_QRY_PREFIX + ".DEL.vcf"),
               str(SVPS_QRY_PREFIX + ".INS.vcf"),
               str(SVPS_QRY_PREFIX + ".DUP.vcf"),
               str(SVPS_QRY_PREFIX + ".INV.vcf"),
               str(SVPS_QRY_PREFIX + ".TRANSLOC.vcf"),
               str(SVPS_QRY_PREFIX + ".TRANSPOS.vcf")
       output:
               str(SVPS_QRY_PREFIX + ".ALL.sorted.vcf")
       threads: 1
       benchmark:
               repeat(str(BENCH_DIR + "/VCFMerging.benchmarking.tsv"), BENCH_REPEAT)
       params:
               str(SVPS_QRY_PREFIX + ".ALL")
       shell:
              "bash ./Scripts/concat-vcf-files-bcftools.sh {params} {input}"
