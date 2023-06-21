rule convert_ref_DEL_coords_to_bed_and_merge:
        input:
                str(SVPS_REF_PREFIX + ".DEL.final.noN.coords")
        output:
                str(SVPS_REF_PREFIX + ".DEL.merged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/BedReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                extractedFields=str(SVPS_REF_PREFIX + ".DEL.all.bed"),
                sortedFields=str(SVPS_REF_PREFIX + ".DEL.sorted.bed"),
                distAllowed=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-bed-fields-from-gaps-coords.sh {input} {params.extractedFields};\n"
                "sort -k1,1 -k2,2n {params.extractedFields} > {params.sortedFields};\n"
                "bedtools merge -d {params.distAllowed} -c 1 -o count -i {params.sortedFields} > {output};\n"
                "rm {params.extractedFields} {params.sortedFields}"

rule convert_qry_DEL_coords_to_bed_and_merge:
        input:
                str(SVPS_QRY_PREFIX + ".DEL.final.noN.coords")
        output:
                str(SVPS_QRY_PREFIX + ".DEL.merged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/BedReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                extractedFields=str(SVPS_QRY_PREFIX + ".DEL.all.bed"),
                sortedFields=str(SVPS_QRY_PREFIX + ".DEL.sorted.bed"),
                distAllowed=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-bed-fields-from-gaps-coords.sh {input} {params.extractedFields};\n"
                "sort -k1,1 -k2,2n {params.extractedFields} > {params.sortedFields};\n"
                "bedtools merge -d {params.distAllowed} -c 1 -o count -i {params.sortedFields} > {output};\n"
                "rm {params.extractedFields} {params.sortedFields}"

rule convert_ref_INS_coords_to_bed_and_merge:
        input:
                str(SVPS_REF_PREFIX + ".INS.final.noN.coords")
        output:
                str(SVPS_REF_PREFIX + ".INS.merged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/BedReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                extractedFields=str(SVPS_REF_PREFIX + ".INS.all.bed"),
                sortedFields=str(SVPS_REF_PREFIX + ".INS.sorted.bed"),
                distAllowed=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-bed-fields-from-gaps-coords.sh {input} {params.extractedFields};\n"
                "sort -k1,1 -k2,2n {params.extractedFields} > {params.sortedFields};\n"
                "bedtools merge -d {params.distAllowed} -c 1 -o count -i {params.sortedFields} > {output};\n"
                "rm {params.extractedFields} {params.sortedFields}"

rule convert_qry_INS_coords_to_bed_and_merge:
        input:
                str(SVPS_QRY_PREFIX + ".INS.final.noN.coords")
        output:
                str(SVPS_QRY_PREFIX + ".INS.merged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/BedReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                extractedFields=str(SVPS_QRY_PREFIX + ".INS.all.bed"),
                sortedFields=str(SVPS_QRY_PREFIX + ".INS.sorted.bed"),
                distAllowed=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-bed-fields-from-gaps-coords.sh {input} {params.extractedFields};\n"
                "sort -k1,1 -k2,2n {params.extractedFields} > {params.sortedFields};\n"
                "bedtools merge -d {params.distAllowed} -c 1 -o count -i {params.sortedFields} > {output};\n"
                "rm {params.extractedFields} {params.sortedFields}"

rule convert_ref_DUP_coords_to_bed_and_merge:
        input:
                str(SVPS_REF_PREFIX + ".DUP.final.noN.coords")
        output:
                str(SVPS_REF_PREFIX + ".DUP.merged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/BedReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                extractedFields=str(SVPS_REF_PREFIX + ".DUP.all.bed"),
                sortedFields=str(SVPS_REF_PREFIX + ".DUP.sorted.bed"),
                distAllowed=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-bed-fields-from-align-coords.sh {input} {params.extractedFields};\n"
                "sort -k1,1 -k2,2n {params.extractedFields} > {params.sortedFields};\n"
                "bedtools merge -d {params.distAllowed} -c 1 -o count -i {params.sortedFields} > {output};\n"
                "rm {params.extractedFields} {params.sortedFields}"

rule convert_qry_DUP_coords_to_bed_and_merge:
        input:
                str(SVPS_QRY_PREFIX + ".DUP.final.noN.coords")
        output:
                str(SVPS_QRY_PREFIX + ".DUP.merged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/BedReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                extractedFields=str(SVPS_QRY_PREFIX + ".DUP.all.bed"),
                sortedFields=str(SVPS_QRY_PREFIX + ".DUP.sorted.bed"),
                distAllowed=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-bed-fields-from-align-coords.sh {input} {params.extractedFields};\n"
                "sort -k1,1 -k2,2n {params.extractedFields} > {params.sortedFields};\n"
                "bedtools merge -d {params.distAllowed} -c 1 -o count -i {params.sortedFields} > {output};\n"
                "rm {params.extractedFields} {params.sortedFields}"

rule convert_ref_INV_coords_to_bed_and_merge:
        input:
                str(SVPS_REF_PREFIX + ".INV.final.noN.coords")
        output:
                str(SVPS_REF_PREFIX + ".INV.merged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/BedReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                extractedFields=str(SVPS_REF_PREFIX + ".INV.all.bed"),
                sortedFields=str(SVPS_REF_PREFIX + ".INV.sorted.bed"),
                distAllowed=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-bed-fields-from-align-coords.sh {input} {params.extractedFields};\n"
                "sort -k1,1 -k2,2n {params.extractedFields} > {params.sortedFields};\n"
                "bedtools merge -d {params.distAllowed} -c 1 -o count -i {params.sortedFields} > {output};\n"
                "rm {params.extractedFields} {params.sortedFields}"

rule convert_qry_INV_coords_to_bed_and_merge:
        input:
                str(SVPS_QRY_PREFIX + ".INV.final.noN.coords")
        output:
                str(SVPS_QRY_PREFIX + ".INV.merged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/BedReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                extractedFields=str(SVPS_QRY_PREFIX + ".INV.all.bed"),
                sortedFields=str(SVPS_QRY_PREFIX + ".INV.sorted.bed"),
                distAllowed=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-bed-fields-from-align-coords.sh {input} {params.extractedFields};\n"
                "sort -k1,1 -k2,2n {params.extractedFields} > {params.sortedFields};\n"
                "bedtools merge -d {params.distAllowed} -c 1 -o count -i {params.sortedFields} > {output};\n"
                "rm {params.extractedFields} {params.sortedFields}"

rule convert_ref_TRANS_coords_to_bed_and_merge:
        input:
                str(SVPS_REF_PREFIX + ".TRANS.final.noN.coords")
        output:
                str(SVPS_REF_PREFIX + ".TRANS.merged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/BedReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                extractedFields=str(SVPS_REF_PREFIX + ".TRANS.all.bed"),
                sortedFields=str(SVPS_REF_PREFIX + ".TRANS.sorted.bed"),
                distAllowed=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-bed-fields-from-align-coords.sh {input} {params.extractedFields};\n"
                "sort -k1,1 -k2,2n {params.extractedFields} > {params.sortedFields};\n"
                "bedtools merge -d {params.distAllowed} -c 1 -o count -i {params.sortedFields} > {output};\n"
                "rm {params.extractedFields} {params.sortedFields}"

rule convert_qry_TRANS_coords_to_bed_and_merge:
        input:
                str(SVPS_QRY_PREFIX + ".TRANS.final.noN.coords")
        output:
                str(SVPS_QRY_PREFIX + ".TRANS.merged.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/BedReformatting.benchmarking.tsv"), BENCH_REPEAT)
        params:
                extractedFields=str(SVPS_QRY_PREFIX + ".TRANS.all.bed"),
                sortedFields=str(SVPS_QRY_PREFIX + ".TRANS.sorted.bed"),
                distAllowed=config["maxDistApart"]
        shell:
                "bash ./Scripts/extract-bed-fields-from-align-coords.sh {input} {params.extractedFields};\n"
                "sort -k1,1 -k2,2n {params.extractedFields} > {params.sortedFields};\n"
                "bedtools merge -d {params.distAllowed} -c 1 -o count -i {params.sortedFields} > {output};\n"
                "rm {params.extractedFields} {params.sortedFields}"
