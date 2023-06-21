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
                delOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.SSm.bed"),
                insOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.SSm.bed"),
                dupOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.SSm.bed"),
                invOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.SSm.bed"),
                transOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.SSm.bed"),
                delOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Sml.bed"),
                insOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Sml.bed"),
                dupOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Sml.bed"),
                invOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Sml.bed"),
                transOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Sml.bed"),
                delOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Med.bed"),
                insOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Med.bed"),
                dupOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Med.bed"),
                invOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Med.bed"),
                transOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Med.bed"),
                delOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DEL.Lrg.bed"),
                insOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INS.Lrg.bed"),
                dupOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.DUP.Lrg.bed"),
                invOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.INV.Lrg.bed"),
                transOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.TRANS.Lrg.bed"),

                delTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.SSm.bed"),
                insTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.SSm.bed"),
                dupTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.SSm.bed"),
                invTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.SSm.bed"),
                transTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.SSm.bed"),
                delTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.Sml.bed"),
                insTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.Sml.bed"),
                dupTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.Sml.bed"),
                invTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.Sml.bed"),
                transTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.Sml.bed"),
                delTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.Med.bed"),
                insTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.Med.bed"),
                dupTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.Med.bed"),
                invTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.Med.bed"),
                transTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.Med.bed"),
                delTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DEL.Lrg.bed"),
                insTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INS.Lrg.bed"),
                dupTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.DUP.Lrg.bed"),
                invTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.INV.Lrg.bed"),
                transTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.TRANS.Lrg.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/MUMCO.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS/REF/SVPS.ALL.intersect.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.delOneSSm} {input.insOneSSm} {input.dupOneSSm} {input.invOneSSm} {input.transOneSSm} {input.delOneSml} {input.insOneSml} {input.dupOneSml} {input.invOneSml} {input.transOneSml}"
                " {input.delOneMed} {input.insOneMed} {input.dupOneMed} {input.invOneMed} {input.transOneMed} {input.delOneLrg} {input.insOneLrg} {input.dupOneLrg} {input.invOneLrg} {input.transOneLrg};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.delTwoSSm} {input.insTwoSSm} {input.dupTwoSSm} {input.invTwoSSm} {input.transTwoSSm} {input.delTwoSml} {input.insTwoSml} {input.dupTwoSml} {input.invTwoSml} {input.transTwoSml}"
                " {input.delTwoMed} {input.insTwoMed} {input.dupTwoMed} {input.invTwoMed} {input.transTwoMed} {input.delTwoLrg} {input.insTwoLrg} {input.dupTwoLrg} {input.invTwoLrg} {input.transTwoLrg}"

