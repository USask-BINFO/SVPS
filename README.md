# SVPS

## Description
Multi-stage Snakemake pipeline that performs pairwise structural variant (SV) calling from MUMmer4 whole genome alignment (WGA) results. In addition, this pipeline evaluates a subsample of all SV results using a second aligner using automated methods that rely on alignment PID or alignment depth. 
This workflow simplifies the generation of WGA-based SV results to help SV studies overcome the read length limitations that reduce SV calling accuracy.

  - **Status**:  Version 1.0.2 - [CHANGELOG](CHANGELOG.md).

## Supported formats

SVPS requires a chromosome-level genome assembly from both a reference and query sample in FASTA format.
The input genome assembly files must be pre-downloaded by the user and the path information must be updated in the configuration file prior to execution. 
After execution, SVPS outputs SV result files in the Browser Extensible Data (BED) format which details the predicted SVs' coordinates and in Variant Call Format (VCF).
 
## Dependencies

SVPS is a Snakemake pipeline that incorporates multiple third party software tools. Many of these tools are installable as conda package so the pipeline includes
a conda configuration file for user convenience.

The full list of required software is provided below and includes version information for the software versions that were used during testing:

#### Dependencies installed through the provided conda configuration file

  - python		(3.9.15)
  - biopython		(1.85)
  - syri		(1.6.3)
  - svim-asm		(1.0.3)
  - scipy		(1.10.1)
  - mamba		(1.2.0)
  - numpy		(1.24.2)
  - snakemake		(7.24.0)
  - pandas		(1.5.3)
  - matplotlib		(3.7.1)

#### Other dependencies

  - MUMmer4		(4.0.0rc1)
  - EMBOSS		(6.4.0)
  - Minimap2		(2.24-r1122)
  - MUM&Co              (3.8)
  - SAMTools		(1.16.1)
  - BCFTools		(1.16)
  - BEDTools		(2.30.0)

Additionally, the pipeline must be launched from an environment with Snakemake installed.


## Installation

As a Snakemake workflow that employs external tools, the installation only involves cloning this repository:

```
git clone https://github.com/USask-BINFO/SVPS
```

After cloning the SVPS repository, the conda dependencies will be loaded by Snakemake automatically during execution based on the included conda env configuration file.
For the remaining dependencies please consult the installation instructions provided by each tool's github/manual and ensure these tools are added to your PATH variable.

## Configuration
#### Input Files Configuration
##### Reference Sequence Information
  - `refSampleName`: "TAIR10" # Short ID for user to distinguish files
  - `refAssembly`: "../Arabidopsis_Data/TAIR10.1.all.fna" # Path to Reference Genome fasta file
  - `refSeqsFile`: "../Arabidopsis_Data/RefSeqsToInclude.txt" # File of REF regions to include (one per line. Ex. Chromosomes only). Can be created with grep "><Chrom_Prefix>" <targetGenome> | tr -d ">"
  - `refSize`: 150000000 #Total size of the reference's sequences to be included
  - `refChrmPrefix`: "chr"
  - `numRefContigs`: 5 # Number of sequences/chromosomes present in assembly/genome (after selection for inclusion)

##### Query Sequence Information
  - `qrySampleName`: "Ler" # Long ID for user to distinguish files
  - `qryAssembly`: "../Arabidopsis_Data/Ler.chr.all.v2.0.fasta" # Path to Query Assembly's fasta file
  - `qrySeqsFile`: "../Arabidopsis_Data/QrySeqsToInclude.txt" # File of regions to include (one per line. Ex: Chrosomes only). Can be created with grep "><CHROM_PREFIX>" <targetGenome> | tr -d ">"
  - `qrySize`: 150000000 #Total size of the query's sequences to be included
  - `qryChrmPrefix`: "chr"
  - `numQryContigs`: 5 # Number of sequences/chromosomes present in assembly/genome (after selection for inclusion)

#### SV Pattern Evidence Configurations=
  - `svMinSize`: 50 #Minimum size threshold (in bps) for an SV (EX: 50, based on min size commonly defined in literature)
  - `svMaxSize`: 300000 #Maximum size threshold (in bps) for an SV. Set based on max detectable size from tools with which you wish to compare  (EX: 300000)
  - `vcfHeaderTemplate`: ""#Path information for the file containing the desired VCF header based on the reference sample (Template provided in Repo's home directory)

#### Environment and Working Directory Configuration
##### Available Threads (Update to reflect hardware available)
  - `threads`: 30

