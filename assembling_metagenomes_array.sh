#!/bin/bash
#SBATCH -A uppmax2025-2-222
#SBATCH -n 1
#SBATCH -t 10-00:00:00
#SBATCH --mail-type=ALL

b=${1##*/} # file name
c=${1%/*} #path to file

echo "Input filename: ${b}"
echo "Input filename full path: ${c}"

module load bioinfo-tools metaWRAP/1.3.2

output_path=/proj/naiss2024-23-57/C57_female_lineage_microbiota/assembled_metagenomes

metawrap assembly -1 $c/${b}/final_pure_reads_1.fastq -2 $c/${b}/final_pure_reads_2.fastq \
                -o $output_path/${b} -m 24

