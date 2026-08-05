# 🚦 Traffic Light Controller with Pedestrian Crossing using Verilog HDL

## 📌 Overview

This project implements a **Traffic Light Controller** for a four-way intersection using **Verilog HDL** and a **Finite State Machine (FSM)**. The system controls traffic flow for the North-South and East-West roads while also providing a safe pedestrian crossing mechanism.

The design was simulated and verified using **Xilinx Vivado**.

---

## 🎯 Objectives

- Design an FSM-based traffic light controller.
- Control traffic signals for two intersecting roads.
- Provide a pedestrian crossing facility.
- Verify the design through behavioral simulation.

---

## ✨ Features

- 🚗 North-South and East-West traffic signal control
- 🚶 Pedestrian crossing request button
- ⏱️ Timer-based state transitions
- 🔄 Finite State Machine (FSM) implementation
- 🧪 Behavioral simulation in Xilinx Vivado

---

## 🛠️ Tools Used

- Verilog HDL
- Xilinx Vivado
- FSM Design Methodology

---

## 📋 FSM States

| State | Description |
|-------|-------------|
| S0 | North-South Green, East-West Red |
| S1 | North-South Yellow, East-West Red |
| S2 | North-South Red, East-West Green |
| S3 | North-South Red, East-West Yellow |
| S4 | Pedestrian Crossing (All Vehicles Red, Pedestrian Green) |

---

## ⏱️ State Timing

| State | Duration |
|-------|----------|
| S0 | 10 Clock Cycles |
| S1 | 4 Clock Cycles |
| S2 | 10 Clock Cycles |
| S3 | 4 Clock Cycles |
| S4 | 8 Clock Cycles |

> **Note:** In this simulation, the timings represent **clock cycles**. For implementation on FPGA hardware, a clock divider can be added to convert these into real-time seconds.

---

## 📂 Project Files

- `Traffic_light.v` – Main Verilog module
- `Testbench.v` – Simulation testbench
- `FSM_Diagram.png` – FSM state diagram
- `Waveform.png` – Simulation waveform
- `RTL.png` – RTL schematic

---

## ▶️ Simulation

1. Open the project in Xilinx Vivado.
2. Add `Traffic_light.v` as the design source.
3. Add `Testbench.v` as the simulation source.
4. Run **Behavioral Simulation**.
5. Observe the traffic light sequence and pedestrian crossing in the waveform.

---

## 🔄 State Transition

```
S0 → S1 → S2 → S3
          │
          ├── Pedestrian Request = 0 → S0
          │
          └── Pedestrian Request = 1 → S4 → S0
```

---

## 🚀 Future Enhancements

- Vehicle density sensors
- Emergency vehicle priority
- Countdown timer using seven-segment display
- Adaptive traffic signal timing
- FPGA implementation with real-time clock divider

---

## 📷 Project Output

Include the following images in this repository:

- FSM State Diagram
- Behavioral Simulation Waveform
- RTL Schematic

---

## 👩‍💻 Author

**Pradnya Yerram**

B.Tech Electronics & Telecommunication Engineering  
Pune Institute of Computer Technology (PICT)

---

## 📄 License

This project is intended for educational and learning purposes.