##### MUM&CO Configurations
  - `mumCoScript`: "$MUMCO/mumandco_v3.8.sh" # Path to MUM&Co.'s executable script (to be interpreted by shell)(Ex: "$MUMCO/mumandco_v3.8.sh")

##### Designated Working Directory Information
  - `genomesFolder`: "Workflow_Outputs/Genomes"
  - `alignResultsFolder`: "Workflow_Outputs/Alignments"
  - `svResultsFolder`: "Workflow_Outputs/SV_Calls"
  - `truvariResultsFolder`: "Workflow_Outputs/Truvari_Results"
  - `bedtoolsResultsFolder`: "Workflow_Outputs/Bedtools_Results"
  - `verifyAlignFolder`: "Workflow_Outputs/VerifyAlign"

##### Designated Conda Environment Information 
Default YAML env file provided. Note: Using only a single yaml file of all 
software reduces pipeline execution time)
  - `condaEnvYAML`: "All-Env.yaml" # Path to YAML file for conda env that majority/all of the dependencies are installed in
  - `syriCondaEnv`: "All-Env.yaml" # Path to YAML file for conda env with SyRI dependencies installed

#### Pipeline Software Configurations
##### Nucmer Configurations 
MUMmer4 defaults for now, please see MUMmer4 manual for more details. 
  - `minMatchLen`: 20 # Minimum length threshold to consider an alignment (EX: 50)
  - `minClusterSize`: 65 # Minimum length threshold for exploring a cluster of matches (EX: 100)
  - `maxEntend`: 200 # Max distance nucmer will attempt to extend poor scoring regions before giving up (EX: 500)

##### Delta-filter Configurations (for more details see MUMmer4 manual)
  - `minIdentity`: 0 # Minimum percent identity required to retain alignment (EX: 90)
  - `minToFilter`: 0 # Minimum length filtering threshold for alignments (EX:100)

##### Minimap2 Aligner Configurations 
For more details see `minimap2 --help`.
  - `presetForLR`: "map-ont" # Predefined settings based on sequencing tech (Ex: map-ont, map-pb, map-hifi)
  - `presetForAssemblies`: "asm5" # Predefined settings for assembly to ref alignment based on similarity (asm5, asm10, asm20) 
	- (see minimap2 --help for similarity thresholds)
  - `minimapZDropForLR`: "600,200" # Z drop score and Inversion Z drop score parameter in minimap (Default taken from cuteSV paper that compared similar tools)

##### SAMTools Configurations (Default settings taken from SVIM-ASM paper)
  - `memSettingForAssemblySort`: "4G" # Requested/Required memory amount when sorting minimap2's assembly-to-ref alignment output

##### General SV Caller Configurations (Default settings taken from CuteSV 
paper)
  - `minMAPQForSVs`: 20 # PHRED-scaled quality score (relates to probability of error and ranges from 4-60 w 10=10% error, 20=1%, 30=0.1%, 40=0.01%, 50=0.001%, 60=0.0001%)
  - `minSuppReadsForSVs`: 10 # Evidence threshold for the number of reads the support/indicate the presence of an SV
  - `minSizeForSVs`: 50 # Filtering for min size of the SV to be detected (50 based on common definition for SV min size in literature)
  - `maxSizeForSVs`: 300000 # Filtering maximum size for SV detectable by tools

##### Alignment Verification Sample Configurations
  - `verificationSampSize`: 1000 # Total number of coord entries for each SV type to verify
  - `indexInterval`: 100000 #Index interval when indexing samtools depth output

##### Params for determining if SVs occur at same location (based on same neighbouring/flanking genetic contents)
  - `neighbourSize`: 10000 #Consider 20x avg/median gene size
  - `invNeighbourSimilarity`: 90 # Integer value of required similarity rate (%) for bash comparison (seeking same neighbours between samples)
  - `transposNeighbourSimilarity`: 50 # Integer value of maximum similarity rate (%) for bash comparison (seeking different neighbours to identify movement)

##### BEDTools Configurations
  - `maxDistApart`: 0 # Amount of separation allowed between entries that should still be merged (0 means they must be either overlapping or side-by-side) (EX:0)
  - `overlapThreshold`: 0.5 # (0.5 [or 50%] is a commonly use setting in several publications. Alternatively, svim-asm paper used 70%)

