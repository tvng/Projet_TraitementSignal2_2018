function code = train(traindir, n)

%taper ceci dans la console : train('data\train\', 8)

% Speaker Recognition: Training Stage
%
% Input:
%       traindir : string name of directory contains all train sound files
%       n        : number of train files in traindir
%
% Output:
%       code     : trained VQ codebooks, code{i} for i-th speaker
%
% Note:
%       Sound files in traindir is supposed to be: 
%                       s1.wav, s2.wav, ..., sn.wav
% Example:
%       >> code = train('C:\data\train\', 8);

k = 16;                         % number of centroids required

%pour chaque fichier audio, on fait tourner le code
for i = 1:n                     % train a VQ codebook for each speaker
    file = sprintf('%ss%d.wav', traindir, i);            
    disp(file);
   
    [s, fs] = audioread(file);
    
    v = mfcc(s, fs);            % Compute MFCC's
   % v : MFCC output, each column contains the MFCC's for one speech frame
    code{i} = vqlbg(v, k);      % Train VQ codebook
end
