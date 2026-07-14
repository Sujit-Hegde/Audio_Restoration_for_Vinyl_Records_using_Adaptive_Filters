# Audio_Restoration_for_Vinyl_Records_using_Adaptive_Filters

A MATLAB-based Digital Signal Processing (DSP) project that restores noisy vinyl recordings using the **Least Mean Squares (LMS) Adaptive Filtering Algorithm**. The system effectively suppresses background noise such as hum, hiss, and crackling while preserving the original audio quality.

---

## Project Overview

Vinyl records produce warm and natural audio, but over time they accumulate unwanted noise caused by:

- Dust particles
- Surface scratches
- Mechanical wear
- Electrical hum
- Background interference
- Analog recording imperfections

Conventional filters cannot effectively remove these noises because they often overlap with the desired audio spectrum. This project addresses the problem using an **Adaptive LMS Filter**, which continuously learns the characteristics of the noise and removes it without significantly affecting the original audio signal.

Unlike fixed digital filters, adaptive filters dynamically update their coefficients based on the incoming signal, making them suitable for non-stationary noise environments commonly found in vinyl recordings.

---

# Objectives

The primary objectives of this project are:

- Restore degraded vinyl recordings.
- Reduce background noise while preserving music quality.
- Implement an adaptive filtering algorithm in MATLAB.
- Demonstrate the practical application of Digital Signal Processing.
- Compare noisy and restored audio using waveform visualization.
- Produce a high-quality restored audio output.

---

# Features

- Adaptive noise cancellation
- LMS (Least Mean Squares) filtering
- Automatic preprocessing of audio signals
- Stereo-to-mono conversion
- Sampling rate verification
- Signal length synchronization
- Time-domain waveform visualization
- Audio playback comparison
- Export restored audio as WAV format

---

# Digital Signal Processing Concepts Used

This project applies several DSP concepts:

- Digital Audio Processing
- Adaptive Signal Processing
- Least Mean Squares (LMS) Algorithm
- Normalized LMS Adaptive Filter
- Noise Cancellation
- FIR Adaptive Filtering
- Error Minimization
- Audio Signal Preprocessing
- Waveform Analysis

---

# Theory

## Why Adaptive Filters?

A conventional FIR or IIR filter has fixed coefficients.

If the noise characteristics change over time, a fixed filter cannot adapt, resulting in poor restoration.

Adaptive filters solve this problem by continuously updating their filter coefficients during operation.

Advantages include:

- Real-time adaptation
- Better noise suppression
- Automatic coefficient adjustment
- Suitable for unknown environments

---

# Least Mean Squares (LMS) Algorithm

The LMS algorithm is one of the most widely used adaptive filtering algorithms because of its:

- Simple implementation
- Low computational complexity
- Fast convergence
- Good stability

The algorithm minimizes the **Mean Squared Error (MSE)** between the desired signal and the filter output.

---

## Mathematical Model

Let

```
d(n) = Desired Signal
x(n) = Reference Noise
y(n) = Estimated Noise
e(n) = Error Signal
w(n) = Filter Coefficients
```

The adaptive filter estimates

```
y(n)=w(n)^T x(n)
```

The error signal becomes

```
e(n)=d(n)-y(n)
```

The filter coefficients are updated using

```
w(n+1)=w(n)+μ e(n)x(n)
```

where

- μ = Learning rate (Step size)

The error signal gradually converges toward the clean audio signal.

---

# Normalized LMS (NLMS)

The MATLAB implementation uses the **Normalized LMS (NLMS)** method.

Unlike standard LMS,

NLMS automatically scales the step size according to the signal power.

This improves

- Faster convergence
- Better numerical stability
- Improved noise cancellation
- Reduced divergence

---

# Algorithm Workflow

```
Input Noisy Audio
        │
        ▼
Load Reference Noise
        │
        ▼
Check Sampling Rates
        │
        ▼
Stereo → Mono Conversion
        │
        ▼
Signal Length Matching
        │
        ▼
Initialize LMS Filter
        │
        ▼
Adaptive Weight Update
        │
        ▼
Estimate Noise
        │
        ▼
Subtract Noise
        │
        ▼
Generate Restored Audio
        │
        ▼
Save WAV File
        │
        ▼
Plot Waveforms
        │
        ▼
Playback Comparison
```

---

# Working Principle

## Step 1

The system loads

