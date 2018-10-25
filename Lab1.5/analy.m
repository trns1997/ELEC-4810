clc, clear
load('part1.mat')
load('part2.mat')
load('part3.mat')

%% Part1
t_1 = part110{:,1};
data_pulse_1 = part110{:,2};
band_1 = zeros(length(t_1), 1);

figure(1);

subplot(3,1,1);
plot(t_1,data_pulse_1);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(3,1,2);
fft_pulse_3 = abs(fft(data_pulse_1/length(t_1)));
f_1 = (0:500/length(fft_pulse_3):500)';
plot(f_1(1:length(f_1)/2 + 1), fft_pulse_3(1:length(fft_pulse_3)/2 + 1));
title('Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(3,1,3);
val_pulse_3 = (fft(data_pulse_1));
band_1(2:794) = 1;
band_1(814:end/2 - 1) = 1;
band_1(end/2 + 1:7188) = 1;
band_1(7208:end) = 1;
X_pulse_3 = ifft(val_pulse_3.*band_1);
plot(t_1, X_pulse_3);
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

%% Part 2
t_3 = part210{:,1};
data_pulse_3 = part210{:,2};
band_3 = zeros(length(t_3), 1);

figure(2);

subplot(3,1,1);
plot(t_3,data_pulse_3);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(3,1,2);
fft_pulse_3 = abs(fft(data_pulse_3/length(t_3)));
f_3 = (0:500/length(fft_pulse_3):500)';
plot(f_3(1:length(f_3)/2 + 1), fft_pulse_3(1:length(fft_pulse_3)/2 + 1));
title('Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(3,1,3);
val_pulse_3 = (fft(data_pulse_3));
band_3(2:1256-10) = 1;
band_3(1256+10:end/2 - 1) = 1;
band_3(end/2 + 1:11250-10) = 1;
band_3(11250+10:end) = 1;
X_pulse_3 = ifft(val_pulse_3.*band_3);
plot(t_3, X_pulse_3);
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

%% Part 3
t_3 = part310{:,1};
data_pulse_3 = part310{:,2};
band_3 = zeros(length(t_3), 1);

figure(3);

subplot(4,1,1);
plot(t_3,data_pulse_3);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(4,1,2);
fft_pulse_3 = abs(fft(data_pulse_3/length(t_3)));
f_3 = (0:500/length(fft_pulse_3):500)';
plot(f_3(1:length(f_3)/2 + 1), fft_pulse_3(1:length(fft_pulse_3)/2 + 1));
title('Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(4,1,3);
val_pulse_3 = (fft(data_pulse_3));
band_3(2:1256-10) = 1;
band_3(1256+10:end/2 - 1) = 1;
band_3(end/2 + 1:11250-10) = 1;
band_3(11250+10:end) = 1;
X_pulse_3 = real(ifft(val_pulse_3.*band_3));
plot(t_3, X_pulse_3);
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

subplot(4,1,4);
y = RMS(X_pulse_3, 3550, 0, 0);
num = ones(1,3550);
val = [];
for i = 1:length(y)
    val = [val, y(i)*num];
end

plot(t_3,smooth(val, 3550*0.75));
title('Averaged')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 
