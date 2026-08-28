module Up_Dn_Counter (
    input wire [4:0] IN,  // 5-bit input signals
    input wire       Load,  // Load signal
    input wire       Up,  // Up signal
    input wire       Down,  // Down signal
    input wire       CLK,  // Clock signal
    output wire       High,  // output signal indicating if counter is at maximum
    output wire       Low,  // output signal indicating if counter is at minimum
    output reg [4:0] counter  // output signals
);

// We could use 5'd31 instead of 5'b11111 for maximum value
// We could use 5'd0 instead of 5'b00000 for minimum value

assign High = (counter == 5'b11111); // Check if counter is at maximum
assign Low = (counter == 5'b00000); // Check if counter is at minimum

always @(posedge CLK) begin
    if (Load) begin
        counter <= IN; // Load input value into counter on Load signal
    end else if (Down) begin
        if (counter != 5'b00000) begin  // Counter is not at minimum
            counter <= counter - 1'b1; // Decrement counter if Down signal is high
        end
    end else if (Up) begin
        if (counter != 5'b11111) begin  // Counter is not at maximum
            counter <= counter + 1'b1; // Increment counter if Up signal is high
        end
    end
end

endmodule
