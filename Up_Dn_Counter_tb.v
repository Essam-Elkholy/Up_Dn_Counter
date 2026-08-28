`timescale 1ns / 1ps
module Up_Dn_Counter_tb();

    // Testbench signals
    reg [4:0] IN_tb;  // 5-bit input signals
    reg        CLK;  // Clock signal
    reg        Load;  // Load signal
    reg        Up;  // Up signal
    reg        Down;  // Down signal

    wire       High;  // output signal indicating if counter is at maximum
    wire       Low;  // output signal indicating if counter is at minimum
    wire [4:0] counter_tb;  // output signals


    // Instantiate the Counter module
    Up_Dn_Counter DUT (
        .IN(IN_tb),
        .CLK(CLK),
        .Load(Load),
        .High(High),
        .Low(Low),
        .Up(Up),
        .Down(Down),
        .counter(counter_tb)
    );


    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // Toggle clock every 5 time units
    end

    // Test Stimulus
    initial begin

        // Initial Values
        IN_tb = 5'b00000;
        Load = 0;
        Up = 0;
        Down = 0;

        // Display Signals
        $monitor("Time: %0t | IN: %b | Load: %b | Up: %b | Down: %b | Counter: %b | High: %b | Low: %b", $time, IN_tb, Load, Up, Down, counter_tb, High, Low);


        //--------------------------
        // Test Case 1: The Floor and 'Low' Flag
        #10 
        IN_tb = 5'b00101; 
        Load = 1; 

        #10 
        Load = 0; 
        Down = 1; 

        #80
        Down = 0; 

        //--------------------------
        // Test Case 2: The Ceiling and 'High' Flag
        #10 
        IN_tb = 5'b11100; 
        Load = 1; 

        #10 
        Load = 0; 
        Up = 1; 

        #60
        Up = 0; 

        //--------------------------
        // Test Case 3: Priority - Down Overrides Up
        #10
        IN_tb = 5'b01111;
        Load = 1; 

        #10
        Load = 0; 
        Up = 1;   
        Down = 1; 

        #40
        
        //--------------------------
        // Test Case 4: Priority - Load Overrides All
        #10
        IN_tb = 5'b10100;
        Load = 1; 

        #20
        Load = 0;
        Up = 0;
        Down = 0;

        // End of Simulation
        #20;
        $stop;
    end

endmodule