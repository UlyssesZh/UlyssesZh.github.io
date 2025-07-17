---
title: The buildup kickroll in <cite>Time to beat the odds</cite>
date: 2025-06-22 00:31:43 -0700
categories:
- music
tags:
- fourier transform
- python
layout: post
excerpt: 'There is a gradually-accelerating buildup kickroll at 1:18 in the song <cite>Time to beat the odds</cite> by 影虎。.
In order to know the details of this rhythm, I have to analyze the sample using Python.'
---

<details><summary>Python preamble</summary>

Packages to install from PyPI: `numpy`, `scipy`, `matplotlib`, `soundfile`.

```python
import numpy as np
from scipy.signal import ShortTimeFFT, find_peaks
from scipy.signal.windows import hann
from scipy.optimize import fsolve
from scipy.stats import linregress
import matplotlib.pyplot as plt
from matplotlib.colors import LogNorm
import soundfile
```

</details>

There is a nice song by 影虎。called <cite>Time to beat the odds</cite>:

{% include embed/youtube.html id="C-XxL_LUB18" %}

At 1:18, there is an interesting buildup kickroll.
This effect is created by mixing a steady 32nd note kickroll with a gradually-accelerating buildup kickroll.
The gradually-accelerating part is not quantized to dyadic note values, so it is pretty hard to analyze by ear.

One can obtain a clearer sample of this kickroll by consulting the file
`Dr_KICKroll00.ogg` from the [BMS](https://bmssearch.net/bmses/Lay7qGChaJUgrs).
The waveform of the sample looks like this:

<details><summary>Python code</summary>

```python
samples, fs = soundfile.read("Kagetora_Time-to-beat-the-odds_bofet/Dr_KICKroll00.ogg")
fs /= 1000 # Use ms and kHz
if samples.ndim == 2:
	samples = samples.mean(axis=1)
N = len(samples)

plt.figure(figsize=(10, 6))
plt.plot(np.arange(N) / fs, samples, linewidth=0.5)
plt.xlabel('Time (ms)')
plt.ylabel('Amplitude')
plt.xlim(0, N/fs)
plt.ylim(-1, 1)
```

</details>

![Waveform plot.]({{page.figure}}samples.svg){.dark-adaptive}

There is clearly a repeating pattern that is occurring at an gradually-increasing frequency.
Each occurrence of the pattern is a kick.
The task is to find the regularity of the kicks.

We can see that, at the start of each kick, the waveform is oscillating more rapidly than in later times of the kick.
Therefore, a natural idea is to capture this high-frequency oscillation feature using the short-time Fourier transform (STFT),
and we would expect to see some peaks at the high-frequency region of the spectrogram of the waveform
at each kick occurrence.
SciPy provides a convenient function for STFT, and then we can plot the spectrogram of the waveform:

<details><summary>Python code</summary>

```python
hop = 32
SFT = ShortTimeFFT(hann(hop), hop, fs)
spectrogram = SFT.spectrogram(samples)

plt.figure(figsize=(10, 6))
im = plt.imshow(
	spectrogram,
	aspect='auto',
	origin='lower',
	extent=SFT.extent(N),
	norm=LogNorm(vmin=0.001, vmax=np.max(spectrogram)),
)
plt.xlabel('Time (ms)')
plt.ylabel('Frequency (kHz)')
plt.colorbar(im, label='Magnitude')
```

</details>

![Spectrogram of the kick roll sample.]({{page.figure}}spectrogram.svg){.dark-adaptive}

We can see that there are clearly some peaks at the high-frequency region of the spectrogram.
Pick out the peaks:

<details><summary>Python code</summary>

```python
plt.figure(figsize=(10, 6))
data = spectrogram[14:, :].mean(axis=0)
peaks, peak_properties = find_peaks(data, height=0.004, distance=7)
peaks = peaks * hop / fs
plt.xlabel('Time (ms)')
plt.ylabel('Average magnitude for high frequencies')
plt.plot(SFT.t(N), data)
plt.plot(peaks, peak_properties['peak_heights'], "o")
```
</details>

![Each peak is approximately at the start of a kick.]({{page.figure}}peaks.svg){.dark-adaptive}

To check that those peaks make sense, we can mark the positions of the peaks
on the waveform to see if they are indeed approximately at the start of each kick:

<details><summary>Python code</summary>

```python
plt.figure(figsize=(10, 6))
plt.plot(np.arange(N) / fs, samples)
for peak in peaks:
	plt.axvline(peak, color='red')
plt.xlabel('Time (ms)')
plt.ylabel('Amplitude')
plt.xlim(0, 200)
plt.ylim(-1, 1)
```
</details>

![Waveform with high-frequency spectrogram peaks marked.]({{page.figure}}peaks_on_samples.svg){.dark-adaptive}

We can see that although they are not perfectly at the start of each kick,
the peaks are indeed approximately at the start of each kick.
Now, plot the time intervals between each pair of consecutive peaks.
If the plot is in log-scale, one can see that they approximately form a straight line,
which means that the time intervals decay geometrically.
We can use a simple linear regression to fit the data.

<details><summary>Python code</summary>

```python
fig, ax = plt.subplots(figsize=(10, 6))
ax.set_yscale('log')
intervals = np.diff(peaks)
indices = np.arange(len(intervals))
lin_res = linregress(indices, np.log(intervals))
ax.plot(indices, intervals, 'o')
ax.plot(indices, np.exp(lin_res.intercept + lin_res.slope * indices))
ax.set_xlabel('Kick')
ax.set_ylabel('Interval (ms)')
```

</details>

![Intervals between consecutive peaks.]({{page.figure}}intervals.svg){.dark-adaptive}

With the linear regression, we can conclude that the decay ratio is $0.9762$.

If we had guessed that the time intervals decay geometrically
and that the first kick has the length of a 32nd note,
we could calculate the decay ratio $a$ by solving the equation
$$\fr18\p{1-a^{59}}=4\p{1-a},$$
where $1/8$ is the note value of a 32nd note,
and $4$ is the total note value of this kickroll (a measure with $4$ quarter notes),
and $59$ is the total number of kicks (obtained by counting the patterns in the waveform).
Solving this equation numerically gives us $a=0.9764$, which is pretty close to the value we got before.
