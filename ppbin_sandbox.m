close all;
clear all;
numsnaps = 4;
filename = "trial1.txt"; %logpowerfft seems to mirror the frequency domain; plain jane method seems to be true to freq sink
guardbands = 15;

f = fopen(filename,'rb'); %open up file
v = fread(f,Inf,'float'); %read in data from file
vallen = length(v); %how many entries are in data?
fftlen = ceil(vallen/numsnaps); %how long are our fft samples?
breakval = reshape(v,[fftlen numsnaps]); %break v up into fftlen rows and numsnaps columns

avgs3 = mean(breakval,2);
variance = var(avgs3);
stdev = std(avgs3);
[~, locs] = findpeaks(avgs3, "MinPeakProminence", 3*stdev); %4*var or 3*std seems sufficient

modlocsL = zeros(length(locs)*guardbands,1);
modlocsR = zeros(length(locs)*guardbands,1);
%[~, locs] = findpeaks(avgs3, "Threshold", variance);
for j = 1:length(locs) %for each peak found
    for i = 1:guardbands %we wanna stretch it out by guardband amount on both sides of every peak
        modlocsL(length(locs)*i-(length(locs)-1):length(locs)*i) = locs - i;
        modlocsR(length(locs)*i-(length(locs)-1):length(locs)*i) = locs + i;
    end
end
modlocsA = [locs; modlocsL; modlocsR];
%dec = zeros(fftlen,1);
%dec(locs) = 1;
%decidevec = dec;
dec = zeros(fftlen,1);
dec(modlocsA) = 1;

freq = 1:1:fftlen;
figure(3);
plot(freq,breakval(:,1));
hold on
plot(freq,dec);
%plot(freq,avgs3);
% plot(freq,decision);
xlabel("fft bin");
hold off
legend("dataset","decision");