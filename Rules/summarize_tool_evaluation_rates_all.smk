rule evaluate_svps_w_syri_mummer_all:
        input:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv"),
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
        params:
                toolA="SVPS",
                toolB="SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-list.sh {output} {params.toolA} {params.toolB} {input};\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svps_w_syri_minimap_all:
        input:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv")
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
        params:
                toolA="SVPS",
                toolB="SYRI-MINI"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-list.sh {output} {params.toolA} {params.toolB} {input};\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_w_svps_all:
        input:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv") 
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/" + REF_SAMP_NAME + ".All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
        params:
                toolA="MUMCO",
                toolB="SVPS"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-list.sh {output} {params.toolA} {params.toolB} {input};\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_w_syri_mummer_all:
        input:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv") 
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/" + REF_SAMP_NAME + ".All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
        params:
                toolA="MUMCO",
                toolB="SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-list.sh {output} {params.toolA} {params.toolB} {input};\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_w_syri_minimap_all:
        input:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv") 
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/" + REF_SAMP_NAME + ".All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
        params:
                toolA="MUMCO",
                toolB="SYRI-MINI"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-list.sh {output} {params.toolA} {params.toolB} {input};\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_syri_mummer_w_syri_minimap_all:
        input:
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv") 
        output:
                str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
        params:
                toolA="SYRI-MINI",
                toolB="SYRI-MUM"
        shell:
               "bash ./Scripts/calculate-iou-from-bedtools-list.sh {output} {params.toolA} {params.toolB} {input};\n"
               "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svps_syri_mummer_syri_minimap_all:
        input:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv") 
        output:
                str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
        params:
                toolA="SVPS",
                toolB="SYRI-MINI-SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-list.sh {output} {params.toolA} {params.toolB} {input};\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_syri_mummer_syri_minimap_all:
        input:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv") 
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
        params:
                toolA="MUMCO",
                toolB="SYRI-MINI-SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-list.sh {output} {params.toolA} {params.toolB} {input};\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"
rule evaluate_mumco_svps_syri_minimap_all:
        input:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv") 
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/" + REF_SAMP_NAME + ".All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
        params:
                toolA="MUMCO",
                toolB="SVPS-SYRI-MINI"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-list.sh {output} {params.toolA} {params.toolB} {input};\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_svps_syri_mummer_all:
        input:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv") 
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/" + REF_SAMP_NAME + ".All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
        params:
                toolA="MUMCO",
                toolB="SVPS-SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-list.sh {output} {params.toolA} {params.toolB} {input};\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_mumco_svps_syri_minimap_syri_mummer_all:
        input:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".SSm.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Sml.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Med.calculated_rates.tsv"),
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".Lrg.calculated_rates.tsv") 
        output:
                str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/" + REF_SAMP_NAME + ".All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.Lrg.benchmarking.tsv"), BENCH_REPEAT)
        params:
                toolA="MUMCO-SVPS",
                toolB="SYRI-MINI-SYRI-MUM"
        shell:
                "bash ./Scripts/calculate-iou-from-bedtools-list.sh {output} {params.toolA} {params.toolB} {input};\n"
                "bash ./Scripts/calculate-total-from-tsv.sh {output} {params.toolA} {params.toolB}"