rule combine_ref_mumco_syri_mummer_intersects_to_all_bed_file:
        input:
                delOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DEL.SSm.bed"),
                insOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INS.SSm.bed"),
                dupOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DUP.SSm.bed"),
                invOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INV.SSm.bed"),
                transOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.TRANS.SSm.bed"),
                delOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DEL.Sml.bed"),
                insOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INS.Sml.bed"),
                dupOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DUP.Sml.bed"),
                invOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INV.Sml.bed"),
                transOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.TRANS.Sml.bed"),
                delOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DEL.Med.bed"),
                insOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INS.Med.bed"),
                dupOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DUP.Med.bed"),
                invOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INV.Med.bed"),
                transOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.TRANS.Med.bed"),
                delOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DEL.Lrg.bed"),
                insOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INS.Lrg.bed"),
                dupOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.DUP.Lrg.bed"),
                invOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.INV.Lrg.bed"),
                transOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.TRANS.Lrg.bed"),

                delTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DEL.SSm.bed"),
                insTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INS.SSm.bed"),
                dupTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DUP.SSm.bed"),
                invTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INV.SSm.bed"),
                transTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.TRANS.SSm.bed"),
                delTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DEL.Sml.bed"),
                insTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INS.Sml.bed"),
                dupTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DUP.Sml.bed"),
                invTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INV.Sml.bed"),
                transTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.TRANS.Sml.bed"),
                delTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DEL.Med.bed"),
                insTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INS.Med.bed"),
                dupTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DUP.Med.bed"),
                invTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INV.Med.bed"),
                transTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.TRANS.Med.bed"),
                delTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DEL.Lrg.bed"),
                insTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INS.Lrg.bed"),
                dupTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.DUP.Lrg.bed"),
                invTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.INV.Lrg.bed"),
                transTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.TRANS.Lrg.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/MUMCO.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MUM/REF/SYRI-MUM.ALL.intersect.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.delOneSSm} {input.insOneSSm} {input.dupOneSSm} {input.invOneSSm} {input.transOneSSm} {input.delOneSml} {input.insOneSml} {input.dupOneSml} {input.invOneSml} {input.transOneSml}"
                " {input.delOneMed} {input.insOneMed} {input.dupOneMed} {input.invOneMed} {input.transOneMed} {input.delOneLrg} {input.insOneLrg} {input.dupOneLrg} {input.invOneLrg} {input.transOneLrg};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.delTwoSSm} {input.insTwoSSm} {input.dupTwoSSm} {input.invTwoSSm} {input.transTwoSSm} {input.delTwoSml} {input.insTwoSml} {input.dupTwoSml} {input.invTwoSml} {input.transTwoSml}"
                " {input.delTwoMed} {input.insTwoMed} {input.dupTwoMed} {input.invTwoMed} {input.transTwoMed} {input.delTwoLrg} {input.insTwoLrg} {input.dupTwoLrg} {input.invTwoLrg} {input.transTwoLrg}"

rule combine_ref_mumco_syri_minimap_intersects_to_all_bed_file:
        input:
                delOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DEL.SSm.bed"),
                insOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INS.SSm.bed"),
                dupOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DUP.SSm.bed"),
                invOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INV.SSm.bed"),
                transOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.TRANS.SSm.bed"),
                delOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DEL.Sml.bed"),
                insOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INS.Sml.bed"),
                dupOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DUP.Sml.bed"),
                invOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INV.Sml.bed"),
                transOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.TRANS.Sml.bed"),
                delOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DEL.Med.bed"),
                insOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INS.Med.bed"),
                dupOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DUP.Med.bed"),
                invOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INV.Med.bed"),
                transOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.TRANS.Med.bed"),
                delOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DEL.Lrg.bed"),
                insOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INS.Lrg.bed"),
                dupOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.DUP.Lrg.bed"),
                invOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.INV.Lrg.bed"),
                transOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.TRANS.Lrg.bed"),

                delTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DEL.SSm.bed"),
                insTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INS.SSm.bed"),
                dupTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DUP.SSm.bed"),
                invTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INV.SSm.bed"),
                transTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.TRANS.SSm.bed"),
                delTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DEL.Sml.bed"),
                insTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INS.Sml.bed"),
                dupTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DUP.Sml.bed"),
                invTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INV.Sml.bed"),
                transTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.TRANS.Sml.bed"),
                delTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DEL.Med.bed"),
                insTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INS.Med.bed"),
                dupTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DUP.Med.bed"),
                invTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INV.Med.bed"),
                transTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.TRANS.Med.bed"),
                delTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DEL.Lrg.bed"),
                insTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INS.Lrg.bed"),
                dupTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.DUP.Lrg.bed"),
                invTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.INV.Lrg.bed"),
                transTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.TRANS.Lrg.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/MUMCO.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI/REF/SYRI-MINI.ALL.intersect.bed")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.delOneSSm} {input.insOneSSm} {input.dupOneSSm} {input.invOneSSm} {input.transOneSSm} {input.delOneSml} {input.insOneSml} {input.dupOneSml} {input.invOneSml} {input.transOneSml}"
                " {input.delOneMed} {input.insOneMed} {input.dupOneMed} {input.invOneMed} {input.transOneMed} {input.delOneLrg} {input.insOneLrg} {input.dupOneLrg} {input.invOneLrg} {input.transOneLrg};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.delTwoSSm} {input.insTwoSSm} {input.dupTwoSSm} {input.invTwoSSm} {input.transTwoSSm} {input.delTwoSml} {input.insTwoSml} {input.dupTwoSml} {input.invTwoSml} {input.transTwoSml}"
                " {input.delTwoMed} {input.insTwoMed} {input.dupTwoMed} {input.invTwoMed} {input.transTwoMed} {input.delTwoLrg} {input.insTwoLrg} {input.dupTwoLrg} {input.invTwoLrg} {input.transTwoLrg}"

