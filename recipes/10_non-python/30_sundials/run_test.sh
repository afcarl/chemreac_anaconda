#!/bin/sh
gcc -I${PREFIX}/include -L${PREFIX}/lib64 -L${PREFIX}/lib -o cvRoberts_dns cvRoberts_dns.c -lm -lsundials_cvode -llapack -lblas -lsundials_nvecserial
./cvRoberts_dns
