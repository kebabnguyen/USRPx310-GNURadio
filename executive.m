function [thechosen] = executive(filename)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
sec1 = [6:10 12:22];
sec2 = [23:24 26:31 33:38 40:41];
sec3 = [43:52 54:59];
pilot = [11 25 39 53];
secs = [sec1; sec2; sec3]; %900 MHz
occbins = ppbin_v4(filename,64, 3);
unocc = sectionscroll(occbins,secs);
thechosen = sectionchooser(unocc);
end