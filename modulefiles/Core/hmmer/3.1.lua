help(
[[
HMMER is used for searching sequence databases for homologs of protein sequences, and for making protein sequence
alignments. It implements methods using probabilistic models called profile hidden Markov models (profile HMMs).
Compared to BLAST, FASTA, and other sequence alignment and database search tools based on older scoring methodology,
HMMER aims to be significantly more accurate and more able to detect remote homologs because of the strength of its
underlying mathematical models. In the past, this strength came at significant computational expense, but in the new
HMMER3 project, HMMER is now essentially as fast as BLAST.

]])

local version = "3.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/hmmer/"..version
whatis("HMMER is used for searching for homologs of protein sequences, and for making protein sequence alignments.")
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('hmmer')
