clc, clear
load('part1.mat')
load('part2.mat')
load('part3.mat')

%% Part1
t_1 = part110{:,1};
data_pulse_1 = part110{:,2};
band_1 = zeros(length(t_1), 1);

figure(1);

subplot(4,1,1);
plot(t_1,data_pulse_1);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(4,1,2);
fft_pulse_1 = abs(fft(data_pulse_1/length(t_1)));
f_1 = (0:500/length(fft_pulse_1):500)';
plot(f_1(1:length(f_1)/2 + 1), fft_pulse_1(1:length(fft_pulse_1)/2 + 1));
title('Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(4,1,3);
val_pulse_1 = (fft(data_pulse_1));
band_1(2:794) = 1;
band_1(814:end/2 - 1) = 1;
band_1(end/2 + 1:7188) = 1;
band_1(7208:end) = 1;
X_pulse_1 = ifft(val_pulse_1.*band_1);
plot(t_1, X_pulse_1);
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

subplot(4,1,4);
y_1 = RMS(X_pulse_1, 80, 0, 0);
num_1 = ones(1,80);
val_1 = [];
for i = 1:length(y_1)
    val_1 = [val_1, y_1(i)*num_1];
end

plot(t_1,smooth(val_1, 80*0.75));
title('Root Mean Square (RMS)')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

%% Part 2
t_2 = part210{:,1};
data_pulse_2 = part210{:,2};
band_2 = zeros(length(t_2), 1);

figure(2);

subplot(4,1,1);
plot(t_2,data_pulse_2);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(4,1,2);
fft_pulse_2 = abs(fft(data_pulse_2/length(t_2)));
f_2 = (0:500/length(fft_pulse_2):500)';
plot(f_2(1:length(f_2)/2 + 1), fft_pulse_2(1:length(fft_pulse_2)/2 + 1));
title('Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(4,1,3);
val_pulse_2 = (fft(data_pulse_2));
band_2(2:1256-10) = 1;
band_2(1256+10:end/2 - 1) = 1;
band_2(end/2 + 1:11250-10) = 1;
band_2(11250+10:end) = 1;
X_pulse_2 = real(ifft(val_pulse_2.*band_2));
plot(t_2, X_pulse_2);
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

subplot(4,1,4);
y_2 = RMS(X_pulse_2, 125, 0, 0);
num_2 = ones(1,125);
val_2 = [];
for i = 1:length(y_2)
    val_2 = [val_2, y_2(i)*num_2];
end

plot(t_2,smooth(val_2, 125*0.75));
title('Root Mean Square (RMS)')
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
y_3 = RMS(X_pulse_3, 3550, 0, 0);
num_3 = ones(1,3550);
val_3 = [];
for i = 1:length(y_3)
    val_3 = [val_3, y_3(i)*num_3];
end

plot(t_3,smooth(val_3, 3550*0.75));
title('Root Mean Square (RMS)')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 


d = data_pulse_3(5001:2*5001);
meanfreq(d)
medfreq(d)