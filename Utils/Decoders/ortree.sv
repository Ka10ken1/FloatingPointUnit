module ortree#(parameter N = 7)(
    input wire[N-1: 0] ea,
    output reg orres
);

 generate
        if (N > 1) begin : recursive_case
            reg or1,or2;
            ortree #(N-1-$floor(N/2)+1) higher (
                .ea(ea[N-1:$floor(N/2)]),          
                .orres(or1)               
            );
            ortree #($floor(N/2)) lower (
                .ea(ea[$floor(N/2)-1:0]),          
                .orres(or2)               
            );
            always@(*) begin
             orres = or1 | or2;  
            end
        end
        else begin : base_case
        always@(*)begin
          orres = ea[0];
        end       
        end
    endgenerate

endmodule
