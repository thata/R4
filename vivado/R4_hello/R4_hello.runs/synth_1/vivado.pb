
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:042default:default2
00:00:062default:default2
327.8712default:default2
34.1882default:defaultZ17-268h px� 
�
Command: %s
53*	vivadotcl2�
osynth_design -top R4_hello_top -part xc7a35tcpg236-1 -directive AreaOptimized_high -control_set_opt_threshold 12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px� 
�
.identifier '%s' is used before its declaration4750*oasys2

returnAddr2default:default22
C:/Users/takas/src/R4/cpu.sv2default:default2
802default:default8@Z8-6901h px� 
�
%s*synth2�
xStarting RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 870.613 ; gain = 239.027
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2 
R4_hello_top2default:default2
 2default:default2g
QC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/sources_1/new/R4_hello_top.sv2default:default2
32default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
	clk_10mhz2default:default2
 2default:default2�
lC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.runs/synth_1/.Xil/Vivado-11756-muon/realtime/clk_10mhz_stub.v2default:default2
52default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	clk_10mhz2default:default2
 2default:default2
12default:default2
12default:default2�
lC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.runs/synth_1/.Xil/Vivado-11756-muon/realtime/clk_10mhz_stub.v2default:default2
52default:default8@Z8-6155h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2!
instance_name2default:default2
	clk_10mhz2default:default2
42default:default2
22default:default2g
QC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/sources_1/new/R4_hello_top.sv2default:default2
272default:default8@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2
cpu2default:default2
 2default:default22
C:/Users/takas/src/R4/cpu.sv2default:default2
12default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
alu2default:default2
 2default:default22
C:/Users/takas/src/R4/alu.sv2default:default2
172default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
alu2default:default2
 2default:default2
22default:default2
12default:default22
C:/Users/takas/src/R4/alu.sv2default:default2
172default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
regfile2default:default2
 2default:default26
 C:/Users/takas/src/R4/regfile.sv2default:default2
12default:default8@Z8-6157h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/regfile.sv2default:default2
112default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/regfile.sv2default:default2
122default:default8@Z8-589h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
regfile2default:default2
 2default:default2
32default:default2
12default:default26
 C:/Users/takas/src/R4/regfile.sv2default:default2
12default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
immgen2default:default2
 2default:default25
C:/Users/takas/src/R4/immgen.sv2default:default2
12default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
immgen2default:default2
 2default:default2
42default:default2
12default:default25
C:/Users/takas/src/R4/immgen.sv2default:default2
12default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
decoder2default:default2
 2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
12default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2"
alu_controller2default:default2
 2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
902default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
alu_controller2default:default2
 2default:default2
52default:default2
12default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
902default:default8@Z8-6155h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
292default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
312default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
322default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
332default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
342default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
352default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
362default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
422default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
482default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
492default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
542default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
572default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
582default:default8@Z8-589h px� 
�
Nreplacing case/wildcard equality operator %s with logical equality operator %s589*oasys2
===2default:default2
==2default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
612default:default8@Z8-589h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
decoder2default:default2
 2default:default2
62default:default2
12default:default26
 C:/Users/takas/src/R4/decoder.sv2default:default2
12default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
cpu2default:default2
 2default:default2
72default:default2
12default:default22
C:/Users/takas/src/R4/cpu.sv2default:default2
12default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2%
r4_hello_test_rom2default:default2
 2default:default2g
QC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/sources_1/new/R4_hello_top.sv2default:default2
622default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
r4_hello_test_rom2default:default2
 2default:default2
82default:default2
12default:default2g
QC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/sources_1/new/R4_hello_top.sv2default:default2
622default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2 
r4_hello_ram2default:default2
 2default:default2g
QC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/sources_1/new/R4_hello_top.sv2default:default2
1112default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
r4_hello_ram2default:default2
 2default:default2
92default:default2
12default:default2g
QC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/sources_1/new/R4_hello_top.sv2default:default2
1112default:default8@Z8-6155h px� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2"
led_buffer_reg2default:default2
322default:default2
162default:default2g
QC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/sources_1/new/R4_hello_top.sv2default:default2
212default:default8@Z8-3936h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
R4_hello_top2default:default2
 2default:default2
102default:default2
12default:default2g
QC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/sources_1/new/R4_hello_top.sv2default:default2
32default:default8@Z8-6155h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[24]2default:defaultZ8-3331h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[23]2default:defaultZ8-3331h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[22]2default:defaultZ8-3331h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[21]2default:defaultZ8-3331h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[20]2default:defaultZ8-3331h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[19]2default:defaultZ8-3331h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[18]2default:defaultZ8-3331h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[17]2default:defaultZ8-3331h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[16]2default:defaultZ8-3331h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[15]2default:defaultZ8-3331h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[11]2default:defaultZ8-3331h px� 

!design %s has unconnected port %s3331*oasys2
decoder2default:default2
	instr[10]2default:defaultZ8-3331h px� 
