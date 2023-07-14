#!/bin/bash

#===================================================================#
# allrun script for testcase as part of test routine
# run settlingTest
# Christoph Goniva - July. 2011, mod by Alice Hager - July 2011
#===================================================================#

source $CFDEM_SRC_DIR/lagrangian/cfdemParticle/etc/functions.sh

#- define variables
casePath="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"

echo $casePath

rm DEM/post/*
rm DEM/post/restart/*
rm -r CFD/processor?
rm -r CFD/constant/polyMesh
rm -r CFD/0.*
rm -r CFD/VTK
rm -r CFD/log.*

cd $casePath/CFD
blockMesh >> log.blockMesh 2>&1


#gnome-terminal --title='cfdemSolverIB periodic test' -e "bash $casePath/parCFDDEMrun.sh"
. $casePath/parCFDDEMrun.sh
