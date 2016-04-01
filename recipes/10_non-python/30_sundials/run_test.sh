#!/bin/sh
gcc -I${PREFIX}/include -L${PREFIX}/lib64 -L${PREFIX}/lib -o cvRoberts_dns cvRoberts_dns.c -lm -lsundials_cvode -llapack -lblas -lsundials_nvecserial
LD_LIBRARY_PATH=$PREFIX/lib64:$LD_LIBRARY_PATH ./cvRoberts_dns
