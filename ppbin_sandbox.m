close all;!!

clear all;
%numsnaps = 4;
filename = "copytest2.bin"; %try using findpeaks

f = fopen(filename,'rb'); %open up file
v = fread(f,Inf,'float'); %read in data from file
vallen = length(v); %how many entries are in data?
%fftlen = ceil(vallen/numsnaps); %how long are our fft samples?
fftlen = 64;
numsnaps = ceil(vallen/fftlen);
breakval = reshape(v,[fftlen numsnaps]); %break v up into fftlen rows and numsnaps columns

avgs3 = mean(breakval,2);
[~, locs] = findpeaks(avgs3, "MinPeakHeight", ceil(mean(avgs3)));
dec = zeros(fftlen,1);
dec(locs) = 1;

freq = 1:1:fftlen;
figure(1);
plot(freq,breakval(:,1));
hold on
plot(freq,dec);
% plot(freq,decision);

hold off
% legend("norm\_avg","avg\_norm","decision","threshold");