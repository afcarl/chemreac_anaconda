#!/bin/sh
gcc -I${PREFIX}/include -L${PREFIX}/lib -o cvRoberts_dns cvRoberts_dns.c -lm -lsundials_cvode -lopenblas -lsundials_nvecserial
./cvRoberts_dns
