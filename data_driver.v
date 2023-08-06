module data_driver(input[7:0] data_in, input data_en, output reg [7:0] data_out); 

always@(*)begin
	if(data_en) begin
		data_out=data_in;
	end
	else begin
		data_out= 'bz;
	end
end


endmodule