# 8-bit Charge Redistribution SAR ADC using Cadence Virtuoso

## Overview

This project presents the design and simulation of an 8-bit Charge Redistribution Successive Approximation Register (SAR) ADC using Cadence Virtuoso. The project combines analog and digital design methodologies by implementing transistor-level Sample and Hold and Comparator circuits, while SAR logic and DAC were designed using Verilog HDL.

---

## Specifications

| Parameter      | Value                              |
|----------------|------------------------------------|
| Resolution     | 8-bit                              |
| Architecture   | Charge Redistribution SAR ADC      |
| Input Range    | 0 – 0.8 V                          |
| DAC Type       | Capacitive DAC                     |
| Logic Design   | Verilog HDL                        |
| Platform       | Cadence Virtuoso                   |

---

## SAR ADC Architecture

A Successive Approximation Register (SAR) ADC converts an analog input signal into its digital equivalent using a binary search algorithm. The conversion process starts from the MSB and proceeds towards the LSB through comparator decisions and DAC voltage updates.

The SAR ADC architecture consists of:

- Sample and Hold Circuit
- Comparator
- SAR Logic
- Capacitive DAC

---

## Sample and Hold Circuit

The Sample and Hold circuit was implemented at transistor level to sample and hold the analog input during conversion.

### Functions

- Samples the analog input signal
- Holds the sampled voltage constant during conversion
- Reduces signal variation during SAR operation

---

## Capacitive DAC

The DAC was implemented using Verilog HDL based on charge redistribution technique.

### Features

- Charge redistribution architecture
- Binary weighted capacitor switching
- Low power operation

---

## Comparator

The comparator was implemented at transistor level for analog voltage comparison during SAR conversion.

### Functions

- Compares Vin and Vdac
- Generates comparator decision output
- Supports successive approximation operation

---

## SAR Logic

The SAR control logic was implemented using Verilog HDL for successive approximation operation.

### Operation

- Sets trial bits
- Reads comparator outputs
- Updates DAC control signals
- Generates final digital output code

---

## Tools Used

- Cadence Virtuoso
- Verilog HDL
- Spectre Simulator

---

## Repository Structure

```text
.
├── Schematics/
├── Verilog_Code/
├── Waveforms/
└── Report/
