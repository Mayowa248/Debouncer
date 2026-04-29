module debouncer(
    input wire clk,
    input wire rst,
    input wire btn_raw,
    output reg btn_clean

);

reg [6:0] counter;
reg current_state, prev_input;

parameter norepeats = 1'b0,
          repeats   = 1'b1;

always @(posedge clk, negedge rst) begin

    if(!rst) begin
        counter <= 0;
        current_state <= norepeats;
        btn_clean <= btn_raw;
    end else begin

        

        case(current_state)

        
            norepeats: begin
                if (btn_raw != btn_clean) begin
                    current_state <= repeats;
                    prev_input <= btn_raw;
                end 
            end


            repeats: begin 
                if (prev_input == btn_raw) begin
                    counter <= counter + 1;
                    if (counter == 100) begin
                        btn_clean <= btn_raw;
                        counter <= 0;
                        current_state <= norepeats;
                    end
                end
                else begin
                    counter <= 0;
                    current_state <= norepeats;
                end
                    
                
            end

            
        endcase
    end

    
end




endmodule