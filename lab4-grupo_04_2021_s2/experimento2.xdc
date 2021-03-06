#set_property PACKAGE_PIN W5 [get_ports clk]
#   set_property IOSTANDARD LVCMOS33 [get_ports clk]
#   create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
set_property PACKAGE_PIN U18 [get_ports botoncenter]
   set_property IOSTANDARD LVCMOS33 [get_ports botoncenter]
set_property PACKAGE_PIN U17 [get_ports rst]
  set_property IOSTANDARD LVCMOS33 [get_ports rst]
   


# Seven segment LED display
#set_property PACKAGE_PIN W7 [get_ports {o_seven_segments[7]}]
#  set_property IOSTANDARD LVCMOS33 [get_ports {o_seven_segments[7]}]
#set_property PACKAGE_PIN W6 [get_ports {o_seven_segments[6]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {o_seven_segments[6]}]
#set_property PACKAGE_PIN U8 [get_ports {o_seven_segments[5]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {o_seven_segments[5]}]
#set_property PACKAGE_PIN V8 [get_ports {o_seven_segments[4]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {o_seven_segments[4]}]
#set_property PACKAGE_PIN U5 [get_ports {o_seven_segments[3]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {o_seven_segments[3]}]
#set_property PACKAGE_PIN V5 [get_ports {o_seven_segments[2]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {o_seven_segments[2]}]
#set_property PACKAGE_PIN U7 [get_ports {o_seven_segments[1]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {o_seven_segments[1]}]
#set_property PACKAGE_PIN V7 [get_ports {o_seven_segments[0]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {o_seven_segments[0]}]

#set_property PACKAGE_PIN U2 [get_ports {o_anode_pins[0]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {o_anode_pins[0]}]
#set_property PACKAGE_PIN U4 [get_ports {o_anode_pins[1]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {o_anode_pins[1]}]
#set_property PACKAGE_PIN V4 [get_ports {o_anode_pins[2]}]
#  set_property IOSTANDARD LVCMOS33 [get_ports {o_anode_pins[2]}]
#set_property PACKAGE_PIN W4 [get_ports {o_anode_pins[3]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {o_anode_pins[3]}]

