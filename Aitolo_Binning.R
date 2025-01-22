#FastQC Script#

nohup time fastqc -t 15 *.fastq

---
  
#FastP Script#
  
SAMPLE_R1_C11=/home/nss2337/Aitolo/rawreads/C11_S1_L004_R1_001.fastq
SAMPLE_R1_C14=/home/nss2337/Aitolo/rawreads/C14_S2_L004_R1_001.fastq
SAMPLE_R1_C15=/home/nss2337/Aitolo/rawreads/C15_S3_L004_R1_001.fastq
SAMPLE_R1_C16=/home/nss2337/Aitolo/rawreads/C16_S4_L004_R1_001.fastq
SAMPLE_R2_C11=/home/nss2337/Aitolo/rawreads/C11_S1_L004_R2_001.fastq
SAMPLE_R2_C14=/home/nss2337/Aitolo/rawreads/C14_S2_L004_R2_001.fastq
SAMPLE_R2_C15=/home/nss2337/Aitolo/rawreads/C15_S3_L004_R2_001.fastq
SAMPLE_R2_C16=/home/nss2337/Aitolo/rawreads/C16_S4_L004_R2_001.fastq
OUT_R1_C11=/home/nss2337/Aitolo/rawreads/C11_S1P_L004_R1_001_out.fastq
OUT_R1_C14=/home/nss2337/Aitolo/rawreads/C14_S2_L004_R1_001_out.fastq
OUT_R1_C15=/home/nss2337/Aitolo/rawreads/C15_S3_L004_R1_001_out.fastq
OUT_R1_C16=/home/nss2337/Aitolo/rawreads/C16_S4_L004_R1_001_out.fastq
OUT_R2_C11=/home/nss2337/Aitolo/rawreads/C11_S1P_L004_R2_001_out.fastq
OUT_R2_C14=/home/nss2337/Aitolo/rawreads/C14_S2_L004_R2_001_out.fastq
OUT_R2_C15=/home/nss2337/Aitolo/rawreads/C15_S3_L004_R2_001_out.fastq  
OUT_R2_C16=/home/nss2337/Aitolo/rawreads/C16_S4_L004_R2_001_out.fastq
  
fastp --thread 16 -i $SAMPLE_R1_C11 -I $SAMPLE_R2_C11 -o $OUT_R1_C11 -O $OUT_R2_C11 -g -x --adapter_sequence=AGATCGGAAGAGCACACGTCTGAACTCCAGTCA --adapter_sequence_r2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --qualified_quality_phred 33 --overrepresentation_analysis 5 --cut_right cut_right_window_size=5 cut_right_mean_quality=15 --length_required 50 & 
fastp --thread 16 -i $SAMPLE_R1_C14 -I $SAMPLE_R2_C14 -o $OUT_R1_C14 -O $OUT_R2_C14 -g -x --adapter_sequence=AGATCGGAAGAGCACACGTCTGAACTCCAGTCA --adapter_sequence_r2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --qualified_quality_phred 33 --overrepresentation_analysis 5 --cut_right cut_right_window_size=5 cut_right_mean_quality=15 --length_required 50 &
fastp --thread 16 -i $SAMPLE_R1_C15 -I $SAMPLE_R2_C15 -o $OUT_R1_C15 -O $OUT_R2_C15 -g -x --adapter_sequence=AGATCGGAAGAGCACACGTCTGAACTCCAGTCA --adapter_sequence_r2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --qualified_quality_phred 33 --overrepresentation_analysis 5 --cut_right cut_right_window_size=5 cut_right_mean_quality=15 --length_required 50 &
fastp --thread 16 -i $SAMPLE_R1_C16 -I $SAMPLE_R2_C16 -o $OUT_R1_C16 -O $OUT_R2_C16 -g -x --adapter_sequence=AGATCGGAAGAGCACACGTCTGAACTCCAGTCA --adapter_sequence_r2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --qualified_quality_phred 33 --overrepresentation_analysis 5 --cut_right cut_right_window_size=5 cut_right_mean_quality=15 --length_required 50 &
echo "Fastp Done"

#Run FASTQC again to ensure FASTP trimmed the sequences
nohup time fastqc -t 15 *.fastq

#INTERLEAVE THE TWO FILES R1 & R2#


###ASSEMBLY###

#MEGAHIT#
#Conda Install and Activate#
conda install -c bioconda megahit

#Make sure its installed 
megahit -h

#Run assembly on trimmed and interleaved reads
megahit --12 sample.fastq.qz -t 35 -m 0.5 results_outdir