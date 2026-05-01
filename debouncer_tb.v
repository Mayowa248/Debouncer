module debouncer_tb;

reg clk, rst, btn_raw;
wire btn_clean;

debouncer DUT (
    .clk(clk),
    .rst(rst),
    .btn_raw(btn_raw),
    .btn_clean(btn_clean)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin


    $dumpfile("debouncer.vcd");
    $dumpvars(0, debouncer_tb);
    

    rst = 0;
    btn_raw = 1;

    #50;
    rst = 1;

    #50;
    btn_raw = 0;

    #1500;
    btn_raw = 1;

    #1500;
    $finish ;

end

initial begin
    $monitor("[time = %0t] rst=%b btn_raw=%b btn_clean=%b", $time, rst, btn_raw, btn_clean);
end



endmodule