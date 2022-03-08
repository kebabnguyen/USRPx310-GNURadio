%% Writing binary text file from audio file

[y,Fs] = audioread('audio.mp3');
y_new = (y+1)*127;
% y_out = typecast(y_new,'uint8');

fileID = fopen('wav_source_test.txt','W');
fwrite(fileID,y_new);
fclose(fileID);

% soundsc(y,48e3)

%% Comparing transmitted and received data

% Reading in relevant files

f = fopen('tx_test.txt');
tx_values = fread(f);
fclose(f);

g = fopen('rx_test.txt');
rx_values = fread(g);
fclose(g);

h = fopen('wav_source_test.txt');
og_values = fread(h);
fclose(h);

% Establishing "error rate" -- measure of error in rx data compared to tx data

test = tx_values(1:length(rx_values)) & rx_values;
error = 0;
for ii = 1:length(test)
    if test(ii,1) == 0
        error = error + 1;
    end
end
error_rate = error/length(rx_values)*100;

% Establishing rate of return

rx_data = length(rx_values)/length(tx_values)*100;

%% Verifying received data resembles original audio

% Determining sample rate of original audio in case not already done

[y,Fs] = audioread('audio.mp3');

% Reading in relevant files

f = fopen('tx_test.txt');
tx_values = fread(f);
fclose(f);

g = fopen('rx_test.txt');
rx_values = fread(g);
fclose(g);

% Undoing conversion from first section

tx_new = tx_values/127-1;
rx_new = rx_values/127-1;

% Playing received data as audio

soundsc(rx_new,Fs) % use clear sound to stop playing