clc;
clear all;
close all;

% Load noisy audio (original + noise)
noisyFile = 'noisy_output.wav';//Change according to file address and name
[noisySignal, Fs] = audioread(noisyFile);

% Load noise audio (reference noise)
noiseFile = 'noise.wav';//Change according to file address and name
[noiseSignal, Fs_noise] = audioread(noiseFile);

% Ensure both signals have the same sampling rate
if Fs ~= Fs_noise
    error('Sampling rates of the noisy and noise files must be the same!');
end

% Convert stereo to mono if needed
if size(noisySignal, 2) > 1
    noisySignal = mean(noisySignal, 2);
end
if size(noiseSignal, 2) > 1
    noiseSignal = mean(noiseSignal, 2);
end

% Match lengths of signals
minLen = min(length(noisySignal), length(noiseSignal));
noisySignal = noisySignal(1:minLen);
noiseSignal = noiseSignal(1:minLen);

% Improved LMS Adaptive Filter parameters
mu = 0.1;   % Small step size for better convergence
numTaps = 1024; % Longer filter length for effective noise removal
adaptiveFilter = dsp.LMSFilter('Length', numTaps, 'StepSize', mu, 'Method', 'Normalized LMS');

% Apply LMS filtering
[filteredSignal, errorSignal] = adaptiveFilter(noiseSignal, noisySignal);

% Save the denoised output
outputFile = 'restored_audio.wav';
audiowrite(outputFile, errorSignal, Fs);
disp(['Restored audio saved as: ', outputFile]);

% Plot results
t = (0:minLen-1) / Fs;
figure;
subplot(3,1,1);
plot(t, noisySignal);
title('Noisy Audio (Original + Noise)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, noiseSignal);
title('Reference Noise Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t, errorSignal);
title('Restored Audio (Denoised Output)');
xlabel('Time (s)');
ylabel('Amplitude');

% Play all three audios for comparison
disp('Playing Noisy Audio (Original + Noise)...');
sound(noisySignal, Fs);
pause(length(noisySignal)/Fs + 1);

disp('Playing Reference Noise Audio...');
sound(noiseSignal, Fs);
pause(length(noiseSignal)/Fs + 1);

disp('Playing Restored Audio (Denoised Output)...');
sound(errorSignal, Fs);
pause(length(errorSignal)/Fs + 1);

disp('Playback Complete.');
