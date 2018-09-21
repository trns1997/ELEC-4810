clc, clear
load('led_data.mat')
load('muscle_data.mat')
load('pulse_data.mat')
%% Pulse
t = pulse(2500:4999,1,:) -  24.9900;
f = 0:0.04:100;
data_pulse = pulse(2500:4999,2,:);

mean_pulse = mean(data_pulse)*ones(1,length(t));
mean_sq_pulse = mean(data_pulse.^2)*ones(1,length(t));
var_pulse = var(data_pulse)*ones(1,length(t));

[p_pulse, x_pulse] = ksdensity(data_pulse);

[f_pulse, x1_pulse] = hist(data_pulse);

fft_pulse = abs(fft(data_pulse/length(t)));

figure(1);

subplot(5,1,1);
plot(t,data_pulse);
hold on;
plot(t,mean_pulse);
plot(t,mean_sq_pulse);
plot(t, var_pulse);
legend('a) Raw','b) Mean', 'b) Mean square', 'b) Variance')
title('a) Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude')

subplot(5,1,3);
hold on;
bar(x1_pulse,f_pulse/trapz(x1_pulse,f_pulse));
plot(x_pulse, p_pulse, 'r');
title('d) PDF')
ylabel('Frequency') 

subplot(5,1,2);
plot(f(1:2500/2), fft_pulse(1:end/2));
title('c) Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(5,1,5);
val_pulse = (fft(data_pulse));
X_pulse = ifft(cat(1, val_pulse(1:895), val_pulse(1607:end)));
plot(X_pulse);
title('h) Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude') 

subplot(5,1,4);
plot(0:0.01:49.98, xcorr(data_pulse))
title('e) Auto-correlation')
xlabel('Time (s)') 
ylabel('Auto-correlation') 
%% Muscle 
t = muscle_data(5550:7219,1,:) - 11.0980;
f = 0:(500/1670):500;
data_muscle = muscle_data(5550:7219,2,:);
mean_muscle = mean(data_muscle)*ones(1,length(t));
mean_sq_muscle = mean(data_muscle.^2)*ones(1,length(t));
var_muscle = var(data_muscle)*ones(1,length(t));

[p_muscle, x_muscle] = ksdensity(data_muscle);

[f_muscle, x1_muscle] = hist(data_muscle);

fft_muscle = abs(fft(data_muscle/length(t)));

figure(2);

subplot(5,1,1);
plot(t,data_muscle);
hold on;
plot(t,mean_muscle);
plot(t,mean_sq_muscle);
plot(t, var_muscle);
legend('a) Raw','b) Mean', 'b) Mean square', 'b) Variance')
title('a) Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude')

subplot(5,1,3);
hold on;
bar(x1_muscle,f_muscle/trapz(x1_muscle,f_muscle));
plot(x_muscle, p_muscle,'r');
title('d) PDF')
ylabel('Frequency') 

subplot(5,1,2);
plot(f(1:1670/2), fft_muscle(1:end/2));
title('c) Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(5,1,5);
val_muscle = (fft(data_muscle));
X_muscle = ifft(cat(1, val_muscle(1:167), val_muscle(169:835), val_muscle(836:1503), val_muscle(1505:end)));
plot(X_muscle);
title('h) Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude') 

subplot(5,1,4);
plot(0:0.002:6.6760, xcorr(data_muscle))
title('e) Auto-correlation')
xlabel('Time (s)') 
ylabel('Auto-correlation') 
%% LED
t = led(2500:4999,1,:) -  24.9900;
f = 0:0.04:100;
data_led = led(2500:4999,2,:);
mean_led = mean(data_led)*ones(1,length(t));
mean_sq_led = mean(data_led.^2)*ones(1,length(t));
var_led = var(data_led)*ones(1,length(t));

[p_led, x_led] = ksdensity(data_led);

[f_led, x1_led] = hist(data_led);

fft_pulse = abs(fft(data_led/length(t)));

figure(3);

subplot(5,1,1);
plot(t,data_led);
hold on;
plot(t,mean_led);
plot(t,mean_sq_led);
plot(t, var_led);
legend('a) Raw','b) Mean', 'b) Mean square', 'b) Variance')
title('a) Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude')

subplot(5,1,3);
hold on;
bar(x1_led,f_led/trapz(x1_led,f_led));
plot(x_led, p_led, 'r');
title('d) PDF')
ylabel('Frequency') 

subplot(5,1,2);
plot(f(1:2500/2), fft_pulse(1:end/2));
title('c) Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(5,1,5);
val_led = (fft(data_led));
X_led = ifft(cat(1, val_led(1:895), val_led(1607:end)));
plot(X_led);
title('h) Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude') 

subplot(5,1,4);
plot(0:0.01:49.98, xcorr(data_led))
title('e) Auto-correlation')
xlabel('Time (s)') 
ylabel('Auto-correlation') 
