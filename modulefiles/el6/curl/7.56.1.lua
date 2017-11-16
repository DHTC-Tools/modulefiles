help(
[[
This module loads curl into the environment.  Curl is a 
command line http client.

]])

whatis("Loads the Curl tool")

local version = "7.56.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules2/el6/curl/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))
report_load("curl/"..version)
family('curl')
