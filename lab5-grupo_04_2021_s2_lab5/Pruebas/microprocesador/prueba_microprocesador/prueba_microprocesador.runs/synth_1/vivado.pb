
u
Command: %s
53*	vivadotcl2D
0synth_design -top TopMicro -part xc7a35tcpg236-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px? 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
a
#Helper process launched with PID %s4824*oasys2
3216482default:defaultZ8-7075h px? 
?
%s*synth2?
vStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 999.988 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2
TopMicro2default:default2
 2default:default2?
oC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/Pruebas/microprocesador/top_micro.v2default:default2
32default:default8@Z8-6157h px? 
\
%s
*synth2D
0	Parameter st_Idle bound to: 0 - type: integer 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter st_Presionado bound to: 1 - type: integer 
2default:defaulth p
x
? 
?
-case statement is not full and has no default155*oasys2?
oC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/Pruebas/microprocesador/top_micro.v2default:default2
202default:default8@Z8-155h px? 
?
synthesizing module '%s'%s4497*oasys2#
Microprocesador2default:default2
 2default:default2?
mC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/microprocesador.v2default:default2
32default:default8@Z8-6157h px? 
]
%s
*synth2E
1	Parameter imm_sel_para_tipo_R bound to: 3'b000 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter imm_sel_para_tipo_I_A bound to: 3'b000 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter imm_sel_para_tipo_I_L bound to: 3'b001 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter imm_sel_para_tipo_J bound to: 3'b010 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter imm_sel_para_tipo_B bound to: 3'b011 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter imm_sel_para_tipo_S bound to: 3'b100 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter datoA_es_rs1 bound to: 1'b0 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter datoB_es_rs2 bound to: 1'b0 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter dato_rd_sel_para_DataIn bound to: 1'b0 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter st_Fetch bound to: 0 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter st_Decode bound to: 1 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter st_Execute bound to: 2 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter st_Memory bound to: 3 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter st_Writeback bound to: 4 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'%s4497*oasys2#
UnidadDeControl2default:default2
 2default:default2?
lC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/unidad_control.v2default:default2
32default:default8@Z8-6157h px? 
Y
%s
*synth2A
-	Parameter LW_code bound to: 10'b0100000011 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter SW_code bound to: 10'b0100100011 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter ADD_code bound to: 17'b00000000000110011 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter SUB_code bound to: 17'b01000000000110011 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter OR_code bound to: 17'b00000001100110011 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter AND_code bound to: 17'b00000001110110011 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter ADDI_code bound to: 10'b0000010011 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter SLL_code bound to: 17'b00000000010110011 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter SRL_code bound to: 17'b00000001010110011 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter ORI_code bound to: 10'b1100010011 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter ANDI_code bound to: 10'b1110010011 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter BEQ_code bound to: 10'b0001100011 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter JAL_code bound to: 7'b1101111 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter st_Fetch bound to: 0 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter st_Decode bound to: 1 - type: integer 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter st_Execute bound to: 2 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter st_Memory bound to: 3 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter st_Writeback bound to: 4 - type: integer 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter imm_sel_para_tipo_R bound to: 3'b000 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter imm_sel_para_tipo_I_A bound to: 3'b000 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter imm_sel_para_tipo_I_L bound to: 3'b001 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter imm_sel_para_tipo_J bound to: 3'b010 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter imm_sel_para_tipo_B bound to: 3'b011 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter imm_sel_para_tipo_S bound to: 3'b100 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter datoA_es_rs1 bound to: 1'b0 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter datoA_es_pc bound to: 1'b1 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter datoB_es_rs2 bound to: 1'b0 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter datoB_es_imm bound to: 1'b1 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter alu_and bound to: 4'b0000 
2default:defaulth p
x
? 
Q
%s
*synth29
%	Parameter alu_or bound to: 4'b0001 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter alu_suma bound to: 4'b0010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter alu_resta bound to: 4'b0110 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter alu_sll bound to: 4'b1000 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter alu_srl bound to: 4'b1001 
2default:defaulth p
x
? 
_
%s
*synth2G
3	Parameter dato_rd_sel_para_DataIn bound to: 1'b0 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter dato_rd_sel_para_ALUResult bound to: 1'b1 
2default:defaulth p
x
? 
Q
%s
*synth29
%	Parameter pc_reset bound to: 2'b00 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter pc_hold bound to: 2'b01 
2default:defaulth p
x
? 
M
%s
*synth25
!	Parameter pc_4 bound to: 2'b10 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter pc_jump bound to: 2'b11 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
UnidadDeControl2default:default2
 2default:default2
12default:default2
12default:default2?
lC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/unidad_control.v2default:default2
32default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2"
ProgramCounter2default:default2
 2default:default2v
`C:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/PC.v2default:default2
32default:default8@Z8-6157h px? 
W
%s
*synth2?
+	Parameter N bound to: 32 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
ProgramCounter2default:default2
 2default:default2
22default:default2
12default:default2v
`C:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/PC.v2default:default2
32default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2&
banco_de_registros2default:default2
 2default:default2?
