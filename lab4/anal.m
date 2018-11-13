clc, clear
load('workspc.mat')
%% Part d
figure(1);

t_d = d10{:,1};
data_DC_d = d10{:,2};
data_AC_d = d10{:,3};

subplot(3,1,1)
plot(t_d, data_AC_d);
hold on; 
plot(t_d, data_DC_d);
legend('AC signal', 'DC signal')

title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(3,1,2)
fft_AC_d = abs(fft(data_AC_d/length(t_d)));
f_AC_d = (0:100/length(fft_AC_d):100)';
plot(f_AC_d(1:length(f_AC_d)/2 + 1), fft_AC_d(1:length(fft_AC_d)/2 + 1));
title('Frequency Domain AC Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(3,1,3)
auto_1 = xcorr(data_AC_d);
plot(auto_1/max(auto_1));
title('Auto-correlation')
xlabel('Points') 
ylabel('Auto-correlation') 

beat = [(6.64-5.42),(5.41-4.27),(4.27-3.06),(3.06-1.93)];
mean_beat = mean(beat)
mean_amp = (2.058 -(-2.801))

%% Part g
figure(2);

t_g = g0{:,1};
data_DC_g = g0{:,2};
data_AC_g = g0{:,3};

subplot(2,1,1)
plot(t_g, data_AC_g);
hold on; 
plot(t_g, data_DC_g);
legend('AC signal', 'DC signal')

title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(2,1,2)
fft_AC_g = abs(fft(data_AC_g/length(t_g)));
f_AC_g = (0:100/length(fft_AC_g):100)';
plot(f_AC_g(1:length(f_AC_g)/2 + 1), fft_AC_g(1:length(fft_AC_g)/2 + 1));
title('Frequency Domain AC Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

%% Part i
figure(3);

t_i = i0{:,1};
data_DC_i = i0{:,2};
data_AC_i = i0{:,3};

subplot(2,1,1)
plot(t_i, data_AC_i);
hold on; 
plot(t_i, data_DC_i);
legend('AC signal', 'DC signal')

title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(2,1,2)
fft_AC_i = abs(fft(data_AC_i/length(t_i)));
f_AC_i = (0:100/length(fft_AC_i):100)';
plot(f_AC_i(1:length(f_AC_i)/2 + 1), fft_AC_i(1:length(fft_AC_i)/2 + 1));
title('Frequency Domain AC Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

%% Part 3
figure(4);

t_3 = p3{:,1};
data_3_1 = p3{:,2};
data_3_2 = p3{:,3};
band_3 = zeros(length(t_3), 1);

subplot(4,1,1)
plot(t_3, data_3_1);
hold on; 
plot(t_3, data_3_2);
legend('ECG signal', 'PPG signal')

title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(4,1,2)
fft_3_1 = abs(fft(data_3_1/length(t_3)));
f_3_1 = (0:100/length(fft_3_1):100)';
plot(f_3_1(1:length(f_3_1)/2 + 1), fft_3_1(1:length(fft_3_1)/2 + 1));
title('Frequency Domain ECG Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude')

subplot(4,1,3)
fft_3_2 = abs(fft(data_3_2/length(t_3)));
f_3_2 = (0:100/length(fft_3_2):100)';
plot(f_3_2(1:length(f_3_2)/2 + 1), fft_3_2(1:length(fft_3_2)/2 + 1));
title('Frequency Domain PPG Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude')

subplot(4,1,4);
val_pulse_3 = (fft(data_3_1));
band_3(2:1161) = 1; %1140
band_3(3141:end) = 1; %1462
X_pulse_3 = ifft(val_pulse_3.*band_3);
plot(t_3, X_pulse_3);
hold on;
plot(t_3, data_3_2 - mean(data_3_2));
legend('ECG signal', 'PPG signal')
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

dt_1 = [(8.17-7.8),(6.99-6.64),(5.77-5.4),(4.63-4.28),(3.44-3.08)];
mean_dt_1 = mean(dt_1)
vel_1 = 0.9/mean_dt_1

dt_2 = [(7.12-6.83),(6.46-6.05),(5.53-5.25)];
mean_dt_2 = mean(dt_2)
vel_2 = 0.8/mean_dt_2