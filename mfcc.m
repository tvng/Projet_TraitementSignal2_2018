function c = mfcc(s, fs)
% MFCC Calculate the mel frequencey cepstrum coefficients (MFCC) of a signal
%
% Inputs:
% s : speech signal
% fs : sample rate in Hz
%

M = 100; %par defaut
N = 256; %par defaut
l = length(s); %longueur de notre echantillon

%ETAPE 1 - Frame blocking


nb_morceaux = floor((l-N)/M + 1);

%decoupage dans une matrice "morceaux"
%{
for i = 1:N 
    for j = 1:nb_morceaux %nbFrame -> nb_morceaux
         morceaux(i, j) = s(((j - 1) * M) + i);  % M=>morceaux
    end 
end 
%}

%ETAPE 2 - Windowing et hamming
frames=windowing(s, N, M);
%j'ai l'impression que Windowing fait l'etape 1 et 2 en meme temps


%ETAPE 3 - FFT
for i = 1:nb_morceaux
fft_frames(:,i) = fft(frames(:, i));
end

%ETAPE 4 - Mel-Frequency
% Inputs:       p   number of filters in filterbank
%               n   length of fft
%               fs  sample rate in Hz
%
% Outputs:      x   a (sparse) matrix containing the filterbank amplitudes
%                   size(x) = [p, 1+floor(n/2)]
disp('Coefficients de mel');

p=20;
amplitudes=melfb(p, N ,fs);

N2 = 1 + floor(N/2);
 ms = amplitudes * abs(fft_frames(1:N2, :)).^2;

%ETAPE 5 - Cepstrum


% Outputs:
% c : MFCC output, each column contains the MFCC's for one speech frame
% Notes:
%The mel-frequency cepstrum coefficients is defined as the result of the DCT on the log of mel-spectrum. In addtion we often exclude the zero-order
%cepstral coefficients. So the end part of the mfcc program would looks like:
% All previous steps...
% Obtain the mel-spectrum in the variable: ms
% Last step, compute mel-frequency cepstrum coefficients
c = dct(log(ms));
c(1,:) = []; % exclude 0'th order cepstral coefficient