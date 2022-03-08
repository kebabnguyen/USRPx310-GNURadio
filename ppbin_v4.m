function decidevec = ppbin_v4(filename, numsnaps) %add a threshold control?

%ppbin_v4 given freq domain data, output what bins seem to be occupied
%looks at how many frequency domain samples there are, 
%and it'll take a look and decide how
%many signals are present (how many fftbins have a power higher than the
%noise floor)
%   really this checks for how many bins have a prominence higher than
%   3*the signal's standard deviation. this threshold decision is still
%   subject to further evaluation, but for now it seems to work.
f = fopen(filename,'rb'); %open up file
v = fread(f,Inf,'float'); %read in data from file
vallen = length(v); %how many entries are in data?
fftlen = ceil(vallen/numsnaps); %how long are our fft samples?
breakval = reshape(v,[fftlen numsnaps]); %break v up into fftlen rows and numsnaps columns

avgs = mean(breakval,2);
%variance = var(avgs);
stdev = std(avgs);
[~, locs] = findpeaks(avgs, "MinPeakProminence", 3*stdev); %4*var or 3*std seems sufficient

%depending on toplevel flow it might be more efficient to send just peak
%indices rather than an entire decision vector
%also, we'll probably want to include guard indices to be safe; the peak
%indices thus far don't completely reflect what's going on in freq domain
dec = zeros(fftlen,1);
dec(locs) = 1;
decidevec = dec;
