# Conecta entrada binaria de 16 bits del interfaz
# A los 16 interruptores del FPGA

set_property PACKAGE_PIN V17 [get_ports {data_data[0]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {data_data[0]}]
set_property PACKAGE_PIN V16 [get_ports {data_data[1]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {data_data[1]}]
set_property PACKAGE_PIN W16 [get_ports {data_data[2]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {data_data[2]}]
set_property PACKAGE_PIN W17 [get_ports {data_data[3]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {data_data[3]}]
set_property PACKAGE_PIN W15 [get_ports {data_data[4]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {data_data[4]}]
set_property PACKAGE_PIN V15 [get_ports {data_data[5]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {data_data[5]}]
set_property PACKAGE_PIN W14 [get_ports {data_data[6]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {data_data[6]}]
set_property PACKAGE_PIN W13 [get_ports {data_data[7]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {data_data[7]}]
set_property PACKAGE_PIN V2 [get_ports {comando_data[0]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {comando_data[0]}]
set_property PACKAGE_PIN T3 [get_ports {comando_data[1]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {comando_data[1]}]
set_property PACKAGE_PIN T2 [get_ports {comando_data[2]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {comando_data[2]}]
set_property PACKAGE_PIN R3 [get_ports {comando_data[3]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {comando_data[3]}]
#set_property PACKAGE_PIN W2 [get_ports {i_binary_coded_value[12]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {i_binary_coded_value[12]}]
#set_property PACKAGE_PIN U1 [get_ports {i_binary_coded_value[13]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {i_binary_coded_value[13]}]
#set_property PACKAGE_PIN T1 [get_ports {i_binary_coded_value[14]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {i_binary_coded_value[14]}]
set_property PACKAGE_PIN R2 [get_ports {switch15}]
   set_property IOSTANDARD LVCMOS33 [get_ports {switch15}]