#!/bin/bash
##SBATCH -A uppmax2025-2-222
##SBATCH -p node
##SBATCH -N 1
##SBATCH -t 10-00:00:00
##SBATCH -J jobarray
##SBATCH --array=0-
##SBATCH --mail-type=ALL,ARRAY_TASKS

# SLURM_ARRAY_TASK_ID tells the script which iteration to run
echo $SLURM_ARRAY_TASK_ID

module load bioinfo-tools metaWRAP/1.3.2

input_main_path=/proj/naiss2024-23-57/C57_female_lineage_microbiota/samples
output_path=/proj/naiss2024-23-57/C57_female_lineage_microbiota/assembled_metagenomes

for suffix in cecum_samples last_feces; do
    for F in $(cat $input_main_path/$suffix/trimmed_host_removed/trimmed.files); do
        sbatch -n 1 $F ./assembling_metagenomes_array.sh
    done
done

