module multiplexor(in0,in1,mux_out,sel);
	parameter WIDTH=5;
	input  sel  ;
  input  [WIDTH-1:0] in0; 
   input  [WIDTH-1:0] in1;
  output reg [WIDTH-1:0] mux_out;
	

always@(*) begin
	if(sel==1) begin
		mux_out=in1;
	end
	else begin
		mux_out=in0;
	end
end



endmodule