~
!design %s has unconnected port %s3331*oasys2
decoder2default:default2
instr[9]2default:defaultZ8-3331h px� 
~
!design %s has unconnected port %s3331*oasys2
decoder2default:default2
instr[8]2default:defaultZ8-3331h px� 
~
!design %s has unconnected port %s3331*oasys2
decoder2default:default2
instr[7]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[15]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[14]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[13]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[12]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[11]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[10]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[9]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[8]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[7]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[6]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[5]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[4]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[3]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[2]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[1]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[0]2default:defaultZ8-3331h px� 
�
%s*synth2�
xFinished RTL Elaboration : Time (s): cpu = 00:00:12 ; elapsed = 00:00:14 . Memory (MB): peak = 939.160 ; gain = 307.574
2default:defaulth px� 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 939.160 ; gain = 307.574
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 939.160 ; gain = 307.574
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.2562default:default2
939.1602default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
mc:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/sources_1/ip/clk_10mhz/clk_10mhz/clk_10mhz_in_context.xdc2default:default2#
instance_name	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
mc:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/sources_1/ip/clk_10mhz/clk_10mhz/clk_10mhz_in_context.xdc2default:default2#
instance_name	2default:default8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2�
lC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/constrs_1/imports/digilent-xdc-master/Basys-3-Master.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2�
lC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/constrs_1/imports/digilent-xdc-master/Basys-3-Master.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2�
lC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.srcs/constrs_1/imports/digilent-xdc-master/Basys-3-Master.xdc2default:default22
.Xil/R4_hello_top_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0052default:default2
1080.2892default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:012default:default2 
00:00:00.1252default:default2
1080.2892default:default2
0.0002default:defaultZ17-268h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:32 ; elapsed = 00:00:34 . Memory (MB): peak = 1080.289 ; gain = 448.703
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:32 ; elapsed = 00:00:34 . Memory (MB): peak = 1080.289 ; gain = 448.703
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:32 ; elapsed = 00:00:34 . Memory (MB): peak = 1080.289 ; gain = 448.703
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
^ROM "%s" won't be mapped to RAM because address size (%s) is larger than maximum supported(%s)3997*oasys2
dout2default:default2
322default:default2
252default:defaultZ8-5545h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:39 ; elapsed = 00:00:47 . Memory (MB): peak = 1080.289 ; gain = 448.703
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     32 Bit       Adders := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit         XORs := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 257   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               16 Bit    Registers := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 9     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	  15 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     12 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	  15 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   8 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 16    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   5 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
� 
A
%s
*synth2)
Module R4_hello_top 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               16 Bit    Registers := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
Module alu 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     32 Bit       Adders := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit         XORs := 1     
2default:defaulth p
x
� 
<
%s
*synth2$
Module regfile 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 2     
2default:defaulth p
x
� 
;
%s
*synth2#
Module immgen 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     12 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
� 
C
%s
*synth2+
Module alu_controller 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	  15 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
� 
<
%s
*synth2$
Module decoder 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   8 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 8     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   5 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
Module cpu 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 2     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 6     
2default:defaulth p
x
� 
F
%s
*synth2.
Module r4_hello_test_rom 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	  15 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
� 
A
%s
*synth2)
Module r4_hello_ram 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 256   
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 8     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
]
%s
*synth2E
1Warning: Parallel synthesis criteria is not met 
2default:defaulth p
x
� 
w
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
p_0_out2default:defaultZ8-5546h px� 
t
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
dout2default:defaultZ8-5546h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[15]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[14]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[13]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[12]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[11]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[10]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[9]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[8]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[7]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[6]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[5]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[4]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[3]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[2]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[1]2default:defaultZ8-3331h px� 
�
!design %s has unconnected port %s3331*oasys2 
R4_hello_top2default:default2
sw[0]2default:defaultZ8-3331h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:03:37 ; elapsed = 00:03:55 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
j
%s*synth2R
>
Distributed RAM: Preliminary Mapping	Report (see note below)
2default:defaulth px� 
�
%s*synth2n
Z+-------------+-----------------------+-----------+----------------------+--------------+
2default:defaulth px� 
�
%s*synth2o
[|Module Name  | RTL Object            | Inference | Size (Depth x Width) | Primitives   | 
2default:defaulth px� 
�
%s*synth2n
Z+-------------+-----------------------+-----------+----------------------+--------------+
2default:defaulth px� 
�
%s*synth2o
[|R4_hello_top | _cpu/rf/registers_reg | Implied   | 32 x 32              | RAM32M x 12	 | 
2default:defaulth px� 
�
%s*synth2o
[+-------------+-----------------------+-----------+----------------------+--------------+

2default:defaulth px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the Distributed RAMs at the current stage of the synthesis flow. Some Distributed RAMs may be reimplemented as non Distributed RAM primitives later in the synthesis flow. Multiple instantiated RAMs are reported only once.
2default:defaulth px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:03:54 ; elapsed = 00:04:12 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:04:00 ; elapsed = 00:04:18 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
S
%s
*synth2;
'
Distributed RAM: Final Mapping	Report
2default:defaulth p
x
� 
�
%s
*synth2n
Z+-------------+-----------------------+-----------+----------------------+--------------+
2default:defaulth p
x
� 
�
%s
*synth2o
[|Module Name  | RTL Object            | Inference | Size (Depth x Width) | Primitives   | 
2default:defaulth p
x
� 
�
%s
*synth2n
Z+-------------+-----------------------+-----------+----------------------+--------------+
2default:defaulth p
x
� 
�
%s
*synth2o
[|R4_hello_top | _cpu/rf/registers_reg | Implied   | 32 x 32              | RAM32M x 12	 | 
2default:defaulth p
x
� 
�
%s
*synth2o
[+-------------+-----------------------+-----------+----------------------+--------------+

2default:defaulth p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:04:01 ; elapsed = 00:04:19 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
*BlackBox module %s has unconnected pin %s
3599*oasys2!
instance_name2default:default2
reset2default:defaultZ8-4442h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:04:13 ; elapsed = 00:04:31 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:04:13 ; elapsed = 00:04:31 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:04:13 ; elapsed = 00:04:31 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:04:13 ; elapsed = 00:04:31 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:04:13 ; elapsed = 00:04:31 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:04:13 ; elapsed = 00:04:31 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
� 
O
%s
*synth27
#|      |BlackBox name |Instances |
2default:defaulth p
x
� 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
� 
O
%s
*synth27
#|1     |clk_10mhz     |         1|
2default:defaulth p
x
� 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
G
%s*synth2/
+------+----------+------+
2default:defaulth px� 
G
%s*synth2/
|      |Cell      |Count |
2default:defaulth px� 
G
%s*synth2/
+------+----------+------+
2default:defaulth px� 
G
%s*synth2/
|1     |clk_10mhz |     1|
2default:defaulth px� 
G
%s*synth2/
|2     |CARRY4    |    44|
2default:defaulth px� 
G
%s*synth2/
|3     |LUT1      |     1|
2default:defaulth px� 
G
%s*synth2/
|4     |LUT2      |    66|
2default:defaulth px� 
G
%s*synth2/
|5     |LUT3      |   116|
2default:defaulth px� 
G
%s*synth2/
|6     |LUT4      |   109|
2default:defaulth px� 
G
%s*synth2/
|7     |LUT5      |    14|
2default:defaulth px� 
G
%s*synth2/
|8     |LUT6      |    94|
2default:defaulth px� 
G
%s*synth2/
|9     |RAM32M    |    12|
2default:defaulth px� 
G
%s*synth2/
|10    |FDRE      |    64|
2default:defaulth px� 
G
%s*synth2/
|11    |OBUF      |    16|
2default:defaulth px� 
G
%s*synth2/
+------+----------+------+
2default:defaulth px� 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
� 
T
%s
*synth2<
(+------+---------+-------------+------+
2default:defaulth p
x
� 
T
%s
*synth2<
(|      |Instance |Module       |Cells |
2default:defaulth p
x
� 
T
%s
*synth2<
(+------+---------+-------------+------+
2default:defaulth p
x
� 
T
%s
*synth2<
(|1     |top      |             |   538|
2default:defaulth p
x
� 
T
%s
*synth2<
(|2     |  _cpu   |cpu          |   488|
2default:defaulth p
x
� 
T
%s
*synth2<
(|3     |    alu  |alu          |   158|
2default:defaulth p
x
� 
T
%s
*synth2<
(|4     |    rf   |regfile      |   249|
2default:defaulth p
x
� 
T
%s
*synth2<
(|5     |  _ram   |r4_hello_ram |    16|
2default:defaulth p
x
� 
T
%s
*synth2<
(+------+---------+-------------+------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:04:13 ; elapsed = 00:04:31 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
s
%s
*synth2[
GSynthesis finished with 0 errors, 1 critical warnings and 16 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:03:51 ; elapsed = 00:04:23 . Memory (MB): peak = 1162.875 ; gain = 390.160
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:04:13 ; elapsed = 00:04:32 . Memory (MB): peak = 1162.875 ; gain = 531.289
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0282default:default2
1162.8752default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
562default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1162.8752default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2z
f  A total of 12 instances were transformed.
  RAM32M => RAM32M (RAMD32(x6), RAMS32(x2)): 12 instances
2default:defaultZ1-111h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
352default:default2
662default:default2
12default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:04:252default:default2
00:04:462default:default2
1162.8752default:default2
802.8752default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1162.8752default:default2
0.0002default:defaultZ17-268h px� 
K
"No constraints selected for write.1103*constraintsZ18-5210h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2`
LC:/Users/takas/src/R4/vivado/R4_hello/R4_hello.runs/synth_1/R4_hello_top.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2�
nExecuting : report_utilization -file R4_hello_top_utilization_synth.rpt -pb R4_hello_top_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Mon Feb  3 19:20:56 20202default:defaultZ17-206h px� 


End Record