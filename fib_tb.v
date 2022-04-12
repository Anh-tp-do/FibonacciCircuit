module fib_circuit_tb;
	reg clk;
	reg start, reset;
    reg [4:0] i;
	reg fib;
	
	
	fib_circuit inst1 (.clk(clk), .start(start), .reset(reset), .i(i));

	// Generate clock preriod = 20ns, freq = 50MHz
	always #10 clk = !clk;
	
	// Initialize all input var. to 0
	initial
		begin
		clk <= 0;
		reset<= 0;
		start <= 0;
		end
		
	// Dirve main stimulus var
	initial 		
		begin
		// Assert and deassert reset
		reset <= 0;
		#20 reset = 1;
		#10 start = 1;				// start is set
		repeat (15) @(posedge clk);	// increment i for 5 clocks
			i = i+1;
        $monitor ("i = 0x%0h, fib = 0x%0h", i, fib);
		$finish;
		end		// init
	
endmodule
