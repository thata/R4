onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clk_10mhz_opt

do {wave.do}

view wave
view structure
view signals

do {clk_10mhz.udo}

run -all

quit -force