rule combine_ref_svps_syri_mummer_intersects_to_all_bed_file:
        input:
                delOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.SSm.bed"),
                insOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.SSm.bed"),
                dupOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.SSm.bed"),
                invOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.SSm.bed"),
                transOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.SSm.bed"),
                delOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Sml.bed"),
                insOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Sml.bed"),
                dupOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Sml.bed"),
                invOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Sml.bed"),
                transOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Sml.bed"),
                delOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Med.bed"),
                insOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Med.bed"),
                dupOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Med.bed"),
                invOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Med.bed"),
                transOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Med.bed"),
                delOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DEL.Lrg.bed"),
                insOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INS.Lrg.bed"),
                dupOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.DUP.Lrg.bed"),
                invOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.INV.Lrg.bed"),
                transOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.TRANS.Lrg.bed"),

                delTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DEL.SSm.bed"),
                insTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INS.SSm.bed"),
                dupTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DUP.SSm.bed"),
                invTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INV.SSm.bed"),
                transTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.TRANS.SSm.bed"),
                delTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DEL.Sml.bed"),
                insTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INS.Sml.bed"),
                dupTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DUP.Sml.bed"),
                invTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INV.Sml.bed"),
                transTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.TRANS.Sml.bed"),
                delTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DEL.Med.bed"),
                insTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INS.Med.bed"),
                dupTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DUP.Med.bed"),
                invTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INV.Med.bed"),
                transTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.TRANS.Med.bed"),
                delTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DEL.Lrg.bed"),
                insTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INS.Lrg.bed"),
                dupTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.DUP.Lrg.bed"),
                invTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.INV.Lrg.bed"),
                transTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.TRANS.Lrg.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SVPS.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MUM/REF/SYRI-MUM.ALL.intersect.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.delOneSSm} {input.insOneSSm} {input.dupOneSSm} {input.invOneSSm} {input.transOneSSm} {input.delOneSml} {input.insOneSml} {input.dupOneSml} {input.invOneSml} {input.transOneSml}"
                " {input.delOneMed} {input.insOneMed} {input.dupOneMed} {input.invOneMed} {input.transOneMed} {input.delOneLrg} {input.insOneLrg} {input.dupOneLrg} {input.invOneLrg} {input.transOneLrg};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.delTwoSSm} {input.insTwoSSm} {input.dupTwoSSm} {input.invTwoSSm} {input.transTwoSSm} {input.delTwoSml} {input.insTwoSml} {input.dupTwoSml} {input.invTwoSml} {input.transTwoSml}"
                " {input.delTwoMed} {input.insTwoMed} {input.dupTwoMed} {input.invTwoMed} {input.transTwoMed} {input.delTwoLrg} {input.insTwoLrg} {input.dupTwoLrg} {input.invTwoLrg} {input.transTwoLrg}"

