// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.1
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="trace_cntrl,hls_ip_2016_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.628000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=402,HLS_SYN_LUT=477}" *)

module trace_cntrl (
        ap_clk,
        ap_rst_n,
        A_TDATA,
        A_TVALID,
        A_TREADY,
        A_TKEEP,
        A_TSTRB,
        A_TUSER,
        A_TLAST,
        A_TID,
        A_TDEST,
        B_TDATA,
        B_TVALID,
        B_TREADY,
        B_TKEEP,
        B_TSTRB,
        B_TUSER,
        B_TLAST,
        B_TID,
        B_TDEST,
        s_axi_trace_cntrl_AWVALID,
        s_axi_trace_cntrl_AWREADY,
        s_axi_trace_cntrl_AWADDR,
        s_axi_trace_cntrl_WVALID,
        s_axi_trace_cntrl_WREADY,
        s_axi_trace_cntrl_WDATA,
        s_axi_trace_cntrl_WSTRB,
        s_axi_trace_cntrl_ARVALID,
        s_axi_trace_cntrl_ARREADY,
        s_axi_trace_cntrl_ARADDR,
        s_axi_trace_cntrl_RVALID,
        s_axi_trace_cntrl_RREADY,
        s_axi_trace_cntrl_RDATA,
        s_axi_trace_cntrl_RRESP,
        s_axi_trace_cntrl_BVALID,
        s_axi_trace_cntrl_BREADY,
        s_axi_trace_cntrl_BRESP,
        interrupt
);

parameter    ap_ST_st1_fsm_0 = 3'b1;
parameter    ap_ST_pp0_stg0_fsm_1 = 3'b10;
parameter    ap_ST_st4_fsm_2 = 3'b100;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv32_1 = 32'b1;
parameter    C_S_AXI_TRACE_CNTRL_DATA_WIDTH = 32;
parameter    ap_const_int64_8 = 8;
parameter    C_S_AXI_TRACE_CNTRL_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    ap_const_lv32_FFFFFFFF = 32'b11111111111111111111111111111111;
parameter    ap_const_lv32_2 = 32'b10;

parameter C_S_AXI_TRACE_CNTRL_WSTRB_WIDTH = (C_S_AXI_TRACE_CNTRL_DATA_WIDTH / ap_const_int64_8);
parameter C_S_AXI_WSTRB_WIDTH = (C_S_AXI_DATA_WIDTH / ap_const_int64_8);

input   ap_clk;
input   ap_rst_n;
input  [63:0] A_TDATA;
input   A_TVALID;
output   A_TREADY;
input  [7:0] A_TKEEP;
input  [7:0] A_TSTRB;
input  [1:0] A_TUSER;
input  [0:0] A_TLAST;
input  [4:0] A_TID;
input  [0:0] A_TDEST;
output  [63:0] B_TDATA;
output   B_TVALID;
input   B_TREADY;
output  [7:0] B_TKEEP;
output  [7:0] B_TSTRB;
output  [1:0] B_TUSER;
output  [0:0] B_TLAST;
output  [4:0] B_TID;
output  [0:0] B_TDEST;
input   s_axi_trace_cntrl_AWVALID;
output   s_axi_trace_cntrl_AWREADY;
input  [C_S_AXI_TRACE_CNTRL_ADDR_WIDTH - 1 : 0] s_axi_trace_cntrl_AWADDR;
input   s_axi_trace_cntrl_WVALID;
output   s_axi_trace_cntrl_WREADY;
input  [C_S_AXI_TRACE_CNTRL_DATA_WIDTH - 1 : 0] s_axi_trace_cntrl_WDATA;
input  [C_S_AXI_TRACE_CNTRL_WSTRB_WIDTH - 1 : 0] s_axi_trace_cntrl_WSTRB;
input   s_axi_trace_cntrl_ARVALID;
output   s_axi_trace_cntrl_ARREADY;
input  [C_S_AXI_TRACE_CNTRL_ADDR_WIDTH - 1 : 0] s_axi_trace_cntrl_ARADDR;
output   s_axi_trace_cntrl_RVALID;
input   s_axi_trace_cntrl_RREADY;
output  [C_S_AXI_TRACE_CNTRL_DATA_WIDTH - 1 : 0] s_axi_trace_cntrl_RDATA;
output  [1:0] s_axi_trace_cntrl_RRESP;
output   s_axi_trace_cntrl_BVALID;
input   s_axi_trace_cntrl_BREADY;
output  [1:0] s_axi_trace_cntrl_BRESP;
output   interrupt;

reg A_TREADY;
reg B_TVALID;

reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_20;
reg    ap_ready;
wire   [63:0] data_compare_V;
wire   [31:0] length_r;
reg    A_TDATA_blk_n;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_1;
reg    ap_sig_53;
reg    ap_reg_ppiten_pp0_it0;
reg    ap_reg_ppiten_pp0_it1;
wire   [0:0] tmp_1_fu_171_p2;
reg    B_TDATA_blk_n;
reg   [0:0] tmp_7_reg_314;
reg   [0:0] match_reg_137;
reg   [31:0] length_read_reg_264;
wire   [31:0] tmp_fu_148_p2;
reg   [31:0] tmp_reg_269;
wire   [31:0] tmp_2_fu_154_p1;
reg   [31:0] tmp_2_reg_274;
reg   [0:0] tmp_1_reg_280;
reg    ap_sig_121;
reg    ap_sig_ioackin_B_TREADY;
reg   [63:0] A_temp_data_V_reg_284;
reg   [7:0] A_temp_keep_V_reg_289;
reg   [7:0] A_temp_strb_V_reg_294;
reg   [1:0] A_temp_user_V_reg_299;
reg   [4:0] A_temp_id_V_reg_304;
reg   [0:0] A_temp_dest_V_reg_309;
wire   [0:0] tmp_7_fu_214_p2;
wire   [0:0] A_temp_last_V_fu_223_p2;
reg   [0:0] A_temp_last_V_reg_319;
reg   [0:0] match_phi_fu_141_p4;
reg   [31:0] samples_fu_74;
wire   [31:0] samples_1_fu_228_p2;
reg   [31:0] i_fu_78;
wire   [31:0] i_1_fu_234_p2;
reg    ap_reg_ioackin_B_TREADY;
wire   [31:0] tmp_3_fu_200_p1;
wire   [31:0] tmp_5_fu_204_p2;
wire   [0:0] tmp_6_fu_209_p2;
reg    ap_sig_cseq_ST_st4_fsm_2;
reg    ap_sig_280;
reg   [2:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'b1;
#0 ap_reg_ppiten_pp0_it0 = 1'b0;
#0 ap_reg_ppiten_pp0_it1 = 1'b0;
#0 ap_reg_ioackin_B_TREADY = 1'b0;
end

trace_cntrl_trace_cntrl_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_TRACE_CNTRL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_TRACE_CNTRL_DATA_WIDTH ))
trace_cntrl_trace_cntrl_s_axi_U(
    .AWVALID(s_axi_trace_cntrl_AWVALID),
    .AWREADY(s_axi_trace_cntrl_AWREADY),
    .AWADDR(s_axi_trace_cntrl_AWADDR),
    .WVALID(s_axi_trace_cntrl_WVALID),
    .WREADY(s_axi_trace_cntrl_WREADY),
    .WDATA(s_axi_trace_cntrl_WDATA),
    .WSTRB(s_axi_trace_cntrl_WSTRB),
    .ARVALID(s_axi_trace_cntrl_ARVALID),
    .ARREADY(s_axi_trace_cntrl_ARREADY),
    .ARADDR(s_axi_trace_cntrl_ARADDR),
    .RVALID(s_axi_trace_cntrl_RVALID),
    .RREADY(s_axi_trace_cntrl_RREADY),
    .RDATA(s_axi_trace_cntrl_RDATA),
    .RRESP(s_axi_trace_cntrl_RRESP),
    .BVALID(s_axi_trace_cntrl_BVALID),
    .BREADY(s_axi_trace_cntrl_BREADY),
    .BRESP(s_axi_trace_cntrl_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .data_compare_V(data_compare_V),
    .length_r(length_r)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_B_TREADY <= 1'b0;
    end else begin
        if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))))) begin
            ap_reg_ioackin_B_TREADY <= 1'b0;
        end else if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & ~((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) & (1'b1 == B_TREADY))) begin
            ap_reg_ioackin_B_TREADY <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ppiten_pp0_it0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (tmp_1_fu_171_p2 == 1'b0) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))))) begin
            ap_reg_ppiten_pp0_it0 <= 1'b0;
        end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
            ap_reg_ppiten_pp0_it0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ppiten_pp0_it1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & ~(tmp_1_fu_171_p2 == 1'b0) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))))) begin
            ap_reg_ppiten_pp0_it1 <= 1'b1;
        end else if ((((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0)) | ((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (tmp_1_fu_171_p2 == 1'b0) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY)))))) begin
            ap_reg_ppiten_pp0_it1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (1'b1 == ap_reg_ppiten_pp0_it0) & ~(tmp_1_fu_171_p2 == 1'b0) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))) & ~(1'b0 == tmp_7_fu_214_p2))) begin
        i_fu_78 <= i_1_fu_234_p2;
    end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        i_fu_78 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (1'b1 == ap_reg_ppiten_pp0_it1) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))) & ~(1'b0 == tmp_1_reg_280))) begin
        match_reg_137 <= tmp_7_reg_314;
    end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        match_reg_137 <= 1'b0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (1'b1 == ap_reg_ppiten_pp0_it0) & ~(tmp_1_fu_171_p2 == 1'b0) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))) & ~(1'b0 == tmp_7_fu_214_p2))) begin
        samples_fu_74 <= samples_1_fu_228_p2;
    end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        samples_fu_74 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & ~(tmp_1_fu_171_p2 == 1'b0) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))))) begin
        A_temp_data_V_reg_284 <= A_TDATA;
        A_temp_dest_V_reg_309 <= A_TDEST;
        A_temp_id_V_reg_304 <= A_TID;
        A_temp_keep_V_reg_289 <= A_TKEEP;
        A_temp_strb_V_reg_294 <= A_TSTRB;
        A_temp_user_V_reg_299 <= A_TUSER;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & ~(tmp_1_fu_171_p2 == 1'b0) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))) & ~(1'b0 == tmp_7_fu_214_p2))) begin
        A_temp_last_V_reg_319 <= A_temp_last_V_fu_223_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        length_read_reg_264 <= length_r;
        tmp_2_reg_274 <= tmp_2_fu_154_p1;
        tmp_reg_269 <= tmp_fu_148_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))))) begin
        tmp_1_reg_280 <= tmp_1_fu_171_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (1'b1 == ap_reg_ppiten_pp0_it0) & ~(tmp_1_fu_171_p2 == 1'b0) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))))) begin
        tmp_7_reg_314 <= tmp_7_fu_214_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (1'b1 == ap_reg_ppiten_pp0_it0) & ~(tmp_1_fu_171_p2 == 1'b0))) begin
        A_TDATA_blk_n = A_TVALID;
    end else begin
        A_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (1'b1 == ap_reg_ppiten_pp0_it0) & ~(tmp_1_fu_171_p2 == 1'b0) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))))) begin
        A_TREADY = 1'b1;
    end else begin
        A_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314))) begin
        B_TDATA_blk_n = B_TREADY;
    end else begin
        B_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & ~((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) & (1'b0 == ap_reg_ioackin_B_TREADY))) begin
        B_TVALID = 1'b1;
    end else begin
        B_TVALID = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st4_fsm_2)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st4_fsm_2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_53) begin
        ap_sig_cseq_ST_pp0_stg0_fsm_1 = 1'b1;
    end else begin
        ap_sig_cseq_ST_pp0_stg0_fsm_1 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_20) begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_280) begin
        ap_sig_cseq_ST_st4_fsm_2 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_reg_ioackin_B_TREADY)) begin
        ap_sig_ioackin_B_TREADY = B_TREADY;
    end else begin
        ap_sig_ioackin_B_TREADY = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_1_reg_280))) begin
        match_phi_fu_141_p4 = tmp_7_reg_314;
    end else begin
        match_phi_fu_141_p4 = match_reg_137;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : begin
            if (~(ap_start == 1'b0)) begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_pp0_stg0_fsm_1 : begin
            if (~((1'b1 == ap_reg_ppiten_pp0_it0) & (tmp_1_fu_171_p2 == 1'b0) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))))) begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_1;
            end else if (((1'b1 == ap_reg_ppiten_pp0_it0) & (tmp_1_fu_171_p2 == 1'b0) & ~(((1'b1 == ap_reg_ppiten_pp0_it0) & ap_sig_121) | ((1'b1 == ap_reg_ppiten_pp0_it1) & ~(1'b0 == tmp_7_reg_314) & (1'b0 == ap_sig_ioackin_B_TREADY))))) begin
                ap_NS_fsm = ap_ST_st4_fsm_2;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_1;
            end
        end
        ap_ST_st4_fsm_2 : begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign A_temp_last_V_fu_223_p2 = ((samples_fu_74 == tmp_reg_269) ? 1'b1 : 1'b0);

