// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Nov 17 18:13:39 2021
// Host        : LAPTOP-BFI2BQC3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [31:0]addra;
  wire clka;
  wire [31:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "FFFFFFFF" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.375199 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[7:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20976)
`pragma protect data_block
KfN+Gxff/9H/FMU0yCDU89TiPJTrp3+bMuFxeyTJBnyscR1S+odLKsAWX35/MoqfGEGXsY34GrKf
QsWCaKz8z/00YHTFKOxyAFdGqkJGQNdmdsou3Nm9w7fSQoMu0h9EIU9RPZh9JJR9UGW1UbDuWMgi
oTMv3hHMf7bei903ME+S1I/C2Q3w141SBgCTsU1J0vDAvmdFUccRfPM2Rk3AZTfZJFRL84nRTQ4T
G4zZklCIkzUVBYnu+g4qHEk8wj5aRdcPubY9h7gajqNQ/Y5u9ysZLBENCPT7wwe9iDD2XWMyhviU
qV6TjfnuC7/ZMhvlT0sPVK8IaUPV+mIUBFnWIYSqMPzZXUbgG8ipC13SvpoCBtZVKed6yP2eLA0y
/ZSTBVGFxc3+8r7GeV6OJjGpJTSdc44J1atw/G6LGhE7oFkb0iQ8imWMLXhmBuPQcUOau1gckA4P
spi3tb6v1p65AjIFGs5CH/IBoBW+BvM1DKreCpZ8jzBCKv10PT9flb1y+KpvOaYXJ2+bJJV18c/K
CjDplKcRFWcJzRZNHr3j6joDQSuh9vWst9u68TljmD1E0kz2YVEJnc/8KLAx4m5igu6zD4ffn72k
m56UiFr/Wn1ZVXN46Pidg8gT6EKvBEFQtdOaYbLXCrbC9qOLb1b8etySrt34wUeC1srHTTC8VVcg
fSVR2K0zQrUppKfU6CKjk8Fq0Ql2AEka+n9Aas5ha7Qde3jWj3YgLqSPZVY0GKCNyvrennoeaQXS
QJ685vqeHtdCEhveLaxC/ocMyEHLY9qZcVql8TfCngzGM6JX6h33+gWIlzHxJM0xs28lGsm6TvNI
ktv5oFk+ArDokMmqpd/d98XTFr20Cbxx6D+ED9C0QkyCPPQs+fGHuZ39ua2xoOC6vHoBXw/ATfPx
1K/UiE0rq7gSPwTijuv94icNNlK57zfeQCb8zgUBymNQZ0PYZ6Aywh5X1ysabaQEbXhG1ZoFNeJD
gcYXzsmguIuV4/cLX+6sOMXgqx9lV7g4wr07pkYlTgHqp6B1EDKc5fDsrG44I/1qgMAC5RWE/lAs
YXYgOd1ef10vtDezjcaaF/epIYvNnvgzfdPoJhmwP1ZUbKnAX2RiRhNRithQpYoBleDSyfqdUSLF
Ne184zPgGgzllCI/oW1qajbiKBUjDrguM9IPWUPg9qZ9Bgeh4APrL+oiF2M+HKeewbICi5AEVjwb
+tddL7a+yXrnkUeMswj0cLO+VOuSqFknR5jt3plVzgVMYYbpsY89//69XKa/iN0GaWAYnxmX47i0
dg8ZS9i+zrhpXT5ZGbOnFJxotIGwBQW0Xk1kYnNdI4QyN5gMBdCFYdOFQrvZOXyVIvKPaP606TaC
/FDIJs62WimLd0OmbMRO81q3HgvRbqRG6LT8RHuKfTO4E4Ps04sCuBdo8YVsREV8MAIV2PxQn6JH
wdPx/HlgZ3lcrdNQghkq9819q8lnIyZGkNwNJ4yc90TVPtKcRgZvk5n/1IqTMjXor1rV2iCTDVX+
H41uI4mAJaUoQQN8p6qG8JNXDyUwkXE5oo/AtFNx9VFiA8rUgHrelVhYrwSnYlqNTLqMiJtbmOJ+
Se6z6TX4WyYoyfEOEX5gBZOTqWCLuZ+M2T02bp6iGP8j9DEfNwPdRMZlZaveci30WCdiowHbwtOm
QpsxGV7jUrsDAR/mwhLql856LInyD0RQuiTrBXbhn7qHmYumGT+3BOGd0ypO76zpkWvQF1P2Itgp
wcRQjErm13934fPcIhHAbP3jKWgTncUVuLVH0XPRsoI0pGcLbS05yckKYjlAEHtYL1uemJCGV0SH
hay+X0qc6Xwc8aKjF1l7hg7+dzpRgw0TKR4L/tqroaf88XdhCPP6p7l7aIVEvgS7PVJLbPFmGnh4
gube8iGB4cjlk90Cl4xg6osUAaKQeD/Xy/ekRBa7RKVMnu057K1EufCFlckmEbDPZcr7RcuXoSXa
0bCEaBft68e1p4bW/1LHUs9iUCiUL/m8E8RDuPcEQQNYsxrCX4BlchQmboJz4sOac9CO2KUbGgJg
oqxYlMlZ9cgut1YYN305vIAw9dfBvTwBOppn9oUIOpZ8oAoNPiV0Rwtvy+oxLkZDMN8puYvTAE7p
4tvLPlOjlpp+w7WE7ECWmGKrleH6IXyXic0KQhLnRFlObdCZrTCYTUI/4G/W6q4hex9E+KRHl/s9
nzsJ3b+IQovMPBxYWPIUPOcezjtWOs0JN9ks/k6n4fwe5C6WLqYs9titKSUvSU7eY/V8XWz08H+E
+Vx7JHUYURz+G+9/ZMLb4ZCT65w9WzoxU/2ydrCu3pHKJjf1yBs5IZ4ze7VmEkMefLnw7flnpELN
JukT8AHBumi+NQ5wK9KH6Z3zb6F4POsDrB1tcGD1CR30XOKqQXEgu0YchKhYRtORsNz4m6gOl8Ez
TtXzLBkDiFMTtSvd/iO0Lvp7YHgrtYWnKwp2eeenHJQP26WCP4PjY8otyjticT/iaMJujsyVxcB/
FGAWq6/JCcv/4MslJe7uOl6T+Re1gSXzWx43CC9w+o7AMgZxhSfRzg+Wcrr43/4rBJ3f3Zc0oZWx
GUCaIBNyGHxu/NtdrQlhkfs0/AqD+/ez4BwLqEa5mIIjUDiyfhEWH0K17OHDYEN6HbZnV+SDJXb5
oEuroCl3xMWCbGYOmQuLVFTAysqcioklF12y3lDLNcCoGkYEriYEXo/6ubHrF3J/Tnj4w64qqqoV
ypNAOWxskr6P56RtQInNHgDfVexKCRmadeIh6+9UgjSZc13x6hfMBmEjEwEdtxTc8FW55CwpfV66
BSqKEqUNVT8R+jsStCFB8i4tojZjFif5fBcWgEqjN1PlN1M2Ja+3Ghl/N+GRrOgcpYLFH5q3FFBL
qJQYNnmwYDPRdyNrQvuJ1Iva340r0fHbQxcS8rjbSqVUbucJPhqISJEUqcvR2hVXzN1YeQ31xehS
I17Yya/YrCCM572N8b9y/PthpRXZSUFlVhBOFPNvPh4dSmbYwGCw6OKHi5bpCBrzAcKIyXD7/mDh
oOs8jb5POHqjvvgWuqQVppIPL96BlXBx2N1DK78OrrfPqCCTYxX0OyUmxnKXr03neRbLynCxKLJ0
qDrovqIl+9zsnL4+y/uyAdBOpYXcxgrkcdctLAMklkx1ZLPKebdiBbKSivR3UdNf81zsia760Iq6
QsPl+nJ0LcrMIo7m12DPOF01LLlvhiX4SotkluSz8HsxFQOLPWrz+zfCcWToR+b3aQvHDjRE88+y
YhYugkryShtGH+h6jKwg0tWm6WInLSMEZ/MYWpU9/YULIJb1m5Mz1qqwWDI4CwGe1LKNu5Ij9HDz
VsOOAXHhSr94F6mpcYkBLRtA+4rl/4EqWBBS4YDFAb8FW8ODIFHbUpvddIF2B7/OvN1CVUGSZsw2
QWxWL4Sh2VufFOL0w2IKbyw63a7O4TnVWF/g3x68v8giQfna4Tgbleh46n8U4O1OKl+5Ns24RSBo
LJNPW4U3gRtvYnYA/gWAck41J4jOUiBj7M+eLeuVIbyr7+cwL5knZnqeAIzdC0JrSOpBwZ8TTQ5P
NiB+Vm92t6AgQFAY6+wYoTG3R4K8wdq1GFQFiR+sOoLKG5hwGp0/lXDNxMltE44R8wGDx2s9cR6K
gNEha3BnTV4fwEvLQnsNQ6CUKZzLtheKmraML8xEFhE//6tE5NjU9XX73dnPSIVSupNFvuQmEDGC
ORAHIaAwqgy8z/nGy/CDf3v0jxN179lY06SSjI3eq31JFIhGkQ/9uBV7/ZFvykkxXaUqfjTmXWLL
UIWVcxPVVyGfaBAIEmHqLn7Ofpf2HZnLJWC2tFuAfdLFsm+Un/x4grbwh4JUhmGnstuuoHf1Ydhv
JHIA2GXopTxdtf9go42Joldj2QX+xTD+O/YcfisIs+ToKa5Xh8hQLOVH9E4dKeU+tAFsENzjBBy1
wYspFZ2sTApx6knBxNT/ucGBSZCuNTijwCBvNHwfN2nmCFwSvAjCbilpurTQpYHvNMugtbYwZJwr
ucCcfKUJ5Mkp4jSHbEqh5eXmOH6bQyI0gmbWa0t5YOLFAaSMM8mMxm3AhImGg6kYSI0Xx8HVqlnA
joy/DerR8G8Vc2cC+1ZGNNv9pxo4aCyruKZiTkk5B6689ToIOIbwEj42cQ47tW2u4qNF0iwoDg05
sec6PLqjkG56Pj99KeKB3l4vD4LxqQbm18J+DkEmWDr55gFejc3e0D8B7g6CLg48vkB7DXYOsqWX
0DTTfkn7Qyz9pV7rEQqrGLFdKvoDJAZBLrkoE51YXqeOYSua2/qfQRJ5j4jNBR4Br8NyoJt/xD4X
ikHR83RdFRrsOJMxDaAE+RBrvZok1lr9hpqsQEBjJt7fvRMwvC+k+vmhb2/DBXYSHYo71peIpALB
xkRfnwN9UkQu+5vB0VsAQN5vlhtSzJHWaJJRkUC+1mbO2LC9tWlyQWEW7evCde+PMPAG5+ou8Hpv
O1DsVs2e8T+Gj1ATdwApn2+MSJaVd+xE7e2R5CMBwXXBB8vKMgpI5uMq0NZM91aBlbA0qzk9GkLE
p6GEVZ7uG+G8SUmhDXdeBXn2baX1rX8VP2h5mbKLDR72JniLoo0nm/VpWxUXspVRK55LiKBZm2rJ
tQLQK/YVgIGPxy8egdArNmNFcUSdpeCWCFJdVdHiXIXuJQcswc8nweXmSchSRehVQHbzFk0nu2co
FSlc7lryMVmwEMDCcgqSEL5geDBJTklieFOHjXH0qWwr1uTLJzMDpAWkkk0JDibUOrczQAEOJED6
ppJ1K8I0Ie1xRuapYh1P0GPojEL0ndPZYO2vp9P+W27iDUmu7okTA8tG97Cf5mgDWBinMpWTF8bn
/bhHPdCq4AeLIsx+m9Aa4uTqkzqckZpEg0S0QFnTWGhqhqYlwHk087+Y42sFEyhiWy7tSp7Yk9HI
hp65y0lLeyrLDp/D7CMY4SomKPrGVhlDDSM/9xc6NwRx9xG+d9f0FzDuYFB6Ogpt0wMW7F3o8+Yx
Sq86pgy0TNRKFmiOrt3fW6taaLzNzweWRnZaJlhiRy1LE3rfLs0+FlP77DtjKwgQ5uPA8RyN+M25
100hmpGiVosWEBd1holrglNAgFKVm/hlp1OBONj8nXD7LF1UFTNUd+HPV6HQ1W13CKKC0Csqj/6U
4ySbfKhBuzWpBxxds8FyvLhK1UUgcm/75+F+796tqAQNpFCGF6jdbUJbwR8mGTZZKrrFFBKd2+eu
2I3JLhJqqiV0+uTIgxSzfESlIf/yjo0tIZvK/PEarGf27Iz/69UBNEoO54p8cl+KFdmnKpd5Hxug
ql8YId+8g5tUkmqqiBWkaLl6oTU1MtEb9uOjtz7C0vJ9Hp6NjRCKrcEhlHvIsm36UwCtAmWbcuIa
73d/vIReebu5dJLKZBvf0xw9zva3J51jdGHS/67jjjS0AbP5cT/oWU663RLH5nVAy2W1PQsfVH+H
XGx4PYkKmVo+0XJLgZmxi5u+YkidYRUBK8R/1uead0/dSg7Cm5XJ8+VPebqUeJthEX/CVSpp5qTm
y5cAVrxSPilomgjWgtmcWLZQaUHhuPqiVez4gaiuRWF3LURoV5kryc4SpHLRd1FV9FdBGrIEttoc
XgFPq3wHRpgnQcmQKwZASXuDpfZgV3DIIP2/0pSTJO/659r+TcylRisQKK2ms5jN2z6QeqI5EdSO
VMUahRYwXg3r7oxR2aBRDqdorcKupSrOVYjolAwVmmIaPbyyfAeZ+Ne575ukF46kIEBQThsRHo5q
ZjjdXvz8t3vqlZg5sMJBjebwIiveuOj+UL9a64b64imj33i4gumCKq7is2JgjHMXDuECeQ05ZXs0
XmPJzDKUgGahgiBEhs/tsI/xy01tUjKEq93qL0wpiJ5+DrFPSTA2IWIc3DCCqH/RLVIbLlxNDCnu
3DX1MpfoxceaPtYwR+DD70Tt/Fm+bdSPLtjyEZHp7rntluFkW/TlLXVxluZHk+NH9k85hQO2G4Tr
dVSfyiWngch6aUARWSr8f+Yv72eVTT7NsE9A45y37/6y5p/kd6az3WuQDQZuiBkC+gH7uuVC17GC
33T455ffCfL4epL1EYcSbY4PzwNdI59HOkyGcGJ3LHfIo2do7j9iW+HAILRo+GFW4cm5ndST0svM
9LfaIwRXuWuIjfy723lhhMJnhpdjfMVUl68UdFZVXn81J+xx+nJqgSzidRnxYNlS10GAmgK3nYTO
8dTaOzGmWMX+hUM+lJbmtPfUBAgXnlCwm/XjPMXpRd+QWojPT1kGyqjjOaPdzPL/8WHgEhprkvn6
YZtkp5JLXXwRbVOQz3fl82uAttVMH1Q2yVDn5SXhloCsrp2C8PHQMHqrPJL+3RA5kL/2UPIzkIge
ZeBRxooEc3kojPipfyGhL9OenolAUxGy0ep6Zf/NhDh9NGwSIapNnnLXWWDNMg9rxmEkP3yV2E2T
kyBZg+m7DfjIYuJCb0Eft6vRvqW9+nwDSJOxop+XdpYD0kDE2Rox13wyh9Psz5MnMfhuBLyipg1U
AbdqAfJoKI07IhxAAtuo+tIOrL4/B1qpfX2FpA7GpeJxBKgqYPFA8sGx6oece0FBTPF6ggBECiiZ
29rDcgVDWuuTPsgx1hMofvHDLDo2gVStwUk0MZHZydUjsLeV1cDjnKSkWSrC2l4uEyuZ0KjN+IZx
PJA6YITx24kiYNjAF/LoEbpdbpfhhBZdNlXiQEjrz/yeQ3gMUzRRq4HLXUS0g7O5L9tBateOaKoV
kDQXvhkGmgULRyuFq3w10Vy/uS8ESKmkCIKdh09gftA8HkVZXWWT4sc4kiBMje2Db1ikzKfjVaMU
PcyO16y7V3r0zkNIus+S6x1k/os6zjMHdFj6dh0CqplJn6ciuAUzImDZLYdh6HWQAh66O//Gls8x
Lubjz3t9S3HfugnI8KTK8dgJg15DKomwUs1weBBu6MoBiOFPslyHfwuYt24YzMyz9+D3XcKDByOk
cnt10BlfLv/HrmCDtUicTj8M1BR04Yl3JQB9vmXZuZZ2Ma7M0FXu2VDkElzwj6cgyzFMd0EW/Lu1
Y801Fc0JBrJsGFOzgq30jpvECQoYt4nFWukQAKmKT5wmma+uhUmwj2YZr1XD2IgVVbpgupyzSszg
iXAir63InoPaOBhaloseHlY/Ya+Z72lR1E7wOBE/Jjqk7KEGtWvXtsM9fiHMmZ6vzjg10M2aXkda
AulGAlmVSeTJNyi40gAJPJNdpo3AxZBn6HKY687F9NbZU6YHRoPtufTti/2R7ELC4c40PX/EPnkg
YNu5BXCw6ScNri5keKL7vvZxulIyd5Z7hoSm5Dc9mEpkxafduc1k29frLa7d+SDZi7KSxtAodJul
W/OPtcYZU3Au5CuQHhtZxxpXcrHI8k/obwh7skHspCi25hxyGJQtah86PiRNtNPiSGFuwdj3zXqQ
TvE5b2UEjbip5gvhLAG4ifoxWeUuc5PZ/HnTHvGzBQtBe4amiQ+JrNAhKJpah7qbn1fYPBUqnTzN
VmctGuVCvoxwlDFzrMPriyG8JWPZkjvyN8Lifgf+t8okXgxymP2r48GrHoZjVpqov2wwmin1JWYP
2fwkgwGUn6lXnjIsmUb2m2UaxWRIA+ZXh6Ttl7Tl94NU6RIQ7RPxN6dMI+Uz+U4ThOl02UkyP0ro
J7Ly88fpJE7IwSLNA8fGo/hybCuXslhlNiB9q5aJe8IyQW7KWkiWEoFC2zFBIxFuFrlLk8msueUY
N/t5qRo1iNYYZY81s3H4/2Qi9JI11tIF2ZkT33xjXkDo8RbgGSA0w81QECkzZkH9x0dRXijrvDRd
AtHnvywzOXLbeXBRWPBLqwvBrGCfZnPlKP38uYcwQbYpCbP7njfrW6pcx+gHrllQynr5+HsWNJ+/
OQut9m8o0kZ/4fgnwy1T5jpk8CvEygWE/1kC77/rUdzJZzlBeFSR5edwWbFYZWFi73MVF+m7Kvt0
9aWdHl9wyROftMss8YfM4ndzIwCuq2HHgQ7Ol1dIZRp0lgT/9mNbqIqpHzCxDh9kDs4ZYUpNH5/p
Y05fpJZKJ3tD26g24OUqHcZTLlcKv6oWLAoZNaXwqDoF9JV0OsWFTKbxQ27BoPaGKxQ1VtNM0cFq
t2J7OyDLYyvVeCfhSIGucFP9Qqtle1iR9eRrzgShjvGp/50+WW6kM679FwXcCRgDhclnWk81nBxB
ZLNSZPzBpPcOihgSxpFazhjpvZhce+OYSxltaVgu398bYYngs8P5vfXuP2SyVI5rB3KJ0NfL8DQE
Hhr5ROEdp+vcAMJfwNnUta0+bXniwX687a0i6oU/2dUu/ihpLMoEy2ZWJgNKdXFbdr9iEhWHAB3K
/OaY/t0d0CrQgYksYukh+ABGEoZ/TU5XvQx3J7JMhw/4J/9PdcMsg5JVqBa3EbBdI8n5wBWst2hK
XLAlxWCMh9KZCFHmDD4QrMsaCK9kF+4nt2n6bezfCDIzP/Wa+98vgWP8iYAt44Q/S+Ve6xkaZImq
iEcuYoKRumEcwpKVuqP/z45sf2J5edpglr6ulr6hWAc4h/p1Ralb8yXsB5sMRScIj4WjmrZQSDkF
iu0Cs3hVFVnW0mE3xck7AOGc3v+aunzQpR3Ppo8yjwvZkt2kLKT/beojC8MRzEspXvR52hSFzOlP
b4DacrJkAr26zh89+cNDIJvv/trWeqZRY2UjwbdqEHCPQD37PSi4L3NKoJ8idv5FDNp/7N4hus85
gtbfZ6u8FBPpklK1NxkhX1/z5yXL5eYC9S95hSdpZnzJoUSRr6AtIc817wGlMccaEyOzbil/GzSH
1raMDz/sMQzZ/2HrX6rEETPeC8TOrBdAlWpnoE05fv1uSA31h7ChvDpo3gcqxOzRa4qU5SMDgmwq
i1EmM8ebkmyQShdzMhApoQREwJUpCwrzCSpSzLVjSRSK18fF5V/eSXG0PPpSsR2+l/FjuEApHajO
smAfeZnu/YFWy30Jqe94IFfzafg0N2cfJi41eADPgzEhB2zs02awZM1i8N5ruTyc0WEToFAVaYkV
7kHgXa46H3C6bOuLt3irUHUgbPhG4Cgp330OFlLV8Ez413CVsgR0oOE3cGcc/rDvHDlCaLG+upGd
GyAmQWXOaP7gJ1RRrkD4hrEZxlQrzw9FmYRzZs1JXHkfk+Hgosvq8PnNd+4Be6JDZdNBgydSvkPV
NYGOBj6bFnjKEf1k8wdH7FGVTFR2A+w3HuH0ITFsZcQYMeZycY4OwAL+BsSfs8/SZHVKIJTiOqLD
x3OwSaQvgszV2QDTgYa2PiLsV3WioP+//QLLscnbbdwwSnrjFrPw64Y94bXciaEkGZfh8g4/BvPN
Z5TrhaDFhIfVyGmPGXKxbzetYMtaFqsRq6Mq/HO3wLOtoXNzfQ5OzVlrFh6dQa63ur+dWQlS4auK
5olhfe2Hqymh9c5/ETajAVDtBCDn2awlgjPtrcDijriUkcux3vMBO1UARXZSFkdplDZoxA6HotoX
PK8O7416GqSTrMMUxdNH77YN+aWV1ZSg2nog0F5sCg/Ra2ZazBAatwsRwnwehcxq0F3lzXkStXLk
fw/kqXI47ZQvm2jffPwnojvUJfIrMH5RgLM8OJaUpTyhc/9DQpby0Z9Xo+SssDPHHj0Z/Sfkwubg
P5WzRLgff5UP25XHY/XyGcLRIGG1cKAy7LWgnDosY20qDB8oBApzLKcG49YSZn+RPIHIkUOexEmo
q3oLflxM8iVRNtxxON0L/HWY8c07hiddDi67fSEIIdMaUfepqHvsU2O+iN+PlFxO9yfg1CQQnmH9
aJ6BC9pZGuSnhq+rVrXBxviP9I+5CXzJHyiM2pbZf9nUjlGVHuC9ymsyrOHdcpvujnSh5FVlVWQm
axk/2b/lEnqCHfI9a3Ob/iekyIuSO7j/HHguLLrhRseGFF2OKGSI7IRFy/z1q1Yz+WCfOICmoyg5
kW77ybTpxydro23thUPavh5Fwa6G8CalrVdhK+RQRgn9TAiCXRULHJnYTSf8vV6s+IA3Gulcz5Fb
SFFNOScbdJtve/iIhWWhs9eX+vIEN9w5mAyYP3OjU9t9K3mQMrSRYWCIU7gS3kXQIBfIkWRHbXg3
5i4t86ePh1AHorxrNnuZDzvqsvgg3s/RrlGtRSI+VomNZ6BD11ub10dRmn/AX0tojGUCDvlErANS
p83Rsp09HkuShGh6d5TRXNFaq/j6YAft21PKbJJk8iIKMIK8P7st5CtBfRiUGR8Zx0io0aalBV3o
9vOLBAIWjDKBGFCfuVsAgKASoCufN6ddobDdefIUVyzZStkNRp7osrQeXXEVZwJLVJY8lneMt92A
FHDjRaaBOGVX1sHqs5vonpEhSBvcHjWEomrdMvC4zk9WMIx/ObS87SB/gIgbCZKoueZYZXeYZY3t
jV7714MdUjYSd/SQcoDzrk7CVlNl/B0bTL/gtDUDALOyHiDjHB0gMYQ/HcGoWzMBi/sPFZ7Z9Uid
p8kXUM20/Xk6Ugi9TfjZ6qvo3mE/dP/z9e9qqOTF/V88QYDU/XkSSIOJyFTMoLdox4RkhG6OqzuC
PrEUIJ4X6gGeRu19XNEpREZqH5yQjrOejQa/dosYmjBDj/Y4c72SCqisRlZPEmdwjT/lvz0OrQmY
tX/PXwCqmXVKVfCP0Pb6LBeaTkjZyuEy2pZLkC52RJJr1mZjrKPPjcyIIlvJYJww8GC1G9+3CZM+
gSZwX48DrW7HjXGpYVsLEHOiQhG6JmyF1X5oI2R10ju3FZsIQBlgbP2Bx4/feG8Gt6rIjjQh+yCF
lJ+cf9bwzk/1yj8dCs3DIrsnWCkbUiOnUXoisVLxyDqVNPR+lP5lYTuzBMGLBDJc2xJkQ02NrnfO
nLEJ91z4eWh5T+0Fz1gSo2YB2zfderQBZsXgH66SRjoDY4KcuMLdF+/9uhg3BLd6LQHS1Lu5sjcZ
tETx+oX5G+Yow6mdanvMvtsEGMZaeCcylM9gNac4GNyO/B5p/HPcfGKUI9DZB0lqUEJtxoAdre9i
lkdwBuKuKBARcxxiKj5ekh2bMZipp8YXhZ+s1QblwEat2f8TSanr7gVYPlLOez0pxJpA5i7QaIv6
xwFc+dVGojkh6deRJ2huwuG4U44rOVy+oo3eebMnAbA8FGJ9/jclhtuqsfDJtIp7riFKM3NN4Ehm
L7TI/yBl4zD3YMZ2wCxMT427dlOc2UyL6OpvvKDaF7y+EwBzyFf3YdITwZ1849ueUnB+3jSCPTrZ
L+hW8zjtgPYmNKO/GlBXi3grzkrmcewMgpuCAVgym+NDzuTDi5jNyDQAmW3zE3EU6yyQyCpUtP4x
2y4TO4O63zkXdeZgE0g5/JB6oeLg13mNOQSGg9Ol7FTLf+4WN3ukC99mqhJWcgAH6HWuuy5dPLb3
oYHyih8EXf0LLSLAYyMbzSpOUhbMp0J8dnInTB3ZOr7iHliu1NEtIqkPUFCbJy2zELUJvbbNiz9L
ro/UJkQaAZqC4jGzCeMQ0HXkuitnclSClGsWUEqM9z/KGOFPgBB6tOPibFiD2PN1Pxbk6/XmvhWd
7fjxBIkLTEWIV7WsayYjXmom4ri8si5LH0X38lqvTZrz7vJpNK62VWIcFRSMnLJwghkrkMcqqvRV
lX1fjpW+BgCWoI9WQdxku9hAG2FN/Fhjx7J2u/dOJaMp1jENNhA/jUDPWmLBxBiLEImSYGTE+ZZv
hd75V2qtQENsMyTadS9X1MgNqJsiDjfiAGO+hts2Ze9/k8Z4SKi3MGSom+/Uj1DOZ/v6VdsUNT3W
IAldNne19jgeQRkGfpXt3aE58V4zmQWPix/3iyXlA9P7ywgT5god23iE7wri6kzodV9rYVs5o6PF
CqOeDPxKzZQDliDMbDeK9XnTzw4PYqzWvl6pvd4zFAIVto/f06fvO9lWJLkaKeLHyh1tXlDj5LTn
LVccu2mkR289ecqYokGBK75UDDW767MVt32wnGu40cVOsEGweaQfw+SveINw1oQkM3MnXey38lRR
dLcnaxkOe0w2RY9YE48kScRdY9pfTpX1XEZpNV782+uBTvIJi56R33ScLbwelC0c/O+Tl2soOdgG
w1goO/Hne920vXOw2M3KDm6L+pzvgSUWjSXhndNKP+afT6xIhnNunfl/lYjKTv9rIeDqAFfcaMV9
8nXPzadDY3TVefoqvlgcXvjgnSZ1h0q+Ekfnzr0lVTqt36rBW3TzdkMY/HhMtjTr3TTU7poSuB6C
jGHoFJZ8uddkZvLzv5CGw1AGLimlT6vJEIo9z101oLuxwKYcpNwy+tx3lyKITbED3p9nf/vAmpX+
NzRPfLgg+bXlIiWtMhcgK+Bn2PqsIkCGTPU/d2IH3bzau1IOC46VaBH4d7JYaxPvWv/rhevxhWfR
NRQ5XJpKPSpqwx339t1Ad+IvcgmdYWNTaSQzhItWKIsN2hz6QVvlDnP0tj9hFLs5NPJ93CAKzUdP
bYfAnH1y8hJxdyoXRO+w3h0PNngpkaPwqaONKMaGYWISDZVxDFL6gVDkI9qtf04Ut1wzSdBbP0Jb
NwJHij3a6b+A9x2m1Woq8y4zjgcVNIXx/gRN3sKnlE1/HEd7Nuz9dA1sjDqMzUuy3ABhv1fWPm8M
bfSRRTESbKjvvmhWFOs1BHrhbcDW61yQy35AM7upz+uQdTTxi6zv3Y+B3w73OJfR3GREnKb+n89M
EG3FvZYJFsC2no9Jf9I3hDFZRmZcLmtNEUkSJEtJ7TurZ9bYhBTkcTeMHi257e6H/k85kWyNpKhW
ukXu362rNe+BqM5MQ0EdSOr1HwMjwtYzvwbCmjwf5mApodjIthAIcifLUjHLCGg4sqr/0j+ae3r/
SC/WOBhzhL6U0C+RTMU0qRhrnZfFKzhS4tg/l3FGM4MyYYf7QXhiNarp0PgoSjyuyGqr3N63CHjR
s0sSyGX3DrXlUWY17nk9PcZPPWtfrBjENhU61cWovlLyAweaS2nfvr35VEqLjPm89Y/d6rOpakif
fjmGBIhHi9Pwx+pcIBzxlrf3EyCc5TEKuHO0xT1TbfOO9DpL5jUHU2Ngnvt5lZ/+xFZivw08Y/3t
PwaUY1eVrpe3Om/xN9xd5HcIo0pGhs2OPY3+8+CoH73lGKdtHt+/ujFTCVOxcF0dTzXCFwuLpLSz
lmyfiNZVSnwDpdReEMvN6Ns1/+9jCh18XXXBRaHAYuNUcgl5A2+o4+VTqyNpAW059+tPrkxtBJTo
renPzmRf+lRwywXnqePqy/2XrdY41Vrv/t+ytZs6dcEquApIBATWBPnbtsoWjuCve7N2Q2YC1a0T
/pBiQgW0c7NBzpmkS/GoRaALFAbm3N5Vyht8NvALvxVzci9JO7/DLt4xVubzbCQpOAq3uvRHl5sD
ZR6oHBFzELx35OC5HoY6fCwCIOChH5mlLDyXPeRSa0cksHsy7NqKCgzgfU3B9wmcEUCJeyfOi5Bp
jsz2Z0kWqY0Tlraga+77/gbLzYHdlTdJjD9e7NTN0nGfxmrFHcEPL2f6XDWdtuNwjtbVIDA4UZyv
KddvIUizPJSB4LImY6W9Ay4OkvLObFMOucNWqQEwwdGsf+Gx8Gd7Zkrpbu3c49OIbHXPCyzLYyR5
C59FGri/mlSxgYpLmWxKldF+cCbhGTC1p0JWARBwSlRV5iYEert3YAGQxn5UEtUNv9VMXERltXYS
5AObgS/ik0zhnUCQM7JuGNE9z/vOTSH+xL7coD1sqf60hCjPZUjzbHNSdcUV1yX+US54vWcBWHXb
OzYLrtkqKvF2QC8VwnwV5xUq2MSJbR1z7tPngVxF7mCiSkeSnKdOND6iU6uAl/UIYW0FuDlgfX9V
DfrW5HA/ucKF8QUgadDG1tXi9cK3mb8bnCW57emjz6hF52CMPnADdiqQLeFPv9qCoWM9RGqz1dhN
9KAK18eIHSDqh0Dwy086tDue/Czjl1owdwyMeIE58ONx5mb5Un0kvY8gnUcDXY7AAjpH6ofa11Vk
hRlzL6fasDvvXLwI4c63WvQS3A9zIdxwf1wv57jFlAQmLGJB6X4rgU57/KB28lJSZpKnRw6V3Yud
1i+EnwCwI8iOVM55MbwZzNhEumOaiczvHB4Cso9MN6k21v9BU8TlQnlRt9a4VcVUgp79vKCnPeYe
TioUKbzTZmVJxUTiZx5rPG4nNKekx87kqezfv8qfo3aES6QNxYIx4c7d+n/tWGpr6YmCyqKwYGzx
ayxnlFWinOPtiCHXpGf0JCBFFSIbtTSErsx7a7lQZ5rNOjeO0IPZ5L336lTbmDp/R9UNXkDyW8i5
nPdIzg0Cmi4OvqCk8cYZasNprX/CXwTMqydJu3dVZ/CMZjUtaMwCx5zhYK5OUcNKzzGeAF0XR0Ew
9JSmdI1WPHWvr84jLwsJkPafkBY02J0DmfWbZhVqVHU5cGigZTZ/0GJcfs3wGNWV1wM1fMIkT+hH
V9dFfQyuKOARJagRYpBXDvzM6iu245LYqPTwdtDhXIhuUlYajImVgzZjPS0+xISAsVYLo7lmAv2L
3m+bjE/OWQ8D4WynmcCSnaufRC9DYmsMEPCDRqm32hVecu1NL/S+4fCz/UooINWK0r82nyQtJZSQ
9A9bYroAR6A0UzAqxtOAMwL6kjS5FDlU+ewD9nZzzOWpnZoO4Ngc2cTflDqqPuEJdQTR3ZdC3fS2
0pRFHUhDwsccN0giBg1pN1LCzvMiMbN0zgdz1N+V1YtWm/kw/TxqvMYUtmsQ0X7eUl1Dy0AZJhcm
n6kX1wxdauCSuY5569SzuxSdLfJzwVcEre7DZDbK6WupG5sghpPqdpGsgtUfN95oxn6CNXf/oxKS
rqZ2rvjeqm1OVtM8BfVuAS2gYj4+i4mKOIEa3I5e6ARJk20EsHte6lFB8qr1npfZ0R3AzP8PMASM
Cgzd4wg9ObCHjV1iWTRq0qc7iOSnG8o7l+Rt2aF0xeiXbUzgGn5KX+TVkmIwPQcfmRKGqjlInfB6
isVCayUoaRrvi3iv2o9KIrL65v76h/V+VOJaHOJULSrXcFFcBTXpuhoi87lP+SpwPspTHYTJUYMV
ymqF/PcKZfosNsKEnmgZ+z+474So0BkekNYC9LvY1Q7HdlD6zTK9ADofounNZuNoaUVkw2BKwYT8
xvNPxoAFYxo7k/4Y0eZxKNFZ7/MEqLK/+WZRJUFJ8mrLnvYvt1Gd7E7tDkzJ01kcv9OBLl5msVaL
1NmYuEKIuz0jOaGYdetIovY0CgEMOHwVwT6h6giw2OirriF14b5o8jiuz9Vw0aJ5QqPyThFOxQ57
y+YvgMu+Ih+KdnZFwd2Gxt3Zbq+5ppUGzO3sLjpvU4spS/4ZKspJs8xXGjnH5dMW/zKTVenjxDoT
EJdoQVOIDfttx620xnKNCsDIJrUjgug/8tubWglrbO7ZcEUsxnqFXBbMktLSABfi3Cg/6sEgVRqB
Bjk3nf5TGoPDUU9Pa8+dtJ2yqovVfzfeXNJloVGK+1e8gzpkpM5dOt4f2nAsEAAcuW0mdyDGhxtB
muHZ30fHMoCpwtrjMAKHuUDb5O5nuLYQLlbVfBTcUXWOFR/z27VIqelE61SvhDHdf6eBu3SOSrwz
s7xUQAhwzqHDGwBX3+bzQEqYBb489geyDPjU1VKJax3M1klBaZ/gbckbZGBaUi1153188Nzb1xSH
up9MmrJ+SnvE+droqVkhAB8akV7rPQNBRAZLM3BKLUPQz+8kHB0zdn8MLEfJy1sP44c+St53t4J7
8T25YavW2r9ncJqxFTvn3qko3ZU9di8TuE3etQ1OTnr0KB+CL5rUa/41FvbmEgXVmnU27/DG9gCx
w1tMGwMNWEmQTCRv0qo6rOJPD3HCXQsIxKgoC8RgEcT/QnZ/nML2Wq15YoRWtQ78mHp9zy7zqi72
LNnd8DtAo4lXm+nbjjPxfq6WME+z3AnSuFXFZffIX4OhOOGsFbljRjV6NPgVbmLRPyWgfoW9fybe
ee1kLlrPhm59BMlDElLDdZ//+W4kSqum959wC2I3MiXpgyz8wZJ9NUUrVLGTY+OcjITWFC0TVuZO
HZDVPEM57sctZhgqjyrDqtUGccHdleU7YcCvvTVElP3I8qjZBtdg9849B5n0gqWZH3ypVYFixIot
kieZM/p4IllpQY05KFAR08jb8w/v+FmFY2WR3u04nayfMOtEPcDF/Eu/2dvjm5+lJ+zWhuxQlowv
HU5/qy48ks4C7qssyLAtcnhj+6F9WWatY9HagMJ2L5cYvDdAQwByOTsoUPIesjvHOK+FIcoAF8NO
wEhIehWiCb/IDLAIOfA8372Pd1lo3wA2ZxlZu9xmlotAKCvYOp4C2Ag6JX1Zj+YG/pf2fXakM/up
OGbMAsQFalOhcFM/EVsYldt9Z8hwpkceRgkpis/S8gpBNeihRVMygdARTdJPsnYcSw3C+ZA+tSU0
XkOgMpOBI/yxpoeDGyvPgv6zUZdEkkek0oEfNe2Li3Orc7WWkdAqW1nNal/b+ViTOtP8ulpiStTx
8OSp5m498mGyljzALlsGE2uScSBRYRVs9yze4uJ4j7liGRNDKqz/S7xUXZGy1ECc/W23J4OYecca
UWdmOn/IYHJAtzomv3jtDsQlBpC5sSysnP0ggg+jTtmjScmWHq1SVoWeX4SpzhuDf7Mu3nXTkpx6
75kZSIziWret4+mhl18yVsq935jK+wdr/mSl9OqgYk0fmlqhlgX+4RwwveshA2iAYExbD8S3Gp56
YhPEH69IYEBD99/ai8Awsxy3xn++ksgbbeu0gzXuNxC/h0Sfnx5x0jG9kcku12NKmKzCRgghYWdH
lQFw/iH/AsBklkvw+5ZEFt8rylfxaNlW5APtzdgSYOmHnkHQnOMgAK4o8YjRbImaw1Db2TOKyFuo
+aXVPyCalJlUB/qR9chD+0w3CAgL7MD+iwlewJVtKNSriDS7uSaThTEd8mJNR/YLk6UujIaTdgNW
0omxZigMuhKPVWOL/6HWWr3xOqXezAz1gVHgMrKInps17KZi2QhPN3rCWXvAUaYJI7fLZx1GI0vk
pqOc0xVG5jgkqKy5pooNacJQbiGamTSTk6YLc7num2mBZMjtpJuS34J3zkdVtpSor7RBkvAbuTek
BVfWiKaEV2tIwSWl9uGRi5ihJtu4KFvJtRwjngDkF7X4k+Oig7oiQeUDOOL/72LM3ckmUFKM3kUE
46UfHxWV3IiDA6Ksr1fCVBLK23ANrF6XuNrCtVvti9wkxME7Oa7/gM94wBxWaNU3XJSnXuCJ+KSm
44ALB71cNdexfQ/oPVvRCaT+mPJzMNAyFSxKrHQjxnqifq+OZS3hyoJy/1qyq1GTuOO9x2o4JAkT
8yQDJ8HRn/KTl86TCvOxJ8JztlpBjLGBipkLO+kGEhBYP6GcCSJxRyGYzMhqRcxrBmcCfoEAoTih
uhrc2/xBckshyzIPqaZrJS/LDoksWBCH+RVF76PvcT/wIJds2DG2jeug6AO1B7RAbtYD2ifXilT+
1Z7bfwmv3B9sFL4jsR9Bmiq3EO3B/RoXlwa6XdT0IeL705n8xvf5v3JCT+zWeUuvslwxiTPIAr1e
6vJAmXL96u4KbmyWltxwJueNZ49ux2GGz9sChdttyeyPcEkQDiLU7UFvH226/KOZxY9fXKyL5G4R
pGg0FwlbRGlPQFrFyphU2PWkUu8btwXYsPfsyWNC2ndFFjy9W23v8x2Yqbr6RH4uitxkIDR1f8xd
xWqwtzSSL8msgTiw22oi6bKIMHS8s9t1yi7qJZwMIej4CbVtJTEEq6oFyScUpR6zpht/aw4tnErG
3im67WJKzl6ke5FGZhGRbGLxHHfvkTLYmGaDKxViaYlI5nMOyENUaYv4tv3fH0rbEonyUC27B+31
gYt9v9TIcQGM7/RBlpR8gLmogItxCR+opGmDkLBX9C3qXxEbw1SZlCMuApd2dYZdpqpHnEPNJGaO
aEVPl/Xf+GStIS+ehfpLhpxuTX/6Z3RXEX5vL14wa8rfdJ8z28HfSu3dBvPxKxzPclShRe9iAsji
n4+E4kO1gKoULc20NAOwjwnY6/BNJjqXDNsB6mROja0mmzNPSdz0i3tccNvhaEHCuVrMOkGqQMTF
vWYW98Kor9AgLMHVCI9kZZi1d3xOJ/TDgR1exVRhDddAhK810w2g15ypgTVgfWq7oB44MDCWRpTh
VsmoSyhnD7Xqo4dIWoNgKLmAbu31D7N4UvczJBtSpnpMwY/Ak3BTG0AVRNeii5wMq7ut7LuJu9rn
ej4cIjBf+9/uCsdhpm+RwBV+QPfdIgci+cpaFKx47IgcfAlXPuGon9LFE8LnlwsRwSJkRnxwYeod
T0v1TLLSbHWE4PftSWuuzYYx0l4IOgCd0eQkFwLhq45idblEYJL2oAY7p7m6jWhvGtdyTdQntQIM
S5ySdRYKeSTkU3e1tpZ3AEbOCRi/aTW7nKXDICpG/h5VUfnN9z4ftVK9GK3upoAFup0tdiPmSBuZ
vkIczGv+oDZWIeQFRhOy+5YIhebZm2pJju97QqK4GU5gz29DtWEhJwA8V/efo1In+KGVAbQMqB2q
qLNFo3OtCyULpQy12T1su4x1M1DrfU9/2PE1+1eukAy59L3/2o0YRgeUB3YuUKOfXoL7DClYtlEk
NXy9GSLD0WpnSCBfq+wnkRs58UHtX7qP4oTa8ZoXXVl5HA/lT3tyh2dC1ilkof+aYY1b+REFbiaj
DgrwoOb9v6qEOtrvWgBXqMkl52Tsq0+sl2/vhGF9AmYH00miZaOvYO5FsPd3H2gMPbMl6euHI5mI
RnOj8MOU01v1bKAK+wvJmOJBXhat5Fechzhf1kt2OGVSC0MJMeYC4k1muXfitLqOtbA0DXLa5egG
0Ks+2g9oAPBMysqzkTCYnuIYsvz9i2/nzpv4TTFI4+ANDo00ANSA5PCte8xXihrH6YV3gUiACFBk
pykloDDeJkTLs6a9CjFSm/z8e+cHptLTovRKTfn/eUYxnuWd3eQPPOafGo/YTO3WqjCpTAmPLrcu
o5FDizZ8y2UD54obLUZKpJCuE7hqB/Yzu2V3PjSTccFSb1jzNliaemCm6jrJSu4lxN4p5s5aSRd0
PSSI/nnCkzmy6FMYn9Byq3Y2n0+/3sGIz+V0UIznQKvA9lRZvK1vkZnAWrZ2l2gROpzyt2jamm4Q
MvrlmblwLZP7JpX4myT1c6F7GCIo/57KBDh2U0LlatU5cbZ4Tr5Llq/6gurh5oT/ZTKMv7SgcMKe
VaREDF8JrSikbm3HLayYpIhVmZ5LQcAGAAKai17YDj4oFXq80fK7xIOdvzDndNxTIIR14CHkC23l
3/tAvTMFyyC+YseW4cSUVI8Iikl/sAwhbmHpT3IdZi7ZiHgLXi9Vb44JKhZx7wwy0SbagYFGtkS3
xyDQPoEukk/BdjocZ21UmVtQjpznRp27X7DWLaPjLFMF2h1TptYp1I4nHR413PxxHOyhjfzhC7vD
ijxQkuzMNMpnPTo1U4Ubrf93/yG1YewaUuKclFo6W1AqdSGJO18Ng5fsFdPzB0+OQJ0deXNxyQdC
SRwI9z9R+tarDpj8ogyNbdU+zaMMcFbfDYuban3SSc2+Z5X9iqUuUt/Q8lAmtzHg7N6vgyoCBuWU
UxWRoFNwRLM9Vkms+CNEVZJSuyH64LSp9qSMCfhSu5Fc48csUnjWryJVtxxtI8SBvt4Umx+XUXZE
8KFpJix3dPNkmLaldaZazJqxy9Zco2tm5Q3MM8llvVrDwYo8fZ2C59mtp9vFkpjzle5zB4COyYfE
tK2aE/9pfCBGSETFucAZaGfvz5fwaLiNb2mefVZQXm6UP6/TXVxsVj2p662F1zdyxIs8gH7fnq7x
Lm3xWmsW5MVCBbkzxe92iP6Jszu2PUNYxEqFyZKHV8q2GUod8ASlVjtwZuaxrKN49HfFvKT3pvEm
oJ8/uR3Xc7cKlPL4sqkorA7k7L+Nq19HLntbjgMqgQo8DZbOJ3FoQJ4II7hW1RecZF23fgfZcZt7
q1ZhW8EzNkRtcjJDM/fi52+FuPUEHfOSLIeVxfiD0G8gMGkixynKIPh+n0j8JsJ8kfb66VqqRQ0V
wqLAliygWcUExpktVWzWdGipm4sIX+D0RtzCrtqBnrVON2pJa4Q4HDiAR0CLyW0Kax1PGQ255pF5
4nSWulebWhds0ntwheloOHJ4QJbxar6EjaRd8OSDhJzsxDkTsmVLzagOGov6IL/dlVx9aUcB2x91
NZZ1Byis9wWm5NvebTE5FD4u3wTxIoQGL2iT1YbgLA0XZMUe44GOeYToLZ3v9E5Hg21td+pxqxzP
UrzNY0LvJsNG3wc6Q3cHueY6UFCVAZ7P2st99BiynMpMJkEQr2OEbmZVbwvoqAlPc6H0z9vgaotr
aQ3RwvOMuKmdWSWFTLTE7pEcQ4hbP6caVUiO1qnqjQVoS20eNieK+nNaPOM61GklpWTxmtdIxIBl
tTQz4JUEeU1GfomYD9bDqmZ/y5t1R07ejWBR7kXnBkLH4DX2xUe53IyJcVqBM5IBbtzZbKUb28hN
3YjnMT832XtgOlNUfA9vqAY69Lz2A1K1X2R69szVCFWUgedIVzgx15LCikTDzz0CDJYDOHiS06xO
wtwz2DkV7PgufWXQo8uKS77hSfAzUIYsWE8ZgSD6zMcXPgK974QGLemOhDa0JMNOU5IoC+az4zoT
CwMv61KOwB/M8g4Birf+xEW7BuzGqjyZk2dg/GjhJpDHBwC8VzkjE7d8Qyx8kjwFrT4oRhA/FpS5
aYjMsI/40vKAB53HFWo0k2RTl6CrpkOhum507oo73ZX6PPC+zDZZCcQteiKnKTLWv6QutBrBLBCr
k4cK+hlgZH4DmlSMbdwIHcx2WXIVmI39946g83wRRwWgZHmPpvvcf+5IOyFITzt8GLcGbxCNuxdk
8Z8pELc7OsXe8oWXoA0RtVMRCizf7JscDyMbwT+xLUtm4K1iFnEpYuE3P9tbNvp8uKPbZZfwm+Za
C5fk+g/uZbm2LWya0Ybe2QJfPWgwinG55RHyykHo4UUWHgLVipnhxcvudOk8vCtEzGRfna3FruhW
48Ceq01NdLXcS8WtdQkxjYbl0gwBZowfnURgP6mqynsLnzCWU5PJMEzkKGENF83KJl9+z1eotSQT
icNPbV0E8Re/Jxtt/Y+V3ifbM+w0PW1L5y6cu06C/Lrydj3ZuITDn7AdTxt+jx0933xfxJ/F/B3E
d1MByXd46UAYbm7FfMAyih4WK0IYejqI6QlRLGKQgD59QHEifuw92s9SHxacbXzYcoac1QGtpx8C
sWdTOK/95LLZwFO6pUyX6v0LrCpMDCOqpw0F5TfmUqwctUMqjmdq6x0uER3WLXtMmgrTVbhfeDwY
7aLxwUncGT1BIMFYnhwoKJ8NJ4IlsE1PmL05DBTEyi3Z6XgHakjHnlZbeurh8xB9WnRVtsWg8Wp0
KvA8lOoTXTN45tGhgDHktXNnqf8jWVJ8fGN5CAK1UE/cn1LXHJR0VUJYj3Pg0KxFenZM10UgH7Bm
H7hMKdmUUucYlYlBZTeYihZKwyO6XQidqiE7aEoT5bmrGa8kHPVVs9ALYOncnF9mBuGpU/FYo6KL
Z9q4Crqb6PImpXYtGuh3rr3zq91VK/KtSdYou3P4C4VtZVmn4F+Yf0XwNCiwDaO8Lj5QzdQFXfAQ
sPrcvx8noIYicWf6rWX4J0iEeCmN2XrzpZDVu6ofr3/sBXaa99mIBiTWagWrX6cJiTocWsr/co28
sUH/oliMCZIUMsZbCTbgBbbepZi7qd5jhULU6xceFOoXIj613opxjBrNMMttQ0EWWlku8+jYuBTj
/iTDeN1gCxuI8L19otby2V2s0HpSHOsbIy0xjw9gfjLOMsmL9Jr88M7Zxvx5GyqzYLqPHmpwq11x
IMb7Y1vrZTp0jAaFON2VWz1cLQMk30tk3HGzTP+FMgalyikit6fr0gicGtWBdYFdEt6UsfKEJmIE
QIvtJX+tIAsH64HOl/bjAEg5qAb1d35pVcAgUUEbdDPx0rhgegFnhnCVSCgAGRkLrtsECFkGOcW7
0H22UQKUnJAV/AcY2v+u9wFXJWX9fR1E5OQ53+zz/ToE5MG1xjkiw0HXqfQNGu61w9L8ARMl9cQ+
kS6Zzne3oXGTgqakSzG4a3brpCuN15KrjUpcGhJ1kqSsVINQfMQ894AebW18/MFJVrLT9RqAvlCC
l6kekb/BRfvdwVBfktjWouZp0eOt8JF6E+GyWmX3JnTYjLqC+d0v7ZjjgJY4J56g/De0I9jPRyse
ZpIMg4bRqp1KH1gn4qAMP7W/Qc1PumERHaE5CfKtx7WR9dfMGdGCBTtd7mt+vBVkwySZgq3HmGG1
RIrLXS7c9LdIdOsH5nHivtO6ArYm4muQzF4sRpVyE4KdNXyBa+v2eeFFvxBIm2VtVWveHnoF4GHY
V9nJUGWeaDx2cZu9rzjdXzD9EckYkZNHGyziYfw2pcFRGZ2prArJZ2yA0DJW61JZSQPn2VHqNBZ/
bwidynzMxcNGu9Bmwyk7P8PzrSC/oG6brOAQCLYAsSgFgtaWFbG0igUsAf8kWUbPz42hQgQfISzU
+jZ0k+gzs0dvHqB3faaHzkWzcbsCOiOwFC+0YPoOsqidWNa8Mfvoum3pkdfvsCuFe1ehZ41ydvHF
oANKI97hZNag2LQekCVMHqw9zXKotbQ+qd6jHyA4MY6ChLvN3FaqXCPg4G1+lHgGn/okBJyQzUAw
mM4Csq0J+zwFt6OP1IAA0rIjWsdYEZ24yViJVv461I7yhyDhD50JWS+MHd7lQCSfB+O8jvc3YK1a
SWr8szP1lu2n/d/u595Ln0OfpLw+uCTQR2u41vZQ9N+fvpbJG72z25eNdnoic01rBOspGdIKE1ZK
y9MWDw1TgK5vrxiIJ1xIkSF2mhR2lOo3Ik2LGPIav+eFFyvrtUwJg+IqgA2AQLkOgFt/35b23C42
yF48SsoQUk9iezCM2ZA301gDkmia7Xtueovgq3vDz6I+dAx7JhJP08C+3FOFv3vWo2JfjEsutEGX
kb7MVPvucto17f2lrBxCrbbtBFeekzwY3icAlSZGEnFnH7ZXNkNbkLQCSkz0L4RCw4unYFrLqZD3
o89rkiZkpzJR7khs1gskE8oJJlaybjVwGOe1DezT1loWF+WutrnLM51QOSKVGxSECLZfIkYgQrwi
eex8CCsX0vXitXWqEgNY1uxwNtx123+nadIFPbG3rtkWe4BzNMR04EuDeNirs/u3gclt0lBJzUBU
57qTTUErhUtm+i7moa/0E2Rz807KKag3A2XLy4aQXxaAAwLC17Ez/w4iqYCe1HiaNIYqkaVvGImZ
gidwitdNVhGClYbgt4Di1gQrPphl6cgdZyw76c90B+Vk1sjb6IRgU9VzJ/NqBsaqV625k6/xZ7is
6z+FmGP1oK3F0miZ5VbPQAbxSyV0yAWlyppJZeAeYmil0A0YZzoMcLhxupeEaX0yBC29IGjh9E/M
40Mhz5fHe5bloe76YTK3W1MrizIz3X8SDHnf3HpGfPMWzKESQRm14tAXsiCCSmuaoi9lY1r18TDM
XKExRwyvQ2J034sXPfc3m5oHZhEvwrOJ4lM51RRPS9wQEJ8iQnH4+39Y0Obgx8IyqB0PZyWSBzZC
ckWyYpBPvVaCtrsmnPgt/zYmaudaej/m8pjsZkWnsoWwZYQ8VY+W6bjBLKZCDoW/lghMlPf1Y1bb
oAjIAv1iw07qo4ro85HiSMqnEz33V/TG0vIEE5YjBnMKn6tyS4ju42YKLdlSO60xdCiCmUUIE/l/
8ceAr+nN4pCDeCtFRTh12hLCT/mczNNw/BlBb/BmbHcyr6UawoMlAKSFq8ojkKaxwwqTw174IblY
FhhETaTYZei+/pBUf+yoMrcgXez2GW+qoEYU552DVk99U1EoST0hHQDT39rDw8AHThbCOgI9WyDv
h/qg7jMmv0SsHjri68bdGf/V3qPDJt9m03wvfkeToGDF2Eqj0AzIeol1rsXeuIoduHF2Yvyfdy7S
ChnciSdiODAZ87IneazF+b6lOnzmIsJcFuddSBSZ3JFMnNfBFtZb+nz9m+f2FQz7R+MByr4XUyUC
JTS4nJA2XG4Nk4dB3BMuc4qJzo7mOh9epbnaNbokxYpZ8WMOBcGMZ1m4OK5TGEMQSRfM6izr9+YA
9puOdiXejfH/211Wtl8QSZvUYuhFTNyKb0m1HWjU32b5Uu2CJy/m11HU+hlFeLgntKvXvsaBILK1
V2M85JaOxT83ZeLpmdXSxEoVfHjtleaQuUU4c1YKjM3uNM+n84EwniPlPdau60HlEaeJyCWh1l7L
D9b3viC74aS/JNXANn6hGgDzWRp8No65oKILv/dWhqkaNiQbO+LLzz21rvIEfVXkSdT7+2rTc4jx
OTJl7eVNH+LLmHVczc4tAy0mNAFyAJJ2ShkMzrPCdhvw11tjd4Usl6KIROspZSJkGW0SLhnRsJMI
0xP/oDTg/VkLXaz9ekb9mvK8croVncs7vyFyfo99JIEWJXZWrLN+Kl/ZC+b6DF0Or1kj21RbddbP
LjzFNQW0w8oYaIE9YDFhnw3SaEoAXrsoqMNThLUD5YNEqyDLL26XcsTPEij29Q4CD+0bdv238aBp
xbERi7kZKgrvMHa1Js6slgvISvzzBbrG225CYB9yi+scrZ7KjAe4ByWbqRddmXZmpzrm3l2lJfvb
8artLNoBP7D+meLvrDXFqzgusFIe4EkzeDM7/yrQLQVxqlwuC3As6qaQICFrVofk+aG6Pd1z83xI
KgOz6S2o+D2zoPMXfenJIHpVxrXQZLz4fRLgey9LWH3bwYLVO0nJP4MHQEWARL+gmIGEwxqzdFYL
rz6Xc8lQple9KmmW6IVNsAxmtOlK6/rDp+AtXJabZONQs4/PgvN7M1zsJlEgtJ/oWNvfyihnIm/l
3g0FfgXKD2lQiqSdTyvtRCyqY5l5p0HS1PE78l/uW62DwgBRjUqkm1ugMiryGa6zGptiGi9prHlf
8FE9MV5v/ecGv7Lmsmw/rfvzohCJYmT6DpbvRCM3rthxr+wdeT/y8vKBrsyeI+fL5VSRzssBl658
AYM//Pg2253501/Aql12pMPX7VijJ4TDU9XRujWtVBMJup7LqUUHS8BvrqaQqksn3iqMf93jaCqc
eZK1PRbEiw7Nwa7nPyLsH3Qzf2iwNeL9+sjS/gAbnwui3z9aCFU9J2RAt9ZiwRxV9PmXGCeEMFOP
/QzCw1ouk+UwrzOPk5FYr4x4hD1hrddnztU6EsjJ92EnpEOnzgnRLDPih5sn8PlP6RACZ+IpotgY
rmhaM8j0mJJZta1pVPMDa56KQgc0I0pSlgW1BESoAPi+zWCPuGxjUA0BGc8tra6FVpmcRzAwRqyt
80BeZbb8npz2REBOupu8ipEfLxcImoNlfE+F/uYp1rN4HbOl63sPxX9q8o66Fo29r0/d5Z3noNVo
taFutAn9AYH91oshjN489svBtO7Dfj01RqQ9JhZPealgm4A31AsemoP98xWjT6w/QUAtn80wis3e
iIBlIyS70/0i0XKmLqP7r/RUnj6SzoxLPlXSAndnyHMoJeVKoIenlEnp/5JTzQwBL4/w14ecEQe5
JaWqYoxPFoVMjX5ShR2y9Rf3OmlhwmQtljDFh9L9z/27t7oNP2ojuYiok5u+cyABqOB7RGoKPTDv
CqTEgU1wqHhWkdSg+HsPEp6XD8nfoxA73ZP5ry0uo0dkYuzYblVehpfitZtT8dp6cwtaZ9tZWFEy
f7O0vUi5NhyKgGsmtlAyd6fWyfHdAW73ys3j4CRs5CiiZEgrYdrcX1j5UFbKWSB2CIIwMEho96D7
2MyTgDlZdQBp5BE/O0w6BECNAajERS7UluG9eAFBl8Dzm+l9NYQJz2bHTzEMsJkBGWN+tVkA8mKh
Oezem8tVVG3IhjN5nVYMPiNsH62WXTU4Mo4KVL1uybqaIgtyma5PWv3bFEYeR7cC8Jb/LNfsChCa
+Gs/32k5/4ZlfPowl4FX+ZxfLKWBQ27tDRRvzddwfPM0xX/0NJ1JTv+NdWudvtlxjNiZO6RaDJQ4
V8vG8OAfu8q/uR7AMBtWiTsodV6+cSALth9EenpZprGqDKTCC9qpddaBGe60BwXk751+TrIDNCgi
ygCS95YuhM9stlw8n9Jp2NxBmf8s4PxgQL7RmzbhEnAeuczLgD/LBKjfEYWy0WCbJ27yVLm5sqWS
WsEkMHH4ou3Woh7l2JTK1sT998vC/ie7o7pAAcpk2H/CXtwy4BXtyZyrjnk7TsHOklqQoZJuP3ic
+H0YyzX0akHXzhqqWh7AIrvDb0Cm5cqWsEzX1nqzPntlq88UksA8t0TTDO/Tw6DljWKNKUFmRizU
o4cTTxXRzDi+GNmZmfxVSLyw8OAe9c8aYPbPKjwqC/Ac0eqm5SB9z2PsZgywFVfsUmrja32CRR5D
V9UNF5rDBnwPyHUKgpZ2cKJgWOdiYYBL7mMC1kHnSsxEo2s44Ism/j3QbggiZdf2WQZ0BMEZurxS
ynJq/qqhQ88gUwAkwk4kB6Bq57pyKyITTLsJtMn7M2423dHA9x7dZKZoq0L0ChdDYR1iqS3XVNmQ
7oCRprqtcDyctSryH6DcyGMV6Urbt7CPEIGaA7zwRdfxKn2TG3syw83hjYz6k1I/U0DrwiJ+hPUa
wrBFbORG0v+y2mcPe7r9z33OUCbci+wuYnrhC1ztOx+TlTq9S4N1pib6lzjUzbtRyxmsiSKRRpgf
TIuEFZgmbyZPerqUWqlUVmu19+NpkRdvmHQBx8DeFOgx/8RVfKSXYzOUTXWdrSs0uDdAQC80c7ZL
PGDp4+jchssXLCj0f3Rz0kp1yLQ9cfBhzw3SL2bKeq3JRHYWDOEobff0N6m5APwxEm05yM7JD8KC
Vc1UdyhBEh4rW9j3t9dgM69NI0tL09oiLLm+Q4K7Jc5jl9fb9xblBkC8lEDffmljsUCT+ln0As/f
wnE6GR5xWRe6ds/WRZTGpM6owmj0IWgqBE8riYhBD+VHMvuiq8taHAm9JlacuGetJImnWa5Z6hCY
DahY/BLXJkmh0GOEcQ4ynCX4MLy0LXDuZMsQqsLtFLdXNYM2rp5K7YD42WnCgsKtGog0tlWv7bxI
PmHToMJ0teIliWAdKkNGlZSmH2TkEqmQ/mEGRzGcgc4GywBx0wRzPZ9hUQ7sHOj3lv6Gk9PwrwJo
uRVTdh64PJpem9i3W7gu0JWt1D5UWA7SwPf2Wn2t2lBT3cG61qX+OMrVggKZC63ldjhTBoFm6h3v
f9q9CJsxe6u8x/h12+zVOHgdqV0wpD0JHtpmb/9oIFn+H/zXhJ6OXScEhA8nL31haStvzSF1e4Lw
chVaPFNmdWRCVQQqbo/tH4n/Luvy4P1vont7ImpR3j2CjeA50QqTmfA0jWaqpiWKA+MreBdCgTJ2
5FBQv8Yysc6pwuMJC6uXu8FO3MIn6VNrzKxG/FoVUrQeROq01Co5OXtIJf1d7a/p+w0LSse4r5Go
5OUTUqlg7IYNbzcsbD6odAkQYKT5V7/812rIGg4e6jY5fZbWFnhOSKUixvUfasnLX1oJgmdYW5Hz
KkU25ytSTaD3AlCabi7uCkt1Ex8kehkvFf7g7dODGxKzxB/0DRN1xYipjtQfanjIkA1qUQB9tWoi
nO2uLOVsOBTzLJaKVWJj3vWY+SQRrmiFO2K2pVGgmLgvHLsXvLSqBc509CxzlxCgs31qRdVoTjNQ
sd2yFT5Fe0mmqOpjejRThbmYMDlQjMtS9kaivv9GTI4ku7f4HPS3vH6PTPdtjETlMRPdqNZfCSOh
Wu78DBRINLm84x3DKn3UUWi3Rl3Pz1NcG9HJ90Ta8wA+XcBjzBKLNmYOy0qKRLCHPF6mQAyCYjA1
Jg8Z6AILm2htUCW7+G7+C//fySYC8APHsRR8Dm3CkQ2znMlUhhK9BolwfCZ51Bet7CVRG2X7cV5U
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