rule combine_ref_svps_syri_minimap_intersects_to_all_bed_file:
        input:
                delOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.SSm.bed"),
                insOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.SSm.bed"),
                dupOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.SSm.bed"),
                invOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.SSm.bed"),
                transOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.SSm.bed"),
                delOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Sml.bed"),
                insOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Sml.bed"),
                dupOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Sml.bed"),
                invOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Sml.bed"),
                transOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Sml.bed"),
                delOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Med.bed"),
                insOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Med.bed"),
                dupOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Med.bed"),
                invOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Med.bed"),
                transOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Med.bed"),
                delOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DEL.Lrg.bed"),
                insOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INS.Lrg.bed"),
                dupOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.DUP.Lrg.bed"),
                invOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.INV.Lrg.bed"),
                transOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.TRANS.Lrg.bed"),

                delTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DEL.SSm.bed"),
                insTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INS.SSm.bed"),
                dupTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DUP.SSm.bed"),
                invTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INV.SSm.bed"),
                transTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.TRANS.SSm.bed"),
                delTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DEL.Sml.bed"),
                insTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INS.Sml.bed"),
                dupTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DUP.Sml.bed"),
                invTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INV.Sml.bed"),
                transTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.TRANS.Sml.bed"),
                delTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DEL.Med.bed"),
                insTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INS.Med.bed"),
                dupTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DUP.Med.bed"),
                invTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INV.Med.bed"),
                transTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.TRANS.Med.bed"),
                delTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DEL.Lrg.bed"),
                insTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INS.Lrg.bed"),
                dupTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.DUP.Lrg.bed"),
                invTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.INV.Lrg.bed"),
                transTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.TRANS.Lrg.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SVPS.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI/REF/SYRI-MINI.ALL.intersect.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.delOneSSm} {input.insOneSSm} {input.dupOneSSm} {input.invOneSSm} {input.transOneSSm} {input.delOneSml} {input.insOneSml} {input.dupOneSml} {input.invOneSml} {input.transOneSml}"
                " {input.delOneMed} {input.insOneMed} {input.dupOneMed} {input.invOneMed} {input.transOneMed} {input.delOneLrg} {input.insOneLrg} {input.dupOneLrg} {input.invOneLrg} {input.transOneLrg};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.delTwoSSm} {input.insTwoSSm} {input.dupTwoSSm} {input.invTwoSSm} {input.transTwoSSm} {input.delTwoSml} {input.insTwoSml} {input.dupTwoSml} {input.invTwoSml} {input.transTwoSml}"
                " {input.delTwoMed} {input.insTwoMed} {input.dupTwoMed} {input.invTwoMed} {input.transTwoMed} {input.delTwoLrg} {input.insTwoLrg} {input.dupTwoLrg} {input.invTwoLrg} {input.transTwoLrg}"

rule combine_ref_syri_minimap_syri_mummer_intersects_to_all_bed_file:
        input:
                delOneSSm=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.SSm.bed"),
                insOneSSm=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.SSm.bed"),
                dupOneSSm=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.SSm.bed"),
                invOneSSm=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.SSm.bed"),
                transOneSSm=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.SSm.bed"),
                delOneSml=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Sml.bed"),
                insOneSml=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Sml.bed"),
                dupOneSml=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Sml.bed"),
                invOneSml=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Sml.bed"),
                transOneSml=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Sml.bed"),
                delOneMed=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Med.bed"),
                insOneMed=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Med.bed"),
                dupOneMed=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Med.bed"),
                invOneMed=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Med.bed"),
                transOneMed=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Med.bed"),
                delOneLrg=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DEL.Lrg.bed"),
                insOneLrg=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INS.Lrg.bed"),
                dupOneLrg=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.DUP.Lrg.bed"),
                invOneLrg=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.INV.Lrg.bed"),
                transOneLrg=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.TRANS.Lrg.bed"),

                delTwoSSm=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DEL.SSm.bed"),
                insTwoSSm=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INS.SSm.bed"),
                dupTwoSSm=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DUP.SSm.bed"),
                invTwoSSm=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INV.SSm.bed"),
                transTwoSSm=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.TRANS.SSm.bed"),
                delTwoSml=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DEL.Sml.bed"),
                insTwoSml=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INS.Sml.bed"),
                dupTwoSml=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DUP.Sml.bed"),
                invTwoSml=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INV.Sml.bed"),
                transTwoSml=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.TRANS.Sml.bed"),
                delTwoMed=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DEL.Med.bed"),
                insTwoMed=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INS.Med.bed"),
                dupTwoMed=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DUP.Med.bed"),
                invTwoMed=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INV.Med.bed"),
                transTwoMed=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.TRANS.Med.bed"),
                delTwoLrg=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DEL.Lrg.bed"),
                insTwoLrg=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INS.Lrg.bed"),
                dupTwoLrg=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.DUP.Lrg.bed"),
                invTwoLrg=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.INV.Lrg.bed"),
                transTwoLrg=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.TRANS.Lrg.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MINI.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/SYRI-MINI-SYRI-MUM/REF/SYRI-MUM.ALL.intersect.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.delOneSSm} {input.insOneSSm} {input.dupOneSSm} {input.invOneSSm} {input.transOneSSm} {input.delOneSml} {input.insOneSml} {input.dupOneSml} {input.invOneSml} {input.transOneSml}"
                " {input.delOneMed} {input.insOneMed} {input.dupOneMed} {input.invOneMed} {input.transOneMed} {input.delOneLrg} {input.insOneLrg} {input.dupOneLrg} {input.invOneLrg} {input.transOneLrg};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.delTwoSSm} {input.insTwoSSm} {input.dupTwoSSm} {input.invTwoSSm} {input.transTwoSSm} {input.delTwoSml} {input.insTwoSml} {input.dupTwoSml} {input.invTwoSml} {input.transTwoSml}"
                " {input.delTwoMed} {input.insTwoMed} {input.dupTwoMed} {input.invTwoMed} {input.transTwoMed} {input.delTwoLrg} {input.insTwoLrg} {input.dupTwoLrg} {input.invTwoLrg} {input.transTwoLrg}"