- Noisy Vinyl Audio
- Reference Noise Signal

Both signals are read using

```matlab
audioread()
```

---

## Step 2

Preprocessing

The algorithm ensures

- Equal sampling rates
- Equal signal length
- Mono audio

Stereo signals are converted into mono using

```matlab
mean(signal,2)
```

This ensures accurate adaptive filtering.

---

## Step 3

Adaptive Filter Initialization

The filter is initialized using

```matlab
adaptiveFilter = dsp.LMSFilter(...)
```

Parameters include

- Filter Length
- Step Size
- Adaptive Method

Example

```matlab
Length = 1024

Step Size = 0.1

Method = Normalized LMS
```

---

## Step 4

Noise Estimation

The reference noise passes through the adaptive filter.

The filter continuously estimates

```
Estimated Noise
```

that exists inside the noisy recording.

---

## Step 5

Coefficient Update

After every sample

```
Error = Desired − Estimated
```

The coefficients are updated automatically using

```
w(n+1)=w(n)+μe(n)x(n)
```

The filter gradually learns the noise characteristics.

---

## Step 6

Noise Cancellation

The estimated noise is subtracted from

```
Noisy Audio
```

to obtain

```
Restored Audio
```

---

## Step 7

Visualization

Three waveforms are displayed

- Noisy Audio
- Reference Noise
- Restored Audio

using

```matlab
plot()
```

This allows visual comparison of restoration performance.

---

## Step 8

Playback

MATLAB sequentially plays

1. Noisy Audio

2. Reference Noise

3. Restored Audio

using

```matlab
sound()
```

allowing subjective evaluation.

---

# MATLAB Functions Used

| Function | Purpose |
|----------|----------|
| audioread() | Read audio file |
| audiowrite() | Save restored audio |
| dsp.LMSFilter() | Adaptive filtering |
| plot() | Signal visualization |
| sound() | Audio playback |
| mean() | Stereo to mono conversion |
| subplot() | Multiple waveform display |
| pause() | Delay playback |

---

# Input Files

```
noise.wav
```

Reference noise signal.

```
noisy_output.wav
```

Vinyl recording containing music and noise.

---

# Output

```
restored_audio.wav
```

Noise-reduced audio generated after adaptive filtering.

---

# Project Structure

```
Audio-Restoration/

│── Vinyl.m

│── noisy_output.wav

│── noise.wav

│── restored_audio.wav

│── README.md
```

---

# Time Complexity

For

```
N = Samples

M = Filter Length
```

The computational complexity is

```
O(N × M)
```

Since every incoming sample updates all filter coefficients.

---

# Space Complexity

```
O(M)
```

Only filter coefficients and temporary buffers are stored.

---

# Advantages

- Removes varying noise effectively
- Better than fixed filters
- Easy MATLAB implementation
- Preserves original music
- Automatic learning
- Real-time capable
- Low computational complexity

---

# Limitations

- Requires a good reference noise signal.
- Improper step size may slow convergence.
- Large filter lengths increase computation time.
- Performance depends on correlation between reference noise and actual noise.

---

# Future Improvements

- Recursive Least Squares (RLS) Adaptive Filter
- Wiener Filtering
- Deep Learning Audio Denoising
- Wavelet Transform Based Restoration
- Spectral Subtraction
- Hybrid Adaptive Filtering
- Real-Time FPGA Implementation
- Embedded DSP Processor Deployment

---

# Applications

- Vinyl Record Restoration
- Audio Archiving
- Podcast Noise Reduction
- Music Production
- Broadcast Engineering
- Speech Enhancement
- Hearing Assistive Systems
- Digital Audio Processing Research

---

# Results

The adaptive LMS filter successfully reduces background noise while preserving the original audio content. The restored signal exhibits significantly lower noise levels compared to the input recording. Waveform analysis and audio playback demonstrate the effectiveness of adaptive filtering for restoring old vinyl recordings. :contentReference[oaicite:2]{index=2}

---

# Technologies Used

- MATLAB
- DSP System Toolbox
- LMS Adaptive Filter
- Digital Signal Processing
- WAV Audio Processing

---

# References

1. Simon Haykin – *Adaptive Filter Theory*

2. John G. Proakis – *Digital Signal Processing*

3. MATLAB DSP System Toolbox Documentation

4. Least Mean Squares Adaptive Filtering Literature

---
