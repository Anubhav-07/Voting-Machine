`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 00:04:35
// Design Name: 
// Module Name: voting_machine_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module voting_machine_tb;

    reg clock, reset, mode, button1, button2, button3, button4;
    wire [7:0] led;

    // Instantiate the Unit Under Test (UUT)
    voting_Machine uut (
        .clock(clock),
        .reset(reset),
        .mode(mode),
        .button1(button1),
        .button2(button2),
        .button3(button3),
        .button4(button4),
        .led(led)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    // Initial block for reset and button press simulation
    initial begin
        reset = 1;
        mode = 0;
        button1 = 0;
        button2 = 0;
        button3 = 0;
        button4 = 0;
        #100;
        
        
        // Example button press simulation
        #100 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #5 reset=0;mode=0;button1=1;button2=0;button3=0;button4=0;
               #10 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #5 reset=0;mode=0;button1=1;button2=0;button3=0;button4=0;
               #200 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #5 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #10 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #5 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               
               #5 reset=0;mode=0;button1=0;button2=1;button3=0;button4=0;
               #200 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #5 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #10 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #5 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               
               #5 reset=0;mode=0;button1=0;button2=1;button3=1;button4=0;
               #200 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #5 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #10 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #5 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               
               #5 reset=0;mode=1;button1=0;button2=1;button3=0;button4=0;
               #200 reset=0;mode=1;button1=0;button2=0;button3=1;button4=0;
               #5 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #10 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #5 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               
               #5 reset=0;mode=0;button1=0;button2=0;button3=1;button4=0;
               #200 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #5 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #10 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;
               #5 reset=0;mode=0;button1=0;button2=0;button3=0;button4=0;

        $finish;
    end

    // Monitor changes
    initial begin
        $monitor($time, " mode = %b, button1 = %b, button2 = %b, button3 = %b, button4 = %b, led = %d", 
            mode, button1, button2, button3, button4, led);
    end

    // Generate waveform output
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, voting_machine_tb);
    end

endmodule
