# ticket_306807

Ticket 306807.

## Changes to the scripts

- Job arrays and `srun` do not go together (e.g. read [here](https://stackoverflow.com/a/43799481)),
  I've changed this to `sbatch`
- As now `assembling_metagenomes_array.sh` is used a job,
  I've addded some SBATCH/Slurm parameters. I've picked the minimal amount
  of resources (i.e. 1 CPU code), you can modify this at will
- In the 'starter script' (I call it `submit_jobs.sh`)
  you run a for-loop that submits jobs. This is a great idea!
  However, this for loop is what job arrays can replace.
  As you already have a for-loop,
  there is no need for a job array :-)
- As `submit_jobs.sh` only submits jobs, you can run it directly
  like `./submit_jobs.sh`. I've commented out the Slurm parameters