rule combine_ref_svps_syri_minimap_syri_mummer_types_to_all_bed_file:
        input:
                delOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DEL.SSm.bed"),
                insOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INS.SSm.bed"),
                dupOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DUP.SSm.bed"),
                invOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INV.SSm.bed"),
                transOneSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.TRANS.SSm.bed"),
                delOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DEL.Sml.bed"),
                insOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INS.Sml.bed"),
                dupOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DUP.Sml.bed"),
                invOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INV.Sml.bed"),
                transOneSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.TRANS.Sml.bed"),
                delOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DEL.Med.bed"),
                insOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INS.Med.bed"),
                dupOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DUP.Med.bed"),
                invOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INV.Med.bed"),
                transOneMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.TRANS.Med.bed"),
                delOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DEL.Lrg.bed"),
                insOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INS.Lrg.bed"),
                dupOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.DUP.Lrg.bed"),
                invOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.INV.Lrg.bed"),
                transOneLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.TRANS.Lrg.bed"),

                delTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.SSm.bed"),
                insTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.SSm.bed"),
                dupTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.SSm.bed"),
                invTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.SSm.bed"),
                transTwoSSm=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.SSm.bed"),
                delTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Sml.bed"),
                insTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Sml.bed"),
                dupTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Sml.bed"),
                invTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Sml.bed"),
                transTwoSml=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Sml.bed"),
                delTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Med.bed"),
                insTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Med.bed"),
                dupTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Med.bed"),
                invTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Med.bed"),
                transTwoMed=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Med.bed"),
                delTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Lrg.bed"),
                insTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Lrg.bed"),
                dupTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Lrg.bed"),
                invTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Lrg.bed"),
                transTwoLrg=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Lrg.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SVPS.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.ALL.intersect.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.delOneSSm} {input.insOneSSm} {input.dupOneSSm} {input.invOneSSm} {input.transOneSSm} {input.delOneSml} {input.insOneSml} {input.dupOneSml} {input.invOneSml} {input.transOneSml}"
                " {input.delOneMed} {input.insOneMed} {input.dupOneMed} {input.invOneMed} {input.transOneMed} {input.delOneLrg} {input.insOneLrg} {input.dupOneLrg} {input.invOneLrg} {input.transOneLrg};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.delTwoSSm} {input.insTwoSSm} {input.dupTwoSSm} {input.invTwoSSm} {input.transTwoSSm} {input.delTwoSml} {input.insTwoSml} {input.dupTwoSml} {input.invTwoSml} {input.transTwoSml}"
                " {input.delTwoMed} {input.insTwoMed} {input.dupTwoMed} {input.invTwoMed} {input.transTwoMed} {input.delTwoLrg} {input.insTwoLrg} {input.dupTwoLrg} {input.invTwoLrg} {input.transTwoLrg}"

