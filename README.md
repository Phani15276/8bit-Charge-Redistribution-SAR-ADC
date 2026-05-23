# 8-bit Charge Redistribution SAR ADC using Cadence Virtuoso
This project presents the design and simulation of an 8-bit Charge Redistribution Successive Approximation Register (SAR) ADC using Cadence Virtuoso. The project combines analog and digital design methodologies by implementing SAR logic and DAC using Verilog HDL while integrating comparator and sample-and-hold blocks at schematic level.
| Parameter          | Value                     |
|-------------------|---------------------------|
| Resolution         | 8-bit                     |
| Architecture       | Charge Redistribution SAR ADC |
| Input Range        | 0 – 0.8 V                |
| DAC Type           | Capacitive DAC           |
| Logic Design       | Verilog HDL              |
| Platform           | Cadence Virtuoso         |
The SAR ADC converts an analog input signal into its digital equivalent using a successive approximation technique. The conversion process starts from the MSB and proceeds towards the LSB through comparator decisions and DAC voltage updates.
The Sample and Hold circuit samples the analog input voltage and maintains a constant voltage during the conversion process.
