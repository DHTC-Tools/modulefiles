#!/bin/bash
version=`python --version 2>&1`
exit_code=0
hostname=`hostname -f`
cur_time=`date`
echo "Hostname $hostname"
echo "Time: $cur_time"
echo "System version of python: $version"
echo "OSG Site: $OSG_SITE_NAME"
echo "GWMS Entry Name: $GLIDEIN_Entry_Name"
echo "GWMS Resource Name: $GLIDEIN_ResourceName"

test_numpy () {
    python -c 'import numpy;a = numpy.random.random((2,3)); numpy.trace(a)'
    (( exit_code = exit_code || $? ))
    if [ $exit_code -ne 0 ];
    then
        echo "ERROR: numpy tests failed"
    fi
}

test_scipy () {
    python test_scipy.py >  scipy.out
    (( exit_code = exit_code || $? ))
    if [ $exit_code -ne 0 ];
    then
        echo "ERROR: scipy tests failed"
    fi
    output=`diff -u -w -B scipy.out outputs/scipy.out`
    if [ "$output" != "" ];
    then
        echo "Error! Difference in outputs:"
        echo $output
    fi
}

test_nltk () {
    python test_nltk.py
    (( exit_code = exit_code || $? ))
    if [ $exit_code -ne 0 ];
    then
        echo "ERROR: matplotlib tests failed"
    fi
}

test_pandas () {
    nosetest pandas
    (( exit_code = exit_code || $? ))
    if [ $exit_code -ne 0 ];
    then
        echo "ERROR: pandas tests failed"
    fi
}

test_matplotlib () {
    python -c 'import matplotlib'
    (( exit_code = exit_code || $? ))
    if [ $exit_code -ne 0 ];
    then
        echo "ERROR: matplotlib tests failed"
    fi
}


source /cvmfs/oasis.opensciencegrid.org/osg/modules/lmod/5.6.2/init/bash
module load python/2.7
version=`python --version 2>&1`
echo "Module version of python2: $version"
if [ "$version" != "Python 2.7.7" ];
then
  echo "ERROR: Wrong version of python loaded"
  exit 1
fi
module load libgfortran
module load lapack
module load atlas
module load all-pkgs
test_numpy
test_scipy
test_nltk
test_matplotlib

module unload python/2.7
module unload all-pkgs
module load python/3.4
version=`python3 --version 2>&1`
echo "Module version of python3: $version"
if [ "$version" != "Python 3.4.1" ];
then
  echo "ERROR: Wrong version of python loaded"
  exit 1
fi
module load lapack
module load atlas
module load all-pkgs
# NLTK not compatible with python3 right now
test_numpy
test_scipy
test_matplotlib

exit $exit_code

