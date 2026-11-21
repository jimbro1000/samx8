---
title: 'SAMx8: Dragon 64 512K SRAM board'
author:
- Ciaran Anscomb
...

Iterating on the SAMx4, the SAMx8 is a 512K RAM expansion and MMU for the
Dragon 64.  It enables arbitrary mapping of 16K pages in two tasks, optionally
making either of the highest two 4K areas common to all memory maps.

Because fast SRAM is used, and because the SAMx8 completely replaces the SAM,
video can be supported when the CPU is running at double rate.  The video base
address can be set to any multiple of 32 bytes across the entire 512K.

As this was partly an exercise in seeing what could be fit into the same sized
CPLD as the SAMx4, some features of the SAM are lost, e.g. Address-Dependent
CPU rate and the undocumented video address "glitching".

This design selects components available at the time of writing, but it should
be noted that some of these are end of life.  Hopefully, the VHDL code being
available will enable similar small and cheap designs with alternate
programmable logic chips.

**Warning:** Fitting this board requires a modification to the original
motherboard.  Although the Dragon 64 PCB is pretty robust, this is old
hardware, so I do not recommend trying this if you're not confident in your
desoldering skills: lifted pads or tracks may ensue.

Released under the Creative Commons Attribution-ShareAlike 4.0 International
License (CC BY-SA 4.0).  Full text in the LICENSE file.

## Files

`pcb/` contains KiCad schematic and PCB designs.

`cpld/` contains VHDL source for the Xilinx XC95144XL CPLD.  Either open the
`samx8.xise` project file in ISE or source the ISE environment files and run
`make` in this directory (GNU Make required).

`doc/` contains LaTeX and drawtiming source for the documentation.
