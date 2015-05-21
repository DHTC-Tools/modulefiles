help(
[[
This module loads GRASS 6.4.4

GRASS GIS, commonly referred to as GRASS (Geographic Resources Analysis
Support System), is a free and open source Geographic Information System
(GIS) software suite used for geospatial data management and analysis,
image processing, graphics and maps production, spatial modeling, and
visualization. GRASS GIS is currently used in academic and commercial
settings around the world, as well as by many governmental agencies and
environmental consulting companies.

]])

whatis("Loads the GRASS GIS system")
local version = "6.4.4"
local base = "/cvmfs/oasis.opensciencegrid.org/osg/modules/grass/"..version

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

family('grass')

prereq('python/2.7')

