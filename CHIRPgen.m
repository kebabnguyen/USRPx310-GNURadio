%% SINGLE BASEBAND CHIRP
clear
close all

% Initializations

T = 50e-6; % pulsewidth
BT = 50; % time-bandwidth product
B = BT/T; % swept bandwidth
OVS = 10; % oversampling factor
N = BT*OVS; % number of samples
t_s = linspace(0,T,N); % time vector

% Baseband chirp generation

LFM = exp(1i*pi*(B/T)*t_s.^2); % LFM
s = [LFM zeros(1,N)]; % pulse and listening interval
s = s/norm(s); % power normalizing

% Writing binary to text file

fileID_re = fopen('CHIRPgen_re.txt','W');
fwrite(fileID_re,real(s),'float');
fclose(fileID_re);

fileID_im = fopen('CHIRPgen_im.txt','W');
fwrite(fileID_im,imag(s),'float');
fclose(fileID_im);

% Graph

figure(1)
plot(t_s/T,real(LFM))
hold on
plot(t_s/T,imag(LFM))
hold off
legend('\Re(s)','\Im(s)')
xlabel('Normalized Time (1 \cdot T)')
ylabel('Amplitude')
title('LFM')