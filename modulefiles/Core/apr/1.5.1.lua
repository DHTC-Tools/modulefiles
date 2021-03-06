help(
[[
This module loads the APR 1.5.1 library.  APR (Apache portable runtime) provides
cross platform libraries for handling OS related operations.

]])

whatis("Loads the APR library which provides cross platform tools for os/system operations")

local version = "1.5.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/apr/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
family('apr')
