`include "constants.vams"
`include "disciplines.vams"

module sar_logic(clk, start, comp_out, d7, d6, d5, d4, d3, d2, d1, d0, eoc);

    input  clk, start, comp_out;
    output d7, d6, d5, d4, d3, d2, d1, d0, eoc;

    electrical clk, start, comp_out;
    electrical d7, d6, d5, d4, d3, d2, d1, d0, eoc;

    parameter real VDD = 1.2;
    parameter real VTH = 0.6;

    // Set this according to your comparator:
    // 1 => comp_out high means Vin > Vdac
    // 0 => comp_out high means Vdac > Vin
    parameter integer COMP_HIGH_MEANS_VIN_GT_VDAC = 1;

    integer code;
    integer bit_idx;
    integer busy;
    integer done;

    analog begin

        @(initial_step) begin
            code    = 0;
            bit_idx = 7;
            busy    = 0;
            done    = 0;
        end

        // Start conversion only on rising edge of start
        @(cross(V(start) - VTH, +1)) begin
            if (busy == 0) begin
                code    = 0;
                bit_idx = 7;
                busy    = 1;
                done    = 0;

                // first trial: set MSB
                code = code | (1 << bit_idx);
            end
        end

        // SAR decision on each rising clock edge
        @(cross(V(clk) - VTH, +1)) begin
            if (busy == 1) begin

                // Evaluate present trial bit
                if (COMP_HIGH_MEANS_VIN_GT_VDAC) begin
                    // comparator high => Vin > Vdac => keep bit
                    if (V(comp_out) <= VTH)
                        code = code & ~(1 << bit_idx);   // clear bit
                end
                else begin
                    // comparator high => Vdac > Vin => clear bit
                    if (V(comp_out) > VTH)
                        code = code & ~(1 << bit_idx);   // clear bit
                end

                // Move to next bit or finish
                if (bit_idx == 0) begin
                    busy = 0;
                    done = 1;
                end
                else begin
                    bit_idx = bit_idx - 1;
                    code = code | (1 << bit_idx);   // set next trial bit
                end
            end
        end

        // Output bits
        V(d7) <+ transition(((code >> 7) & 1) ? VDD : 0.0, 0, 1n);
        V(d6) <+ transition(((code >> 6) & 1) ? VDD : 0.0, 0, 1n);
        V(d5) <+ transition(((code >> 5) & 1) ? VDD : 0.0, 0, 1n);
        V(d4) <+ transition(((code >> 4) & 1) ? VDD : 0.0, 0, 1n);
        V(d3) <+ transition(((code >> 3) & 1) ? VDD : 0.0, 0, 1n);
        V(d2) <+ transition(((code >> 2) & 1) ? VDD : 0.0, 0, 1n);
        V(d1) <+ transition(((code >> 1) & 1) ? VDD : 0.0, 0, 1n);
        V(d0) <+ transition(((code >> 0) & 1) ? VDD : 0.0, 0, 1n);

        // End of conversion
        V(eoc) <+ transition(done ? VDD : 0.0, 0, 1n);

    end

endmodule