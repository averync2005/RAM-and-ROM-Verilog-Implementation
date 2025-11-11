# RAM-and-ROM-in-Verilog

This project implements both **Random-Access Memory (RAM)** and **Read-Only Memory (ROM)** modules in Verilog for FPGA deployment. The purpose of this lab is to design, simulate, and test digital memory components to understand the functional and architectural differences between volatile and non-volatile memory. The ROM module is initialized with predefined data values and outputs stored words based on address decoding logic. The RAM module, in contrast, allows dynamic data storage and retrieval through clock-controlled read and write operations. Both designs were simulated in Vivado to verify correct behavior, synthesized, and programmed onto the Basys3 FPGA board for hardware testing.

---

## Files

- `RAM.v` – 8-bit wide RAM module with 8 addressable locations  
- `RAM_tb.v` – Testbench for the RAM module  
- `ROM.v` – 4-bit wide ROM module with 8 addressable locations  
- `ROM_tb.v` – Testbench for the ROM module   

---

## Simulation

1. Download the Verilog source and testbench files from this repository.  
2. Open the project in **Vivado** and add all files to the simulation workspace.  
3. Run **behavioral simulation** on both testbenches:  
   - For the **RAM**, verify write and read operations, including data overwriting and reset behavior.  
   - For the **ROM**, verify that each address outputs the correct predefined value.  
4. Confirm waveform outputs showing accurate memory read/write operations and expected ROM address decoding.  

---

## FPGA Deployment

1. Connect your **Basys3 FPGA board** and power it on.  
2. In **Vivado**, synthesize and implement the design for both memory modules.  
3. Generate the bitstream and program the FPGA.  
4. Verify correct memory operation on the board through input switches (addresses) and LEDs (data outputs).  

---

## Description

- **ROM Module:** Implements a static memory array initialized with fixed data, read-only during operation. Demonstrates address decoding and data output without clock dependency.  
- **RAM Module:** Implements writable memory with synchronous read/write capability controlled by clock, write-enable, and reset signals.  
- **FPGA Implementation:** Highlights how the synthesis tool infers **distributed LUT-RAM** or **block RAM** depending on module size and coding style.  
