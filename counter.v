module counter
#(
  parameter integer WIDTH=5
 )
 (
  input  clk,load,rst,enab,
  input   [WIDTH-1:0] cnt_in ,
  output reg  [WIDTH-1:0] cnt_out  
 );

reg [WIDTH-1:0] counter;

always@(posedge clk) begin
  if(rst) begin
    counter<=0;
  end
  else begin

    if(load) begin
      counter<=cnt_in;
    end
    else if(enab) begin
      counter<=cnt_out+1;
    end
    else begin
      counter<=cnt_out;
  end
end
end

always@(*)begin
  cnt_out=counter;
end


endmodule