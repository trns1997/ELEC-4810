clc, clear
load('wk.mat')
%%
t_1 = data_1{:,1};
DC_1_1 = data_1{:,2};
DC_2_1 = data_1{:,3};
AC_1_1 = data_1{:,4};
AC_2_1 = data_1{:,5};

SO2_1 = mean(AC_2_1)/mean(AC_1_1)

figure(1);

subplot(3,1,1)
plot(t_1, DC_1_1)
hold on
plot(t_1, DC_2_1)
plot(t_1, AC_1_1)
plot(t_1, AC_2_1)
legend('DC_{ir} signal', 'DC_{red} signal', 'AC_{ir} signal', 'AC_{red} signal')

title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(3,1,2)
fft_AC_1_1 = abs(fft(AC_1_1/length(t_1)));
f_AC_1_1 = (0:100/length(fft_AC_1_1):100)';
plot(f_AC_1_1(1:length(f_AC_1_1)/2 + 1), fft_AC_1_1(1:length(fft_AC_1_1)/2 + 1));
hold on;
fft_AC_2_1 = abs(fft(AC_2_1/length(t_1)));
f_AC_1_2 = (0:100/length(fft_AC_2_1):100)';
plot(f_AC_1_2(1:length(f_AC_1_2)/2 + 1), fft_AC_2_1(1:length(fft_AC_2_1)/2 + 1));
legend('AC_{ir} signal', 'AC_{red} signal')
title('Frequency Domain AC Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

band_1 = zeros(length(t_1), 1);
band_1(2:670) = 1;
band_1(6932:end) = 1;

subplot(3,1,3);
val_pulse_1_1 = (fft(AC_1_1));
X_pulse_1_1 = ifft(val_pulse_1_1.*band_1);
plot(t_1, X_pulse_1_1);
hold on;
val_pulse_2_1 = (fft(AC_2_1));
X_pulse_2_1 = ifft(val_pulse_2_1.*band_1);
plot(t_1, X_pulse_2_1);
legend('AC_{ir} signal', 'AC_{red} signal')
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 
%%
t_2 = data_2{:,1};
DC_1_2 = data_2{:,2};
DC_2_2 = data_2{:,3};
AC_1_2 = data_2{:,4};
AC_2_2 = data_2{:,5};

SO2_2 = mean(AC_2_2)/mean(AC_1_2)

figure(2);

subplot(3,1,1)
plot(t_2, DC_1_2)
hold on
plot(t_2, DC_2_2)
plot(t_2, AC_1_2)
plot(t_2, AC_2_2)
legend('DC_{ir} signal', 'DC_{red} signal', 'AC_{ir} signal', 'AC_{red} signal')

title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(3,1,2)
fft_AC_1_2 = abs(fft(AC_1_2/length(t_2)));
f_AC_1_2 = (0:100/length(fft_AC_1_2):100)';
plot(f_AC_1_2(1:length(f_AC_1_2)/2 + 1), fft_AC_1_2(1:length(fft_AC_1_2)/2 + 1));
hold on;
fft_AC_2_2 = abs(fft(AC_2_2/length(t_2)));
f_AC_2_2 = (0:100/length(fft_AC_2_2):100)';
plot(f_AC_2_2(1:length(f_AC_2_2)/2 + 1), fft_AC_2_2(1:length(fft_AC_2_2)/2 + 1));
legend('AC_{ir} signal', 'AC_{red} signal')
title('Frequency Domain AC Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

band_2 = zeros(length(t_2), 1);
band_2(2:379) = 1;
band_2(3923:end) = 1;

subplot(3,1,3);
val_pulse_1_2 = (fft(AC_1_2));
X_pulse_1_2 = ifft(val_pulse_1_2.*band_2);
plot(t_2, X_pulse_1_2);
hold on;
val_pulse_2_2 = (fft(AC_2_2));
X_pulse_2_2 = ifft(val_pulse_2_2.*band_2);
plot(t_2, X_pulse_2_2);
legend('AC_{ir} signal', 'AC_{red} signal')
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')