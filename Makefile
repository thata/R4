all: ulx3s.bit

clean:
	rm -rf cpu.json ulx3s_out.config ulx3s.bit

ulx3s.bit: ulx3s_out.config
	ecppack ulx3s_out.config ulx3s.bit

ulx3s_out.config: cpu.json
	nextpnr-ecp5 --85k --json cpu.json --lpf ulx3s_v20.lpf --textcfg ulx3s_out.config

cpu.json: alu.sv cpu.sv decoder.sv immgen.sv regfile.sv ulx3s_top.sv
	yosys -p "hierarchy -top top" -p "proc; opt" -p "synth_ecp5 -noccu2 -nomux -nodram -json cpu.json" alu.sv cpu.sv decoder.sv immgen.sv regfile.sv ulx3s_top.sv

prog: ulx3s.bit
	fujprog ulx3s.bit
