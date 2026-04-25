# Fibonacci-Controlled Multi-Path Ring Oscillator TRNG

## 📌 Overview
This project presents a **True Random Number Generator (TRNG)** based on a **Fibonacci-controlled multi-path ring oscillator architecture**. The design improves randomness quality by reducing temporal correlations and increasing entropy using dynamic path selection.

Unlike conventional ring oscillator TRNGs, this approach introduces:
- Multi-path oscillator configurations
- Fibonacci-based path selection
- Adaptive sampling mechanism
- XOR-based entropy enhancement

---

## 🎯 Motivation
Random numbers are critical in:
- Cryptography (keys, encryption, authentication)
- Secure communication
- Embedded systems security

Traditional ring oscillator TRNGs suffer from:
- Low entropy
- Correlated outputs
- Predictable patterns

This project addresses these limitations using **non-deterministic path selection and jitter diversity**.

---

## 🧠 Key Concepts

### 1. Ring Oscillator
A ring oscillator consists of an odd number of inverters connected in a loop. It generates oscillations based on propagation delay.

- Frequency depends on:
  - Number of inverter stages
  - Propagation delay
- Randomness source: **timing jitter** (thermal noise, voltage variation)

---

### 2. Multi-Path Architecture
Instead of a single oscillator, multiple oscillator paths are used:

| Path | Number of Inverters |
|------|--------------------|
| P1   | 3                  |
| P2   | 5                  |
| P3   | 7                  |
| P4   | 9                  |

Each path produces different frequencies → **higher entropy**

---

### 3. Fibonacci-Based Path Selection
Oscillator paths are selected dynamically using a Fibonacci sequence:

1, 1, 2, 3, 5, 8, ...

- Prevents deterministic behavior
- Introduces temporal randomness
- Reduces correlation between outputs

---

### 4. XOR Entropy Combiner
Outputs from selected oscillators are combined using XOR:

Random Output = RO1 ⊕ RO2 ⊕ ... ⊕ ROn

- Enhances randomness
- Mixes independent jitter sources

---

### 5. Adaptive Sampling
Sampling intervals follow Fibonacci timing instead of fixed clock:

- Reduces sampling correlation
- Improves unpredictability

---

## ⚙️ Algorithm

1. Initialize system clock and oscillator bank  
2. Generate oscillations using multiple ring oscillators  
3. Organize oscillators into multiple paths  
4. Select path using Fibonacci sequence  
5. Extract outputs from selected oscillators  
6. Apply XOR operation  
7. Sample output using adaptive timing  
8. Store as random bit  
9. Repeat until required bitstream is generated  

---

## 📊 Results

| Parameter            | Sequence 1 | Sequence 2 | Sequence 3 |
|---------------------|------------|------------|------------|
| Total Bits          | 996        | 992        | 717        |
| Mean                | 0.3614     | 0.3569     | 0.7225     |
| Zeros               | 636        | 638        | 199        |
| Ones                | 360        | 354        | 518        |
| Shannon Entropy     | 0.9439     | 0.9400     | 0.8521     |

### Observations:
- High entropy (close to 1)
- Some bias present (expected in simulation)
- Non-periodic and non-deterministic outputs

---

## 📈 Advantages

✅ Increased entropy  
✅ Reduced temporal correlation  
✅ No complex post-processing required  
✅ Hardware-efficient design  
✅ Suitable for FPGA and embedded systems  

---

## ⚠️ Limitations

- Simulation shows slight bias
- Limited dataset size
- Full performance visible only in hardware implementation

---

## 🚀 Future Work

- FPGA implementation
- Larger dataset testing
- NIST SP 800-22 validation
- Bias reduction techniques
- Optimization for real-time cryptographic systems



---

## 👨‍💻 Authors
  
- Shreya Ranjitha M  
- Mridula B
- Somesh T G
- Akshath Palanikumaran  

---