rule combine_ref_mumco_syri_minimap_syri_mummer_types_to_all_bed_file:
        input:
                delOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DEL.SSm.bed"),
                insOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INS.SSm.bed"),
                dupOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DUP.SSm.bed"),
                invOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INV.SSm.bed"),
                transOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.TRANS.SSm.bed"),
                delOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DEL.Sml.bed"),
                insOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INS.Sml.bed"),
                dupOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DUP.Sml.bed"),
                invOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INV.Sml.bed"),
                transOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.TRANS.Sml.bed"),
                delOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DEL.Med.bed"),
                insOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INS.Med.bed"),
                dupOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DUP.Med.bed"),
                invOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INV.Med.bed"),
                transOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.TRANS.Med.bed"),
                delOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DEL.Lrg.bed"),
                insOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INS.Lrg.bed"),
                dupOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.DUP.Lrg.bed"),
                invOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.INV.Lrg.bed"),
                transOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.TRANS.Lrg.bed"),

                delTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.SSm.bed"),
                insTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.SSm.bed"),
                dupTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.SSm.bed"),
                invTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.SSm.bed"),
                transTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.SSm.bed"),
                delTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Sml.bed"),
                insTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Sml.bed"),
                dupTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Sml.bed"),
                invTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Sml.bed"),
                transTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Sml.bed"),
                delTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Med.bed"),
                insTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Med.bed"),
                dupTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Med.bed"),
                invTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Med.bed"),
                transTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Med.bed"),
                delTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Lrg.bed"),
                insTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Lrg.bed"),
                dupTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Lrg.bed"),
                invTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Lrg.bed"),
                transTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Lrg.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/MUMCO.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.ALL.intersect.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.delOneSSm} {input.insOneSSm} {input.dupOneSSm} {input.invOneSSm} {input.transOneSSm} {input.delOneSml} {input.insOneSml} {input.dupOneSml} {input.invOneSml} {input.transOneSml}"
                " {input.delOneMed} {input.insOneMed} {input.dupOneMed} {input.invOneMed} {input.transOneMed} {input.delOneLrg} {input.insOneLrg} {input.dupOneLrg} {input.invOneLrg} {input.transOneLrg};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.delTwoSSm} {input.insTwoSSm} {input.dupTwoSSm} {input.invTwoSSm} {input.transTwoSSm} {input.delTwoSml} {input.insTwoSml} {input.dupTwoSml} {input.invTwoSml} {input.transTwoSml}"
                " {input.delTwoMed} {input.insTwoMed} {input.dupTwoMed} {input.invTwoMed} {input.transTwoMed} {input.delTwoLrg} {input.insTwoLrg} {input.dupTwoLrg} {input.invTwoLrg} {input.transTwoLrg}"

