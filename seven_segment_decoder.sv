module seven_segment_decoder(
	input logic [3:0] d, 
	output logic[6:0] seg);
	
	assign seg =
		(d == 4'h0) ? 7'b1000000:
		(d == 4'h1) ? 7'b1111001:
		(d == 4'h2) ? 7'b0100100:
		(d == 4'h3) ? 7'b0110000:
		(d == 4'h4) ? 7'b0011001:
		(d == 4'h5) ? 7'b0010010:
		(d == 4'h6) ? 7'b0000010:
		(d == 4'h7) ? 7'b1111000:
		(d == 4'h8) ? 7'b0000000:
		(d == 4'h9) ? 7'b0011000:
		(d == 4'hA) ? 7'b0001000:
		(d == 4'hB) ? 7'b0000011:
		(d == 4'hC) ? 7'b0100111:
		(d == 4'hD) ? 7'b0100001:
		(d == 4'hE) ? 7'b0000110:
		(d == 4'hF) ? 7'b0001110:
						  7'b0000001;  //this tells me of there is an error in my code
endmodule