help(
[[
This module loads a clean install of Python 3.4.1

]])

whatis("Load an clean installation of the Python 3.4.1 interpreter")

local version = "3.4.1"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/python-"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("CPATH",  pathJoin(base, "include"))
prepend_path("LIBRARY_PATH",  pathJoin(base, "lib"))


family('python')
-- Setup Modulepath for packages built by this python stack
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir = pathJoin(mroot,"python",version)
prepend_path("MODULEPATH", mdir)

