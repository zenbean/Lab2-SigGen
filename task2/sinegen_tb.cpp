#include "Vsinegen.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "vbuddy.cpp"

int main(int argc, char **argv, char **env){
    int i; // no. clock cycles
    int clk;

    Verilated::commandArgs(argc, argv);
    Vsinegen* sinegen = new Vsinegen;

    if (vbdOpen()!=1) return(-1);
    vbdHeader("Lab 2: Sinegen");

    // initialise values
    sinegen->clk=1;
    sinegen->rst=1;
    sinegen->en=0;
    sinegen->phase=0;
    sinegen->incr=4;

    for (i = 0; i < 1000000; i++) {
        sinegen->rst=(i<2);
        sinegen->en = vbdFlag();
        sinegen->phase = vbdValue(); // 256 total no. values of sine

        for (clk = 0; clk < 2; clk++) {
            sinegen->clk = !sinegen->clk;
            sinegen->eval();
        }

        // ++++ Send count value to Vbuddy
        vbdPlot(int(sinegen->dout), 0, 255);
        vbdPlot(int(sinegen->dout2), 0, 255);
        vbdCycle(i+1);
        // ---- End of Vbuddy output section

        // either simulation finished, or 'q' is pressed
        if ((Verilated::gotFinish()) || (vbdGetkey()=='q')) 
            exit(0); // ... exit if finish OR 'q' pressed
    }
}