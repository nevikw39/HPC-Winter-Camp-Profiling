#!/bin/bash
#PBS -P ACD110018
#PBS -N HPC-WinteCamp-Profiling-VTune-hs
#PBS -l select=1:ncpus=40:ompthreads=40  
#PBS -l walltime=00:30:00
#PBS -q ctest
#PBS -o vtune-hs-out.log
#PBS -e vtune-hs-err.log

module load intel/2019_u5
. /pkg/intel/2019_u5/vtune_amplifier/amplxe-vars.sh 
export LC_CTYPE=en_US

cd ${PBS_O_WORKDIR:-"."}
make

amplxe-cl -collect hotspots -r vtune-hs ./mat_mul_a
