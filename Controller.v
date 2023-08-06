module controller(input zero,input [2:0] opcode,phase,output reg sel,rd,ld_ir,halt,inc_pc,ld_ac,wr,ld_pc,data_e); 
reg H,A,Z,J,S;
 localparam integer HLT=0, SKZ=1, ADD=2, AND=3, XOR=4, LDA=5, STO=6, JMP=7;
always@(*) begin
   
if(phase==0) begin
    sel=1;
    rd=0;
    ld_ir=0;
    halt=0;
    inc_pc=0;
    ld_ac=0;
    wr=0;
    ld_pc=0;
    data_e=0;
   // counter<=counter+1;
end
if(phase==1) begin
    sel=1;
    rd=1;
    ld_ir=0;
    halt=0;
    inc_pc=0;
    ld_ac=0;
    wr=0;
    ld_pc=0;
    data_e=0;
  //  counter<=counter+1;
end
else if(phase==2) begin
    sel=1;
    rd=1;
    ld_ir=1;
    halt=0;
    inc_pc=0;
    ld_ac=0;
    wr=0;
    ld_pc=0;
    data_e=0;
   //  counter<=counter+1;
end
else if(phase==3) begin
    sel=1;
    rd=1;
    ld_ir=1;
    halt=0;
    inc_pc=0;
    ld_ac=0;
    wr=0;
    ld_pc=0;
    data_e=0;
  //   counter<=counter+1;
end
else if(phase==4) begin
    sel=0;
    rd=0;
    ld_ir=0;
    halt=H;
    inc_pc=1;
    ld_ac=0;
    wr=0;
    ld_pc=0;
    data_e=0;
 //    counter<=counter+1;
end
else if(phase==5) begin
    sel=0;
    rd=A;
    ld_ir=0;
    halt=0;
    inc_pc=0;
    ld_ac=0;
    wr=0;
    ld_pc=0;
    data_e=0;
   //  counter<=counter+1;
end
else if(phase==6) begin
    sel=0;
    rd=A;
    ld_ir=0;
    halt=0;
    inc_pc=Z;
    ld_ac=0;
    ld_pc=J;
    wr=0;
    data_e=S;
  //   counter<=counter+1;
end
else if(phase==7) begin
    sel=0;
    rd=A;
    ld_ir=0;
    halt=0;
    inc_pc=0;
    ld_ac=A;
    wr=S;
    ld_pc= J;
    data_e=S;
   //  counter<=counter+1;
end

end
always@(*) begin
     H = (opcode == HLT);
      A = (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA);
      Z = (opcode == SKZ && zero);
      J = (opcode == JMP);
      S = (opcode == STO);
end



endmodule