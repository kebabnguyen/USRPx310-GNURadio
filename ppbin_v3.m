function decidevec = ppbin_v3(filename, numsnaps) %add a threshold control?

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
f = fopen(filename,'rb'); %open up file
v = fread(f,Inf,'float'); %read in data from file
vallen = length(v); %how many entries are in data?
fftlen = ceil(vallen/numsnaps); %how long are our fft samples?
breakval = reshape(v,[fftlen numsnaps]); %break v up into fftlen rows and numsnaps columns

avgs3 = mean(breakval,2);
[pks, locs] = findpeaks(avgs3, "MinPeakProminence", 2);
dec = zeros(fftlen,1);
dec(locs) = 1;
decidevec = dec;
end