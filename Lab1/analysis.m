clc, clear
load('lead120.mat')
load('lead21.mat')
load('lead320.mat')
%% Lead I
t_1 = lead120{:,1};
data_pulse_1 = lead120{:,2};
band_1 = zeros(length(t_1), 1);

figure(1);

subplot(3,1,1);
plot(t_1,data_pulse_1);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(3,1,2);
fft_pulse_1 = abs(fft(data_pulse_1/length(t_1)));
f_1 = (0:100/length(fft_pulse_1):100)';
plot(f_1(1:length(f_1)/2 + 1), fft_pulse_1(1:length(fft_pulse_1)/2 + 1));
title('Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(3,1,3);
val_pulse_1 = (fft(data_pulse_1));
band_1(2:3147) = 1;
band_1(3155:end) = 1;
X_pulse_1 = ifft(val_pulse_1.*band_1);
plot(t_1, X_pulse_1);
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

%% Lead II
t_2 = lead21{:,1};
data_pulse_2 = lead21{:,2};
band_2 = zeros(length(t_2), 1);

figure(2);

subplot(3,1,1);
plot(t_2,data_pulse_2);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(3,1,2);
fft_pulse_3 = abs(fft(data_pulse_2/length(t_2)));
f_2 = (0:100/length(fft_pulse_3):100)';
plot(f_2(1:length(f_2)/2 + 1), fft_pulse_3(1:length(fft_pulse_3)/2 + 1));
title('Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(3,1,3);
val_pulse_2 = (fft(data_pulse_2));
band_2(2:3690) = 1;
band_2(3712:end) = 1;
X_pulse_2 = ifft(val_pulse_2.*band_2);
plot(t_2, X_pulse_2);
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

%% Lead III
t_3 = lead320{:,1};
data_pulse_3 = lead320{:,2};
band_3 = zeros(length(t_3), 1);

figure(3);

subplot(3,1,1);
plot(t_3,data_pulse_3);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(3,1,2);
fft_pulse_3 = abs(fft(data_pulse_3/length(t_3)));
f_3 = (0:100/length(fft_pulse_3):100)';
plot(f_3(1:length(f_3)/2 + 1 ), fft_pulse_3(1:length(fft_pulse_3)/2 + 1));
title('Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(3,1,3);
val_pulse_3 = (fft(data_pulse_3));
band_3(2:1953) = 1;
band_3(2149:end) = 1;
X_pulse_3 =  ifft(val_pulse_3.*band_3);
plot(t_3, X_pulse_3);
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 
