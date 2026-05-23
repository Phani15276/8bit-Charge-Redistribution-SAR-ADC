`include "constants.vams"
`include "disciplines.vams"

module dac_8bit(out, b7, b6, b5, b4, b3, b2, b1, b0);

input  b7, b6, b5, b4, b3, b2, b1, b0;
output out;

electrical  b7, b6, b5, b4, b3, b2, b1, b0;
electrical out;

real code;
real vout;

parameter real VREF = 1.2;
parameter real VTH = 0.6;

analog begin

code = 0;


if (V(b7) > VTH) code = code + 128;
if (V(b6) > VTH) code = code + 64;
if (V(b5) > VTH) code = code + 32;
if (V(b4) > VTH) code = code + 16;
if (V(b3) > VTH) code = code + 8;
if (V(b2) > VTH) code = code + 4;
if (V(b1) > VTH) code = code + 2;
if (V(b0) > VTH) code = code + 1;

vout = VREF * code / 256.0;

V(out) <+ transition(vout, 0, 1n);

end

endmodule