rule combine_ref_mumco_svps_syri_minimap_types_to_all_bed_file:
        input:
                delOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DEL.SSm.bed"),
                insOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INS.SSm.bed"),
                dupOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DUP.SSm.bed"),
                invOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INV.SSm.bed"),
                transOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.TRANS.SSm.bed"),
                delOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DEL.Sml.bed"),
                insOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INS.Sml.bed"),
                dupOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DUP.Sml.bed"),
                invOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INV.Sml.bed"),
                transOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.TRANS.Sml.bed"),
                delOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DEL.Med.bed"),
                insOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INS.Med.bed"),
                dupOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DUP.Med.bed"),
                invOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INV.Med.bed"),
                transOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.TRANS.Med.bed"),
                delOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DEL.Lrg.bed"),
                insOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INS.Lrg.bed"),
                dupOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.DUP.Lrg.bed"),
                invOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.INV.Lrg.bed"),
                transOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.TRANS.Lrg.bed"),

                delTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DEL.SSm.bed"),
                insTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INS.SSm.bed"),
                dupTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DUP.SSm.bed"),
                invTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INV.SSm.bed"),
                transTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.TRANS.SSm.bed"),
                delTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DEL.Sml.bed"),
                insTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INS.Sml.bed"),
                dupTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DUP.Sml.bed"),
                invTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INV.Sml.bed"),
                transTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.TRANS.Sml.bed"),
                delTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DEL.Med.bed"),
                insTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INS.Med.bed"),
                dupTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DUP.Med.bed"),
                invTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INV.Med.bed"),
                transTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.TRANS.Med.bed"),
                delTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DEL.Lrg.bed"),
                insTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INS.Lrg.bed"),
                dupTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.DUP.Lrg.bed"),
                invTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.INV.Lrg.bed"),
                transTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.TRANS.Lrg.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/MUMCO.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI/REF/SVPS-SYRI-MINI.ALL.intersect.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.delOneSSm} {input.insOneSSm} {input.dupOneSSm} {input.invOneSSm} {input.transOneSSm} {input.delOneSml} {input.insOneSml} {input.dupOneSml} {input.invOneSml} {input.transOneSml}"
                " {input.delOneMed} {input.insOneMed} {input.dupOneMed} {input.invOneMed} {input.transOneMed} {input.delOneLrg} {input.insOneLrg} {input.dupOneLrg} {input.invOneLrg} {input.transOneLrg};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.delTwoSSm} {input.insTwoSSm} {input.dupTwoSSm} {input.invTwoSSm} {input.transTwoSSm} {input.delTwoSml} {input.insTwoSml} {input.dupTwoSml} {input.invTwoSml} {input.transTwoSml}"
                " {input.delTwoMed} {input.insTwoMed} {input.dupTwoMed} {input.invTwoMed} {input.transTwoMed} {input.delTwoLrg} {input.insTwoLrg} {input.dupTwoLrg} {input.invTwoLrg} {input.transTwoLrg}"

rule combine_ref_mumco_svps_syri_mummer_types_to_all_bed_file:
        input:
                delOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DEL.SSm.bed"),
                insOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INS.SSm.bed"),
                dupOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DUP.SSm.bed"),
                invOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INV.SSm.bed"),
                transOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.TRANS.SSm.bed"),
                delOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DEL.Sml.bed"),
                insOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INS.Sml.bed"),
                dupOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DUP.Sml.bed"),
                invOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INV.Sml.bed"),
                transOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.TRANS.Sml.bed"),
                delOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DEL.Med.bed"),
                insOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INS.Med.bed"),
                dupOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DUP.Med.bed"),
                invOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INV.Med.bed"),
                transOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.TRANS.Med.bed"),
                delOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DEL.Lrg.bed"),
                insOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INS.Lrg.bed"),
                dupOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.DUP.Lrg.bed"),
                invOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.INV.Lrg.bed"),
                transOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.TRANS.Lrg.bed"),

                delTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DEL.SSm.bed"),
                insTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INS.SSm.bed"),
                dupTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DUP.SSm.bed"),
                invTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INV.SSm.bed"),
                transTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.TRANS.SSm.bed"),
                delTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DEL.Sml.bed"),
                insTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INS.Sml.bed"),
                dupTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DUP.Sml.bed"),
                invTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INV.Sml.bed"),
                transTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.TRANS.Sml.bed"),
                delTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DEL.Med.bed"),
                insTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INS.Med.bed"),
                dupTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DUP.Med.bed"),
                invTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INV.Med.bed"),
                transTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.TRANS.Med.bed"),
                delTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DEL.Lrg.bed"),
                insTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INS.Lrg.bed"),
                dupTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.DUP.Lrg.bed"),
                invTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.INV.Lrg.bed"),
                transTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.TRANS.Lrg.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/MUMCO.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MUM/REF/SVPS-SYRI-MUM.ALL.intersect.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.delOneSSm} {input.insOneSSm} {input.dupOneSSm} {input.invOneSSm} {input.transOneSSm} {input.delOneSml} {input.insOneSml} {input.dupOneSml} {input.invOneSml} {input.transOneSml}"
                " {input.delOneMed} {input.insOneMed} {input.dupOneMed} {input.invOneMed} {input.transOneMed} {input.delOneLrg} {input.insOneLrg} {input.dupOneLrg} {input.invOneLrg} {input.transOneLrg};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.delTwoSSm} {input.insTwoSSm} {input.dupTwoSSm} {input.invTwoSSm} {input.transTwoSSm} {input.delTwoSml} {input.insTwoSml} {input.dupTwoSml} {input.invTwoSml} {input.transTwoSml}"
                " {input.delTwoMed} {input.insTwoMed} {input.dupTwoMed} {input.invTwoMed} {input.transTwoMed} {input.delTwoLrg} {input.insTwoLrg} {input.dupTwoLrg} {input.invTwoLrg} {input.transTwoLrg}"

