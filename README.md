# 32-bit Parameterized ALU in Verilog

A parameterized **Arithmetic Logic Unit (ALU)** implemented in Verilog HDL. This project is designed as a building block for a future **RISC-V CPU** and supports common arithmetic and logical operations along with status flag generation.

---

## Features

- Parameterized data width (default: 32-bit)
- Combinational design
- Arithmetic Operations
  - Addition
  - Subtraction
- Logical Operations
  - AND
  - OR
  - XOR
- Shift Operations
  - Logical Left Shift (1 bit)
  - Logical Right Shift (1 bit)
- Comparison
  - Signed Less Than (SLT)
- Status Flags
  - Carry
  - Zero
  - Overflow
  - Less Than

---

## Module Interface

```verilog
module alu #(
    parameter WIDTH = 32
)(
    input  [WIDTH-1:0] a,
    input  [WIDTH-1:0] b,
    input  [3:0] op,
    output reg [WIDTH-1:0] result,
    output reg carry,
    output reg zero,
    output reg overflow,
    output reg less_than
);
```

---

## Supported Operations

| Opcode | Operation | Description |
|--------|-----------|-------------|
| 0000 | ADD | Addition |
| 0001 | SUB | Subtraction |
| 0010 | AND | Bitwise AND |
| 0011 | OR | Bitwise OR |
| 0100 | XOR | Bitwise XOR |
| 0101 | SLL | Logical Left Shift (1 bit) |
| 0110 | SRL | Logical Right Shift (1 bit) |
| 0111 | SLT | Signed Less Than |

---

## Status Flags

### Carry

Generated during addition and subtraction.

### Zero

Asserted when the ALU result equals zero.

### Overflow

Detects signed arithmetic overflow during addition and subtraction.

### Less Than

Indicates whether operand **A** is less than operand **B** for comparison operations.

---

## Design Highlights

- Fully combinational implementation using `always @(*)`
- Parameterized architecture for easy scalability (8-bit, 16-bit, 32-bit, 64-bit, etc.)
- Extended arithmetic (`WIDTH+1`) used to preserve carry information
- Signed overflow detection implemented for arithmetic operations
- Clean modular RTL suitable for CPU datapath integration

---

## Example Instantiation

```verilog
alu #(
    .WIDTH(32)
) alu_inst (
    .a(a),
    .b(b),
    .op(op),
    .result(result),
    .carry(carry),
    .zero(zero),
    .overflow(overflow),
    .less_than(less_than)
);
```

---

## Applications

This ALU can be used in:

- RISC-V Processor Design
- Educational CPU Projects
- FPGA Development
- Digital Logic Design
- Computer Architecture Labs

---

## Future Improvements

- Variable shift amount (`a << b`)
- Arithmetic Right Shift (SRA)
- Unsigned Less Than (SLTU)
- Multiply and Divide operations
- Rotate Left / Rotate Right
- Comprehensive testbench with automated verification
- Integration into a complete single-cycle RISC-V CPU

---

## Tools Used

- Verilog HDL
- Xilinx Vivado

---

## Project Structure

```
.
├── alu.v
├── README.md
└── (Future)
    ├── alu_tb.v
    ├── waveforms/
    └── simulation/
```

---

## License

This project is open-source and intended for educational and learning purposes.
