module calc_top(
	input logic [9:0] SW,
	input logic [1:0] KEY,
	output logic [9:0] LEDR,
	output logic [6:0] HEX5,
	output logic [6:0] HEX4,
	output logic [6:0] HEX3,
	output logic [6:0] HEX2,
	output logic [6:0] HEX1,
	output logic [6:0] HEX0
	);
	
	logic clk,reset;
	logic [3:0] hex_a;
	logic [3:0] hex_b;
	logic [3:0] new_val;
	logic [4:0] sum;
	logic [2:0] zero = 3'b000;
	
	
	assign clk = ~KEY[1];  // sets the buton as my clock
	assign reset = KEY[0]; // sets the button as my reset
	assign new_val = SW[3:0]; // makes it easier to assign values
	
	
	// for value A
	always_ff @(posedge clk) begin  //
		
		if( reset != 1) begin
			hex_a <= 4'h0; //if reset is pressed sets the value of A to zero
		end
		
		else if ( SW[9] == 1'b1 )begin
		
			hex_a <= new_val;   // sets hex A to the values od the switches
		end
		
	end
	
	
	   // for value B
	always_ff @(posedge clk) begin
		
		if( reset != 1) begin
			hex_b <= 4'h0; //if reset is pressed sets the value of A to zero
		end
		
		else if ( SW[8] == 1'b1 )begin
		
			hex_b <= new_val;   // sets hex A to the values od the switches
		end
		
	end
	
	//sets the out_put
	assign sum = hex_a + hex_b;
	
		seven_segment_decoder for_out_MS (
    .d   ({zero, sum[4]}),
	 
    .seg (HEX1)
	 
	);
	
		seven_segment_decoder for_out_LS (
    .d   (sum[3:0]),
	 
    .seg (HEX0)
	 
	);
		
		
	
	
	// sets the values to my seven segment displays
	seven_segment_decoder for_A (
    .d   (hex_a),
	 
    .seg (HEX5)
	 
	);
  
  seven_segment_decoder for_B (
    .d   (hex_b),
	 
    .seg (HEX3)
	 
	);
	
	assign HEX4 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	
	assign LEDR = SW;
	
endmodule
		
	
			
	