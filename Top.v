// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: Mahmoud Adel
// Email: madm154200@gmail.com
// Description: Top
// Dependencies: VeryRISC V
// ********************************************************************
module Top#(parameter AWIDTH=8,BWIDTH=5,CWIDTH=3) 
	(input clk,rst,
	output halt);

wire rd,wr,ld_acc,ld_pc,inc_pc,data_e,sel,zero,ld_ir;
wire [BWIDTH-1:0] addr,ir_addr,pc_addr;
wire [CWIDTH-1:0] opcode,phase;
wire [AWIDTH-1:0] alu_out,ac_out,data;



counter 
#( .WIDTH ( 3 ) 
	)
counter_clk
(.clk(clk),
	.rst(rst),
	.load(1'b0),
	.enab(!halt),
	.cnt_out(phase),
	.cnt_in(3'b0));
controller inst1(.zero(zero),
	.phase(phase),
	.rd(rd),
	.wr(wr),
	.ld_ir(ld_ir),
	.ld_ac(ld_acc),
	.ld_pc(ld_pc),
	.halt(halt),
	.inc_pc(inc_pc),
	.data_e(data_e),
	.sel(sel),
	.opcode(opcode)
	);
memory memory_inst(.rd(rd),
	.clk(clk),
	.wr(wr),
	.addr(addr),
	.data(data)
	);

multiplexor inst3(.in0(ir_addr),
	.sel(sel),
	.in1(pc_addr),
	.mux_out(addr));

counter inst4(.clk(clk),
	.rst(rst),
	.load(ld_pc),
	.enab(inc_pc),
	.cnt_out(pc_addr),
	.cnt_in(ir_addr));

    register register_ir
   (
    .clk      ( clk    ),
    .rst      ( rst    ),
    .load     ( ld_ir  ),
    .data_in  ( data   ),
    .data_out ( {opcode,ir_addr} )
   ) ;

data_driver inst6(.data_in(alu_out),
	.data_en(data_e),
	.data_out(data));

register inst7(.data_in(alu_out),
	.clk(clk),
	.rst(rst),
	.load(ld_acc),
	.data_out(ac_out));
alu inst8(.opcode(opcode),
	.alu_out(alu_out),
	.a_is_zero(zero),
	.in_a(ac_out),
	.in_b(data) );

endmodule