#FastQC Script#
nohup time fastqc -t 15 *.fastq

---
  #FastP Script (run in parallel)#
fastp --thread 16 -i C11_S1_L004_R1_001.fastq -I C11_S1_L004_R2_001.fastq -o C11_S1P_L004_R1_001_out.fastq -O C11_S1P_L004_R2_001_out.fastq -g -x --adapter_sequence=AGATCGGAAGAGCACACGTCTGAACTCCAGTCA --adapter_sequence_r2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --qualified_quality_phred 33 --overrepresentation_analysis 5 --cut_right cut_right_window_size=5 -M cut_right_mean_quality=15 --length_required 50 & 
fastp --thread 16 -i C14_S2_L004_R1_001.fastq -I C14_S2_L004_R2_001.fastq -o C14_S2_L004_R1_001_out.fastq -O C14_S2_L004_R2_001_out.fastq -g -x --adapter_sequence=AGATCGGAAGAGCACACGTCTGAACTCCAGTCA --adapter_sequence_r2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --qualified_quality_phred 33 --overrepresentation_analysis 5 --cut_right cut_right_window_size=5 -M cut_right_mean_quality=15 --length_required 50 &
fastp --thread 16 -i C15_S3_L004_R1_001.fastq -I C15_S3_L004_R2_001.fastq -o C15_S3_L004_R1_001_out.fastq -O C15_S3_L004_R2_001_out.fastq -g -x --adapter_sequence=AGATCGGAAGAGCACACGTCTGAACTCCAGTCA --adapter_sequence_r2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --qualified_quality_phred 33 --overrepresentation_analysis 5 --cut_right cut_right_window_size=5 -M cut_right_mean_quality=15 --length_required 50 &
fastp --thread 16 -i C16_S4_L004_R1_001.fastq -I C16_S4_L004_R2_001.fastq -o C16_S4_L004_R1_001_out.fastq -O C16_S4_L004_R2_001_out.fastq -g -x --adapter_sequence=AGATCGGAAGAGCACACGTCTGAACTCCAGTCA --adapter_sequence_r2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --qualified_quality_phred 33 --overrepresentation_analysis 5 --cut_right cut_right_window_size=5 -M cut_right_mean_quality=15 --length_required 50 &&
echo "Fastp Done"
