# Sequential Circuits in Verilog

This repository contains Verilog implementations of various **Sequential Circuits** such as shift registers, counters, and flip-flops. 
Each circuit includes a **testbench** to verify its functionality.

## Circuits Included
**SIPO (Serial-In Parallel-Out) Shift Register**

## How to Simulate the Circuits?
To compile and run the Verilog files using **Icarus Verilog**, follow these steps:

1. **Compile the Verilog code and testbench:**
   ```sh
   iverilog -o SIPO_tb SIPO.v SIPO_tb.v
   vvp SIPO_tb  // Run the simulation
