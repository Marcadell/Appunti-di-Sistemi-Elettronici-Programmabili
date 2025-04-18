//Circuito che genera due numeri pseudo-casuali tramite LFSR, fa la sommma e controlla che questi
//siano pari

module es1(clk, rst, ris_pari_FF, cnt);

input wire clk, rst;
output reg ris_pari_FF;
output reg [3:0] cnt;


// ### LFSR ###
reg [3:0] A, B;
wire fbinA, fbinB;

assign fbinA=A[3]^A[2] // A3 xor A2
always@(posedge clk)
    begin
        if(rst)
            A<=4'b0000;
        else 
            begin
            A[3]<=A[2];
            A[1]<=A[1];
            A[1]<=A[0];
            end
    end


assign fbinB=A[3]^A[2] // A3 xor A2
always@(posedge clk)
    begin
        if(rst)
            A<=4'b0000;
        else 
            begin
            B[3]<=B[2];
            B[1]<=B[1];
            B[1]<=B[0];
            end
    end

// ### SUM ###
wire [3:0] S;
assign S = A+B;

wire ris_pari;
assign ris_pari = ~S[0]; //se è pari l'ultima cifra è zero, per questo il not

always@(posedge clk)
    begin
        if(rst)
            ris_pari_FF <=1'b0;
        else
            ris_pari_FF<=ris_pari;
    end


// ### COUNTER ###
always@(posedge clk)
    begin
        if(rst)
            cnt«=4'b0000;
        else if(ris_pari)
            cnt<=cnt+1;
    end

endmodule