module main();
reg [7:0] r1 [0:511];
reg [7:0] r2 [0:511];
reg [7:0] r3 [0:511];
reg [10:0] Gx;
reg [10:0] Gy ;
reg [10:0] G [0:510];
reg clk;
reg [31:0] i,done;
reg [7:0] pixel;

reg [7:0] A00, A01, A02,A10,A11,A12,A20,A21,A22;
integer data,scan,final;
`define NULL 0 

initial begin
clk=0;  i=0;done=0;
data = $fopen("lena_decimal.txt", "r");
if (data== `NULL) begin
    $display("data_file handle was NULL");
    $finish;
end
final = $fopen(".txt","w");
end

always begin
#1 clk = ~clk;
end

always@(posedge clk) begin

if(i==510) begin
done=done +1;
i=0;
end

if(i<511) begin
r3[i]=r2[i];
r2[i]=r1[i];
scan=$fscanf(data, "%d\n",pixel);
r1[i]= pixel; 
end

A00=r3[i-2];
A01=r3[i-1];
A02=r3[i];
A10=r2[i-2];
A11=r2[i-1];
A12=r2[i];
A20=r1[i-2];
A21=r1[i-1];
A22=r1[i];
if(done>1 && i>1) begin

//Gx = {3'b0,A20}+ 1'b1 +A22+ ~{3'b0,A10<<1} + 1'b1 +A12<<1+ ~{3'b0,A00} + 1'b1 + A02;
//Gy = ~{3'b0,A00} + 1'b1+ ~{3'b0,A01<<1} + 1'b1+ ~{3'b0,A02<<1} +1'b1 + A20 +A21<<1 +A22;
//Gx = r3[i] + r3[i-1]*2 + r3[i-2] - r1[i] - r1[i-1]*2 - r1[i-2];
//Gy = r3[i] + r2[i] + r1[i] - r3[i-2] - r2[i-2]*2 - r1[i-2];
Gx = r3[i] + - r3[i-2] + r2[i]*2 - r2[i-2]*2 +r1[i] - r1[i-2];
Gy = r3[i] - r1[i] + r3[i-1]*2 - r1[i-1]*2 + r3[i-2] - r1[i-2];


if(Gx[10] == 1) 
	Gx = ~Gx +1;
if(Gy[10] == 1)
	Gy = ~Gy + 1;

$fwrite(final,"%d\n",Gx+Gy);
end
	i=i+1;
end

endmodule