assign B_TDATA = A_temp_data_V_reg_284;

assign B_TDEST = A_temp_dest_V_reg_309;

assign B_TID = A_temp_id_V_reg_304;

assign B_TKEEP = A_temp_keep_V_reg_289;

assign B_TLAST = A_temp_last_V_reg_319;

assign B_TSTRB = A_temp_strb_V_reg_294;

assign B_TUSER = A_temp_user_V_reg_299;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

always @ (*) begin
    ap_sig_121 = (~(tmp_1_fu_171_p2 == 1'b0) & (A_TVALID == 1'b0));
end

always @ (*) begin
    ap_sig_20 = (ap_CS_fsm[ap_const_lv32_0] == 1'b1);
end

always @ (*) begin
    ap_sig_280 = (1'b1 == ap_CS_fsm[ap_const_lv32_2]);
end

always @ (*) begin
    ap_sig_53 = (1'b1 == ap_CS_fsm[ap_const_lv32_1]);
end

assign i_1_fu_234_p2 = (i_fu_78 + ap_const_lv32_1);

assign samples_1_fu_228_p2 = (samples_fu_74 + ap_const_lv32_1);

assign tmp_1_fu_171_p2 = (($signed(i_fu_78) < $signed(length_read_reg_264)) ? 1'b1 : 1'b0);

assign tmp_2_fu_154_p1 = data_compare_V[31:0];

assign tmp_3_fu_200_p1 = A_TDATA[31:0];

assign tmp_5_fu_204_p2 = (tmp_2_reg_274 & tmp_3_fu_200_p1);

assign tmp_6_fu_209_p2 = ((tmp_5_fu_204_p2 == tmp_2_reg_274) ? 1'b1 : 1'b0);

assign tmp_7_fu_214_p2 = (tmp_6_fu_209_p2 | match_phi_fu_141_p4);

assign tmp_fu_148_p2 = ($signed(ap_const_lv32_FFFFFFFF) + $signed(length_r));

endmodule //trace_cntrl