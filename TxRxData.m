%% Writing binary text file from audio file

y = audioread('CantinaBand3.wav');
y_new = (y+1)*127;
% y_out = typecast(y_new,'uint8');

fileID = fopen('wav_source_test.txt','W');
fwrite(fileID,y_new);
fclose(fileID);

% soundsc(y,20e3)

%% Comparing transmitted and received data

f = fopen('tx_test.txt');
tx_values = fread(f);
fclose(f);

g = fopen('rx_test.txt');
rx_values = fread(g);
fclose(g);

test = tx_values(1:length(rx_values)) & rx_values;

oof = 0;
for ii = 1:length(test)
    if test(ii,1) == 0
        oof = oof + 1;
    end
end
oof_rate = oof/length(rx_values)*100;

%% Verifying received data resembles original audio

f = fopen('tx_test.txt');
tx_values = fread(f);
fclose(f);

g = fopen('rx_test.txt');
rx_values = fread(g);
fclose(g);

tx_new = tx_values/127-1;
rx_new = rx_values/127-1;

soundsc(tx_new,20e3)
