function c = mfcc(s, fs)
% MFCC Calculate the mel frequencey cepstrum coefficients (MFCC) of a signal
%
% Inputs:
% s : speech signal
% fs : sample rate in Hz
%

%ETAPE 1 - Frame blocking


%ETAPE 2 - Windowing et hamming

%ETAPE 3 - FFT

%ETAPE 4 - Mel-Frequency

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