##### BCFTools Configurations
  - `overlapThreshold`: 0.5 # (0.5 [or 50%] is a commonly use setting in several publications. Alternatively, svim-asm paper used 70%)
  - `maxRefDistance`: 1000 # (Default setting chosen based on configuration used in svim-asm paper)


## Usage

#### A) Set Up/Pre-work

 1. Update the provided SVPS config file to reflect the target input sequence information and update any setting values you wish to change from the defaults
 2. Create the files for the `refSeqsFile` and `qrySeqsFile` to specify only the target genome/assembly chroms/contigs to be considered during the pipeline's execution
	- See `grep` command suggestion in the Configuration section above for assistance
 3. Create the file for the `readFilesList` to specify which read accessions are to be included during execution.
	- Note: If any of input read files cannot/won't be fetched from SRA, please preprocess the file name to ensure the read's fastq file is unzipped and renamed to '<Accession>.fastq' to prevent unnecessary prefetching using SRATools.

#### B) Perform a dry run:

Recommended first step to confirm configuration/settings prior to executions.
Performing a dry run (-np) Builds the directed acyclic graph representing the outstanding tasks of the workflow and prints the applicable commands to be run at
each stage of pipeline to allow for review, but doesn't execute any of the related commands. 
Dry runs are also useful as they can identify errors that may occur based on current configurations and pre-work completed.

 1. cd to SVPS home directory
 2. Update configuration file to reflect inputs to be processed
 3. Run: ```snakemake -np```

#### C) Execute SVPS once configuration is prepared: 

Builds the directed acyclic graph representing the outstanding tasks of the workflow and begins execution of the underlying software. Note: the order of execution
for the outstanding tasks can vary between executions.

 1. cd to SVPS home directory
 2. Run: ```snakemake --use-conda --cores <# threads>```

Note:
 - Adding `--rerun-incompletes` to the command may be necessary if the pipeline terminates unexpectedly during execution to restart tasks that were in progress at the time.
 - Unexpected termination may also result in a locked working directory; however, this lock can be removed by either running ```snakemake --unlock``` in the SVPS home directory.

## Pipeline Test Example (Arabidopsis thaliana)

#### Input data
Due to size, the experiment's input sequence data should be obtained from the publicly accessible resources below:
 - Reference Genome: TAIR10
	- Available through the NCBI's RefSeq Genomes FTP server
	- DB Path: [/genomes/refseq/plant/Arabidopsis_thaliana/reference](https://ftp.ncbi.nlm.nih.gov/genomes/refseq/plant/Arabidopsis_thaliana/reference/)
 - Query Assembly: Ler
	- Available through 1001 Genomes Data center
	- Path: [data/MPIPZ/MPIPZJiao2020/releases/current/strains/Ler/](https://1001genomes.org/data/MPIPZ/MPIPZJiao2020/releases/current/strains/Ler/)

#### Experiment set up
The provided config file should already contain many of the necessary configurations, but please make the following updates:

 1. Update the chromosome header information in the TAIR10 reference genome to be more concise/clear within the output and to match the Ler chrom IDs 
	- Ex: change longer chromosome 1 header in TAIR10 to `>chr1` 
	- Repeat for all chromosomes by searching for the '>' characters that begin each header
 2. Generate a `RefSeqsToInclude.txt` and `QrySeqsToInclude.txt` using the grep instructions in the Config section to identify the sequences to be included from both genomes.
 3. Update provided config file's `refAssembly`, `refSeqsFile`, `qryAssembly`, and `qrySeqsFile` values to reflect the user's local path information for where the input data files are stored

#### Running the experiment
Once configured the pipeline can be executed similar to the usage instructions above:

 1. Run: ```snakemake --use-conda --cores <# threads>``` 

Note: For additional execution stats, Snakemake supports a `--stat <statsFile>` if further execution statistics prove helpful to the user.

## Known issues

List of current issues

## Getting help

If you have questions, concerns, bug reports, etc, please file an issue in this repository's Issue Tracker or e-mail `malcolm.todd@usask.ca`


## Future work

Have suggestions on how the software can be improved? Please contact `malcolm.todd@usask.ca` with your suggestions/recommendations!

Current worklist:
 - Update Rules and Scripts to use zipped data inputs to improve memory footprint
 - Research parallelization options/caps for each tool and refine threads argument for each rule
 - Add Docstrings to Snakemake Rules files to improve internal documentation for users
 - Refine SV Pattern Scan sub-algorithms to improve sensitivity and to accept less stringent chromosome identifier requirements


----

## Open source licensing info
1. [LICENSE](LICENSE)

----
