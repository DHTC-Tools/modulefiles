help(
[[
MATLAB Compiler Runtime r2016b.
-------------------------------

This module loads a standalone set of libraries for executing MATLAB code.

The MCR is freely distributable as described by the license file located at:
  /cvmfs/oasis.opensciencegrid.org/osg/modules/matlab/2016b/v91/MCR_license.txt

]])

local version = "2016b"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/matlab/"..version.."/v91"

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "runtime/glnxa64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "bin/glnxa64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "sys/os/glnxa64"))
family('matlab')