pC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/banco_de_registros.v2default:default2
32default:default8@Z8-6157h px? 
V
%s
*synth2>
*	Parameter N bound to: 5 - type: integer 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter M bound to: 32 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2&
banco_de_registros2default:default2
 2default:default2
32default:default2
12default:default2?
pC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/banco_de_registros.v2default:default2
32default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
ALU2default:default2
 2default:default2w
aC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/alu.v2default:default2
32default:default8@Z8-6157h px? 
W
%s
*synth2?
+	Parameter n bound to: 32 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'%s4497*oasys2
CLA_4bit2default:default2
 2default:default2}
gC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/adder_cla.v2default:default2
32default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CLA_4bit2default:default2
 2default:default2
42default:default2
12default:default2}
gC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/adder_cla.v2default:default2
32default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ALU2default:default2
 2default:default2
52default:default2
12default:default2w
aC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/alu.v2default:default2
32default:default8@Z8-6155h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
C2default:default2
ALU2default:default2
alu2default:default2?
mC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/microprocesador.v2default:default2
1642default:default8@Z8-7071h px? 
?
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
Z2default:default2
ALU2default:default2
alu2default:default2?
mC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/microprocesador.v2default:default2
1642default:default8@Z8-7071h px? 
?
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
alu2default:default2
ALU2default:default2
72default:default2
52default:default2?
mC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/microprocesador.v2default:default2
1642default:default8@Z8-7023h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
Microprocesador2default:default2
 2default:default2
62default:default2
12default:default2?
mC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/microprocesador/microprocesador.v2default:default2
32default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
TopMicro2default:default2
 2default:default2
72default:default2
12default:default2?
oC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/Pruebas/microprocesador/top_micro.v2default:default2
32default:default8@Z8-6155h px? 
?
%s*synth2?
vFinished RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 999.988 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 999.988 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 999.988 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0522default:default2
999.9882default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2?
sC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/Pruebas/microprocesador/cnstr_micro.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2?
sC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/Pruebas/microprocesador/cnstr_micro.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2?
sC:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/Pruebas/microprocesador/cnstr_micro.xdc2default:default2.
.Xil/TopMicro_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
999.9882default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0122default:default2
999.9882default:default2
0.0002default:defaultZ17-268h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Constraint Validation : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 999.988 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 999.988 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 999.988 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2

estado_reg2default:default2#
UnidadDeControl2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                st_Fetch |                            00001 |                              000
2default:defaulth p
x
? 
?
%s
*synth2s
_               st_Decode |                            00010 |                              001
2default:defaulth p
x
? 
?
%s
*synth2s
_              st_Execute |                            00100 |                              010
2default:defaulth p
x
? 
?
%s
*synth2s
_               st_Memory |                            01000 |                              011
2default:defaulth p
x
? 
?
%s
*synth2s
_            st_Writeback |                            10000 |                              100
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2

estado_reg2default:default2
one-hot2default:default2#
UnidadDeControl2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 999.988 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 6     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit         XORs := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit         XORs := 16    
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               64 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 35    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   33 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input   32 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 71    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   6 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   5 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 110   
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:01:03 ; elapsed = 00:01:04 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:01:09 ; elapsed = 00:01:10 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Timing Optimization : Time (s): cpu = 00:01:09 ; elapsed = 00:01:10 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Technology Mapping : Time (s): cpu = 00:01:10 ; elapsed = 00:01:12 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
uFinished IO Insertion : Time (s): cpu = 00:01:14 ; elapsed = 00:01:15 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:01:14 ; elapsed = 00:01:15 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:14 ; elapsed = 00:01:15 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:01:14 ; elapsed = 00:01:15 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:01:14 ; elapsed = 00:01:15 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:01:14 ; elapsed = 00:01:15 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     2|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |    41|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |    73|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |   157|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |   179|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |   131|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |   204|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |   939|
2default:defaulth px? 
D
%s*synth2,
|9     |MUXF7  |   283|
2default:defaulth px? 
D
%s*synth2,
|10    |FDRE   |  1227|
2default:defaulth px? 
D
%s*synth2,
|11    |IBUF   |     9|
2default:defaulth px? 
D
%s*synth2,
|12    |OBUF   |    16|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:01:14 ; elapsed = 00:01:15 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Runtime : Time (s): cpu = 00:01:06 ; elapsed = 00:01:13 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Complete : Time (s): cpu = 00:01:14 ; elapsed = 00:01:16 . Memory (MB): peak = 1059.824 ; gain = 59.836
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0472default:default2
1059.8242default:default2
0.0002default:defaultZ17-268h px? 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
3242default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1059.8242default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
322default:default2
32default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:202default:default2
00:01:222default:default2
1059.8242default:default2
59.8362default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?C:/Users/fbadi/OneDrive/Documents/taller_digital/lab5-grupo_04_2021_s2_lab5/Pruebas/microprocesador/prueba_microprocesador/prueba_microprocesador.runs/synth_1/TopMicro.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2z
fExecuting : report_utilization -file TopMicro_utilization_synth.rpt -pb TopMicro_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Fri Nov 19 07:44:12 20212default:defaultZ17-206h px? 


End Record