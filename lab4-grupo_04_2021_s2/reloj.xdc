# Clock

set_property PACKAGE_PIN W5 [get_ports clk]
   set_property IOSTANDARD LVCMOS33 [get_ports clk]
   #create_clock -period 1000000000 [get_ports clk]

#set_property PACKAGE_PIN U16 [get_ports led]
#  set_property IOSTANDARD LVCMOS33 [get_ports led]