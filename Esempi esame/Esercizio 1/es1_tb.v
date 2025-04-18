'timescale 1ns/1ps

module tb();

reg clk, rst;
wire ris_pari_FF;
wire [3:0] cnt;

es1 UUT(.clk(clk), .rst(rst), .ris_pari_FF(ris_pari_FF), .cnt(cnt));

// ### CLOCK ###
localparam Tck = 10;
always
begin
    clk=1'b0;
    #(Tck/2.0);
    clk=1'b1;
    #(Tck/2.0);
end


initial 
    begin

    //### Fase 1 ###
    rst<=1'b1;
    #Tck;
    rst<=1'b0;
    #Tck

    #16*Tck; //Occorrono 16 colpi di clock per riottenere la stessa sequenza nell'LFSR
    
    $stop
    end