rule combine_ref_mumco_svps_syri_minimap_syri_mummer_types_to_all_bed_file:
        input:
                delOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DEL.SSm.bed"),
                insOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INS.SSm.bed"),
                dupOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DUP.SSm.bed"),
                invOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INV.SSm.bed"),
                transOneSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.TRANS.SSm.bed"),
                delOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DEL.Sml.bed"),
                insOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INS.Sml.bed"),
                dupOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DUP.Sml.bed"),
                invOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INV.Sml.bed"),
                transOneSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.TRANS.Sml.bed"),
                delOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DEL.Med.bed"),
                insOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INS.Med.bed"),
                dupOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DUP.Med.bed"),
                invOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INV.Med.bed"),
                transOneMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.TRANS.Med.bed"),
                delOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DEL.Lrg.bed"),
                insOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INS.Lrg.bed"),
                dupOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.DUP.Lrg.bed"),
                invOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.INV.Lrg.bed"),
                transOneLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.TRANS.Lrg.bed"),

                delTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.SSm.bed"),
                insTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.SSm.bed"),
                dupTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.SSm.bed"),
                invTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.SSm.bed"),
                transTwoSSm=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.SSm.bed"),
                delTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Sml.bed"),
                insTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Sml.bed"),
                dupTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Sml.bed"),
                invTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Sml.bed"),
                transTwoSml=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Sml.bed"),
                delTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Med.bed"),
                insTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Med.bed"),
                dupTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Med.bed"),
                invTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Med.bed"),
                transTwoMed=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Med.bed"),
                delTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DEL.Lrg.bed"),
                insTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INS.Lrg.bed"),
                dupTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.DUP.Lrg.bed"),
                invTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.INV.Lrg.bed"),
                transTwoLrg=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.TRANS.Lrg.bed")
        output:
                toolOneALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/MUMCO-SVPS.ALL.intersect.bed"),
                toolTwoALL=str(config["bedtoolsResultsFolder"] + "/MUMCO-SVPS-SYRI-MINI-SYRI-MUM/REF/SYRI-MINI-SYRI-MUM.ALL.intersect.bed"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/CombineTypes.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolOneALL} {input.delOneSSm} {input.insOneSSm} {input.dupOneSSm} {input.invOneSSm} {input.transOneSSm} {input.delOneSml} {input.insOneSml} {input.dupOneSml} {input.invOneSml} {input.transOneSml}"
                " {input.delOneMed} {input.insOneMed} {input.dupOneMed} {input.invOneMed} {input.transOneMed} {input.delOneLrg} {input.insOneLrg} {input.dupOneLrg} {input.invOneLrg} {input.transOneLrg};\n"
                "bash ./Scripts/combine-bed-sv-type-files.sh {output.toolTwoALL} {input.delTwoSSm} {input.insTwoSSm} {input.dupTwoSSm} {input.invTwoSSm} {input.transTwoSSm} {input.delTwoSml} {input.insTwoSml} {input.dupTwoSml} {input.invTwoSml} {input.transTwoSml}"
                " {input.delTwoMed} {input.insTwoMed} {input.dupTwoMed} {input.invTwoMed} {input.transTwoMed} {input.delTwoLrg} {input.insTwoLrg} {input.dupTwoLrg} {input.invTwoLrg} {input.transTwoLrg}"
