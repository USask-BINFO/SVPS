configfile: "./config-SVPS.yaml"

#Identify Reference and Assembly Input Directories and Prefixes for Rules
GENOME_DIR=config["genomesFolder"]
REF_SAMP_NAME=config["refSampleName"]
REF_PREFIX=str(GENOME_DIR + "/" + REF_SAMP_NAME)
REF_FILTERED=str(REF_PREFIX + ".filtered.fasta")
QRY_SAMP_NAME=config["qrySampleName"]
QRY_PREFIX=str(GENOME_DIR + "/" + QRY_SAMP_NAME)
QRY_FILTERED=str(QRY_PREFIX + ".filtered.fasta")

#Identify Alignment Output Directories and Prefixes for Rules
ALIGN_DIR=config["alignResultsFolder"]
MNMP2_GENOMES_PREFIX=str(ALIGN_DIR+ "/Minimap2/" + REF_SAMP_NAME + "-" + QRY_SAMP_NAME +".minimap2")
MUMMER_REF_PREFIX=str(ALIGN_DIR+ "/MUMmer4/" + REF_SAMP_NAME + "-" + QRY_SAMP_NAME)
MUMMER_QRY_PREFIX=str(ALIGN_DIR+ "/MUMmer4/" + QRY_SAMP_NAME + "-" + REF_SAMP_NAME)

