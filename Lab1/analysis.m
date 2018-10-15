clc, clear
load('lead120.mat')
load('lead21.mat')
load('lead320.mat')
%% Lead I
t_1 = lead120{:,1};
data_pulse_1 = lead120{:,2};
band_1 = zeros(length(t_1), 1);

figure(1);

title('Lead I')

subplot(4,1,1);
plot(t_1,data_pulse_1);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(4,1,2);
fft_pulse_1 = abs(fft(data_pulse_1/length(t_1)));
f_1 = (0:100/length(fft_pulse_1):100)';
plot(f_1(1:length(f_1)/2 + 1), fft_pulse_1(1:length(fft_pulse_1)/2 + 1));
title('Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(4,1,3);
val_pulse_1 = (fft(data_pulse_1));
band_1(2:3147) = 1;
band_1(3155:end) = 1;
X_pulse_1 = ifft(val_pulse_1.*band_1);
plot(t_1, X_pulse_1);
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

subplot(4,1,4);
auto_3 = xcorr(X_pulse_1);
plot(auto_3/max(auto_3));
title('Auto-correlation')
xlabel('Points') 
ylabel('Auto-correlation') 

R_wave_1 = X_pulse_1.*(X_pulse_1>0.5);
R_1 = [];

for j = 2:length(R_wave_1)-1
    
    if (R_wave_1(j) > R_wave_1(j-1)) && (R_wave_1(j) > R_wave_1(j+1))
        R_1 = [R_1 R_wave_1(j)];
    end
    
end

R_avg_1 = mean(R_1)
R_std_1 = std(R_1)

ST_avg_int_1 = mean([(28.65 - 28.43) (27.88 - 27.67) (27.15 - 26.93) (26.43 - 26.2) (25.69 - 25.47)])
ST_std_int_1 = std([(28.65 - 28.43) (27.88 - 27.67) (27.15 - 26.93) (26.43 - 26.2) (25.69 - 25.47)])


%% Lead II
t_2 = lead21{:,1};
data_pulse_2 = lead21{:,2};
band_2 = zeros(length(t_2), 1);

figure(2);

subplot(4,1,1);
plot(t_2,data_pulse_2);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(4,1,2);
fft_pulse_3 = abs(fft(data_pulse_2/length(t_2)));
f_2 = (0:100/length(fft_pulse_3):100)';
plot(f_2(1:length(f_2)/2 + 1), fft_pulse_3(1:length(fft_pulse_3)/2 + 1));
title('Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(4,1,3);
val_pulse_2 = (fft(data_pulse_2));
band_2(2:3690) = 1;
band_2(3712:end) = 1;
X_pulse_2 = ifft(val_pulse_2.*band_2);
plot(t_2, X_pulse_2);
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

subplot(4,1,4);
auto_2 = xcorr(X_pulse_2);
plot(auto_2/max(auto_2));
title('Auto-correlation')
xlabel('Points') 
ylabel('Auto-correlation') 

R_wave_2 = X_pulse_2.*(X_pulse_2>0.5);
R_2 = [];

for j = 2:length(R_wave_2)-1
    
    if (R_wave_2(j) > R_wave_2(j-1)) && (R_wave_2(j) > R_wave_2(j+1))
         R_2 = [R_2 R_wave_2(j)];
    end
    
end

R_avg_2 = mean(R_2)
R_std_2 = std(R_2)

ST_avg_int_2 = mean([(30.9 - 30.66) (29.98 - 29.74) (29.04 - 28.81) (28.06 - 27.82) (27.1 - 26.86)])
ST_std_int_2 = std([(30.9 - 30.66) (29.98 - 29.74) (29.04 - 28.81) (28.06 - 27.82) (27.1 - 26.86)])

%% Lead III
t_3 = lead320{:,1};
cnt = 0;
data_pulse_3 = lead320{:,2};
band_3 = zeros(length(t_3), 1);

figure(3);

subplot(4,1,1);
plot(t_3,data_pulse_3);
title('Raw Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)')

subplot(4,1,2);
fft_pulse_3 = abs(fft(data_pulse_3/length(t_3)));
f_3 = (0:100/length(fft_pulse_3):100)';
plot(f_3(1:length(f_3)/2 + 1 ), fft_pulse_3(1:length(fft_pulse_3)/2 + 1));
title('Frequency Domain Signal')
xlabel('Frequency (Hz)') 
ylabel('Magnitude') 

subplot(4,1,3);
val_pulse_3 = (fft(data_pulse_3));
band_3(2:1953) = 1;
band_3(2149:end) = 1;
X_pulse_3 =  ifft(val_pulse_3.*band_3);
plot(t_3, X_pulse_3);
title('Filtered Time Domain Signal')
xlabel('Time (s)') 
ylabel('Amplitude (V)') 

subplot(4,1,4);
auto_3 = xcorr(X_pulse_3);
plot(auto_3/max(auto_3));
title('Auto-correlation')
xlabel('Points') 
ylabel('Auto-correlation') 

R_wave_3 = X_pulse_3.*(X_pulse_3>0.15);
R_3 = [];

for j = 2:length(R_wave_3)-1
    
    if (R_wave_3(j) > R_wave_3(j-1)) && (R_wave_3(j) > R_wave_3(j+1))
         R_3 = [R_3 R_wave_3(j)];
    end
    
end

R_avg_3 = mean(R_3)
R_std_3 = std(R_3)

ST_wave_3 = X_pulse_3.*(X_pulse_3<-0.1);

for j = 2:length(ST_wave_3)-1
    
    if (ST_wave_3(j) < ST_wave_3(j-1)) && (ST_wave_3(j) < ST_wave_3(j+1)) && (ST_wave_3(j) < ST_wave_3(j+2)) && (ST_wave_3(j) < ST_wave_3(j-2))
        ST_3(j) = ST_wave_3(j);
    else
        ST_3(j) = 0;
    end
end

 ST_3(19) = 0;
 ST_3(4080) = 0;
 
 ST_interval = [];
 
 for j = 1:length(ST_3)
     if(ST_3(j) < 0 && cnt == 0)
         t_S = j;
         cnt = cnt + 1;
     elseif(ST_3(j) < 0 && cnt == 1)
         ST_interval = [ST_interval (t_3(j) - t_3(t_S))];
         cnt = 0;
     end
 end

 ST_avg_int_3 = mean(ST_interval)
 ST_std_int_3 = std(ST_interval)
 
%% Amplifier
freq = [0.5,1,5,10,15,20,25,30,35,40,50];
diff_mode = [6,8,9.2,8.8,7.6,6.6,5.6,5.2,4.6,4,2.4];
comm_mode = [0.09,0.124,0.132,0.122,0.106,0.094,0.082,0.076,0.066,0.055,0.048];
cmrr = diff_mode./comm_mode;
noise = 0.02;

figure(4);
bar(freq,diff_mode);
title('Differential Mode Gain')
xlabel('Frequency (Hz)') 
ylabel('Magnitude (V)') 

figure(5);
bar(freq,comm_mode);
title('Common Mode Gain')
xlabel('Frequency (Hz)') 
ylabel('Magnitude (V)') 

figure(6);
bar(freq,10*log10((cmrr).^2));
title('Common-Mode Rejection Ratio (CMRR)')
xlabel('Frequency (Hz)') 
ylabel('Ratio (dB)') 
