close all;
clear all;
f = fopen('teset.txt','rb');
v = fread(f,Inf,'float');
lengthv = length(v); %length could also be a parameter, might not change it as much tho
breaklen = ceil(lengthv/4); % this ought to be another param that we feed in, might want to change how many snapshots we take
v1 = v(1:breaklen); %breaking up file data into its constituent snapshots
v2 = v(breaklen+1:2*breaklen);
v3 = v(2*breaklen+1:3*breaklen);
v4 = v(3*breaklen+1:4*breaklen);
for i = 1:breaklen 
    average(i) = (v1(i)+v2(i)+v3(i)+v4(i))/4;
end
floor = mean(average);
decision = zeros(breaklen,1);
for i = 1:breaklen
    if average(i) > 2*floor
        decision(1:i) = 1;
    else
        decision(1:i) = -1;
    end
end
freq = 1:1:breaklen;
figure(1);
plot(freq,average);
floorvec = zeros(breaklen,1);
floorvec(1:breaklen)=1.5*floor;
hold on
plot(freq, floorvec);
% plot(freq,v1);
% plot(freq,v2);
% plot(freq,v3);
% plot(freq,v4);
hold off
