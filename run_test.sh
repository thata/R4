#!/bin/sh
iverilog -g 2012 -s alu_test *.sv && ./a.out
iverilog -g 2012 -s cpu_test *.sv && ./a.out
iverilog -g 2012 -s decoder_test *.sv && ./a.out
iverilog -g 2012 -s immgen_test *.sv && ./a.out
iverilog -g 2012 -s regfile_test *.sv && ./a.out