#Identify VCF Result Output Directories and Prefixes for Rules
SV_RESULTS_DIR=config["svResultsFolder"]
SVPS_REF_PREFIX=str(SV_RESULTS_DIR + "/SVPS/" + REF_SAMP_NAME)
SVPS_QRY_PREFIX=str(SV_RESULTS_DIR + "/SVPS/" + QRY_SAMP_NAME)
SVIM_ASM_PREFIX=str(SV_RESULTS_DIR + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm")
SYRI_REF_PREFIX=str(SV_RESULTS_DIR + "/SYRI/REF/" + REF_SAMP_NAME)
SYRI_QRY_PREFIX=str(SV_RESULTS_DIR + "/SYRI/QRY/" + QRY_SAMP_NAME)
MUMCO_REF_PREFIX=str(SV_RESULTS_DIR + "/MUMCO/" + REF_SAMP_NAME)
MUMCO_QRY_PREFIX=str(SV_RESULTS_DIR + "/MUMCO/" + QRY_SAMP_NAME)

INTERSECT_DIR=config["bedtoolsResultsFolder"]

#Identify Benchmarking Result Output Directory and Repeat Frequency for Rules
BENCH_DIR=config["benchmarkDir"]
BENCH_REPEAT=config["repeatsForBench"]


#Incorporate subrule files to be executed within this pipeline
include: "./Rules/filter_genomes.smk"
include: "./Rules/align_genomes_w_mummer4.smk"
include: "./Rules/align_genomes_w_minimap2.smk"

include: "./Rules/sv_calling_patterns_scripts.smk"
include: "./Rules/sv_calling_assembly_callers.smk"
include: "./Rules/sv_calling_wga_tools.smk"
include: "./Rules/extract_and_filter_wga_tool_outputs.smk"
include: "./Rules/segment_all_tool_outputs_by_size.smk"

include: "./Rules/remove_duplicated_entries.smk"
include: "./Rules/remove_Ns_from_predictions.smk"
include: "./Rules/verify_svps_predictions.smk"
include: "./Rules/convert_coords_to_bed.smk"
include: "./Rules/convert_coords_to_vcf.smk"

include: "./Rules/intersect_sv_caller_bed_results_ssm.smk"
include: "./Rules/intersect_sv_caller_bed_results_sml.smk"
include: "./Rules/intersect_sv_caller_bed_results_med.smk"
include: "./Rules/intersect_sv_caller_bed_results_lrg.smk"

include: "./Rules/summarize_tool_evaluation_rates_ssm.smk"
include: "./Rules/summarize_tool_evaluation_rates_sml.smk"
include: "./Rules/summarize_tool_evaluation_rates_med.smk"
include: "./Rules/summarize_tool_evaluation_rates_lrg.smk"
include: "./Rules/summarize_tool_evaluation_rates_all.smk"

include: "./Rules/combine_ref_bed_type_files_to_all.smk"

#Default rule containing final output file targets to ensure executiong of entire pipeline
rule all:
        input:
                ##AlignmentStage
                str(MNMP2_GENOMES_PREFIX + ".ref.sorted.bam.bai"),
                str(MNMP2_GENOMES_PREFIX + ".ref.depth"),
                str(MUMMER_REF_PREFIX + ".coords"),
                str(MUMMER_QRY_PREFIX + ".coords"),

                ##SVPS Algo Script outputs
                str(SVPS_REF_PREFIX + ".DEL.final.coords"),
                str(SVPS_REF_PREFIX + ".INS.final.coords"),
                str(SVPS_REF_PREFIX + ".DUP.final.coords"),
                str(SVPS_REF_PREFIX + ".INV.final.coords"),
                str(SVPS_REF_PREFIX + ".TRANS.final.coords"),
                str(SVPS_REF_PREFIX + ".TRANSPOS.final.coords"),
                str(SVPS_QRY_PREFIX + ".DEL.final.coords"),
                str(SVPS_QRY_PREFIX + ".INS.final.coords"),
                str(SVPS_QRY_PREFIX + ".DUP.final.coords"),
                str(SVPS_QRY_PREFIX + ".INV.final.coords"),
                str(SVPS_QRY_PREFIX + ".TRANS.final.coords"),
                str(SVPS_QRY_PREFIX + ".TRANSPOS.final.coords"),
                ##Test remove Ns script
                str(SVPS_REF_PREFIX + ".DEL.final.noN.coords"),
                str(SVPS_REF_PREFIX + ".INS.final.noN.coords"),
                str(SVPS_REF_PREFIX + ".DUP.final.noN.coords"),
                str(SVPS_REF_PREFIX + ".INV.final.noN.coords"),
                str(SVPS_REF_PREFIX + ".TRANS.final.noN.coords"),
                str(SVPS_REF_PREFIX + ".TRANS.final.noN.coords"),
                str(SVPS_QRY_PREFIX + ".DEL.final.noN.coords"),
                str(SVPS_QRY_PREFIX + ".INS.final.noN.coords"),
                str(SVPS_QRY_PREFIX + ".DUP.final.noN.coords"),
                str(SVPS_QRY_PREFIX + ".INV.final.noN.coords"),
                str(SVPS_QRY_PREFIX + ".TRANS.final.noN.coords"),
                str(SVPS_QRY_PREFIX + ".TRANSPOS.final.noN.coords"),
                ##Test conversion of files to bed
                str(SVPS_REF_PREFIX + ".DEL.merged.bed"),
                str(SVPS_REF_PREFIX + ".INS.merged.bed"),
                str(SVPS_REF_PREFIX + ".DUP.merged.bed"),
                str(SVPS_REF_PREFIX + ".INV.merged.bed"),
                str(SVPS_REF_PREFIX + ".TRANS.merged.bed"),
                str(SVPS_REF_PREFIX + ".TRANSPOS.merged.bed"),
                str(SVPS_QRY_PREFIX + ".DEL.merged.bed"),
                str(SVPS_QRY_PREFIX + ".INS.merged.bed"),
                str(SVPS_QRY_PREFIX + ".DUP.merged.bed"),
                str(SVPS_QRY_PREFIX + ".INV.merged.bed"),
                str(SVPS_QRY_PREFIX + ".TRANS.merged.bed"),
                str(SVPS_QRY_PREFIX + ".TRANSPOS.merged.bed"),
                ## Test conversion of files to VCF
                str(SVPS_REF_PREFIX + ".DEL.vcf"),
                str(SVPS_REF_PREFIX + ".INS.vcf"),
                str(SVPS_REF_PREFIX + ".DUP.vcf"),
                str(SVPS_REF_PREFIX + ".INV.vcf"),
                str(SVPS_REF_PREFIX + ".TRANSLOC.vcf"),
                str(SVPS_REF_PREFIX + ".TRANSPOS.vcf"),
                str(SVPS_QRY_PREFIX + ".DEL.vcf"),
                str(SVPS_QRY_PREFIX + ".INS.vcf"),
                str(SVPS_QRY_PREFIX + ".DUP.vcf"),
                str(SVPS_QRY_PREFIX + ".INV.vcf"),
                str(SVPS_QRY_PREFIX + ".TRANSLOC.vcf"),
                str(SVPS_QRY_PREFIX + ".TRANSPOS.vcf"),
                ##Verify SVPS Prediction checking scripts
                str(config["verifyAlignFolder"] + "/REF/DEL-SimilarityResults.out"),
                str(config["verifyAlignFolder"] + "/REF/DUP-SimilarityResults.out"),
                str(config["verifyAlignFolder"] + "/REF/INV-SimilarityResults.out"),
                str(config["verifyAlignFolder"] + "/REF/TRANS-SimilarityResults.out"),
                str(config["verifyAlignFolder"] + "/REF/TRANSPOS-SimilarityResults.out"),
#                str(config["verifyAlignFolder"] + "/REF/" + REF_SAMP_NAME + "minimap2.gapRegions.depth"),
                ## Final Outputs
                str(SVPS_REF_PREFIX + ".ALL.fromMerged.bed"),
                str(SVPS_QRY_PREFIX + ".ALL.fromMerged.bed"),
                str(SVPS_REF_PREFIX + ".ALL.sorted.vcf"),
                str(SVPS_QRY_PREFIX + ".ALL.sorted.vcf"),

                ##WGASVCallingStage - For comparison

                ##Run the WGA callers
                #str(SYRI_REF_PREFIX + ".syri.mummer.out"),
                #str(SYRI_QRY_PREFIX + ".syri.mummer.out"),
                #str(SYRI_REF_PREFIX + ".syri.minimap.out"),
                #str(SYRI_QRY_PREFIX + ".syri.minimap.out"),
                #str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME +"_output/" + REF_SAMP_NAME +".SVs_all.tsv"),
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME +"_output/" + QRY_SAMP_NAME +".SVs_all.tsv"),

                #Reformat WGA Caller outputs

                ##Convert outputs to BED
                #str(SYRI_REF_PREFIX +".syri.mummer.final.DEL.bed"),
                #str(SYRI_REF_PREFIX +".syri.mummer.final.INS.bed"),
                #str(SYRI_REF_PREFIX +".syri.mummer.final.DUP.bed"),
                #str(SYRI_REF_PREFIX +".syri.mummer.final.INV.bed"),
                #str(SYRI_REF_PREFIX +".syri.mummer.final.TRANS.bed"),
                #str(SYRI_QRY_PREFIX +".syri.mummer.final.DEL.bed"),
                #str(SYRI_QRY_PREFIX +".syri.mummer.final.INS.bed"),
                #str(SYRI_QRY_PREFIX +".syri.mummer.final.DUP.bed"),
                #str(SYRI_QRY_PREFIX +".syri.mummer.final.INV.bed"),
                #str(SYRI_QRY_PREFIX +".syri.mummer.final.TRANS.bed"),
                #str(SYRI_REF_PREFIX +".syri.minimap.final.DEL.bed"),
                #str(SYRI_REF_PREFIX +".syri.minimap.final.INS.bed"),
                #str(SYRI_REF_PREFIX +".syri.minimap.final.DUP.bed"),
                #str(SYRI_REF_PREFIX +".syri.minimap.final.INV.bed"),
                #str(SYRI_REF_PREFIX +".syri.minimap.final.TRANS.bed"),
                #str(SYRI_REF_PREFIX +".syri.minimap.final.TRANSPOS.bed"),
                #str(SYRI_QRY_PREFIX +".syri.minimap.final.DEL.bed"),
                #str(SYRI_QRY_PREFIX +".syri.minimap.final.INS.bed"),
                #str(SYRI_QRY_PREFIX +".syri.minimap.final.DUP.bed"),
                #str(SYRI_QRY_PREFIX +".syri.minimap.final.INV.bed"),
                #str(SYRI_QRY_PREFIX +".syri.minimap.final.TRANS.bed"),

                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + ".mumco_output/" + REF_SAMP_NAME +".mumco.SVs_ALL.bed"),
                str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + ".mumco_output/" + REF_SAMP_NAME +".mumco.SVs_filtered.vcf"),
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_ALL.bed"),
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_filtered.vcf"),

                #str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME +".SVs_DEL.bed"),
                #str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME +".SVs_INS.bed"),
                #str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME +".SVs_DUP.bed"),
                #str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME +".SVs_INV.bed"),
                #str(SV_RESULTS_DIR + "/MUMCO/REF/" + REF_SAMP_NAME + "_output/" + REF_SAMP_NAME +".SVs_TRANS.bed"),
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_ALL.bed"),
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_filtered.vcf")
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_DEL.bed"),
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_INS.bed"),
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_DUP.bed"),
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_INV.bed"),
                #str(SV_RESULTS_DIR + "/MUMCO/QRY/" + QRY_SAMP_NAME + "_output/" + QRY_SAMP_NAME +".SVs_TRANS.bed"),
