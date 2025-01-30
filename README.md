# ticket_306807

Ticket 306807.

## Changes to the scripts

- Job arrays and `srun` do not go together (e.g. read [here](https://stackoverflow.com/a/43799481)),
  I've changed this to `sbatch`
- You run a for-loop that submits jobs, this is great! This for loop is
  what job arrays can replace. As you already have a for-loop,
  there is no need for a job array :-)
