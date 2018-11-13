clc, clear
load('part4.mat')
load('data0.mat')
load('part1.mat')
%% Part_1
figure(1);
plot(part1_data(:,1), part1_data(:,2), 'o')
hold on
plot(part1_data(:,1), 0.04*part1_data(:,1))
set (gca, 'xdir', 'reverse')
legend('measured data', 'line of best fit: y = 0.04*x')
title('Output voltage after calibration')
xlabel('Cuff pressure (mmHg)') 
ylabel('DC value (V)')

%% Part_2

t_2 = data0{:,1};
data_pulse_2 = data0{:,3};

figure(2);

subplot(3,1,1);
plot(t_2, data_pulse_2);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(3,1,2);
fft_pulse_2 = abs(fft(data_pulse_2/length(t_2)));
f_2 = (0:100/length(fft_pulse_2):100)';
plot(f_2(1:length(f_2)/2 + 1), fft_pulse_2(1:length(fft_pulse_2)/2 + 1));
title('Frequency Domain Signal of Pulse')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(3,1,3);
auto_2 = xcorr(data_pulse_2);
plot(auto_2/max(auto_2));
title('Auto-correlation')
xlabel('Points') 
ylabel('Auto-correlation') 

beat_rate_2 = [(1.83-0.83), (2.91-1.83), (3.92-2.91), (5.01-3.92), (6.03-5.01)];
mean(beat_rate_2)
amplitude_2 = [2.643, 2.953, 2.47, 2.699, 2.581];
mean(amplitude_2)


%% Part_4
t_1 = part4deflate1{:,1};
data_pulse_1 = part4deflate1{:,2};
data_pulse_2 = part4deflate1{:,3};

figure(3);

subplot(3,1,1);
plot(t_1, data_pulse_1);
hold on
plot(t_1, data_pulse_2);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(3,1,2);
fft_pulse_1 = abs(fft(data_pulse_2/length(t_1)));
f_1 = (0:100/length(fft_pulse_1):100)';
plot(f_1(1:length(f_1)/2 + 1), fft_pulse_1(1:length(fft_pulse_1)/2 + 1));
title('Frequency Domain Signal of Pulse')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 
   
subplot(3,1,3);
fft_pulse_1 = abs(fft(data_pulse_1/length(t_1)));
f_1 = (0:100/length(fft_pulse_1):100)';
plot(f_1(1:length(f_1)/2 + 1), fft_pulse_1(1:length(fft_pulse_1)/2 + 1));
title('Frequency Domain Signal of Pressure')
xlabel('Frequency (Hz)') 
ylabel('Magnitude')

beat_rate_1 = [(117.8-117.1), (118.5-117.8), (119.2-118.5), (120-119.2), (120.7-120)];
mean(beat_rate_1)

