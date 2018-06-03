%QUESTION 2 :afficher signal en domaine temporel
%clear all
%[y,Fs]=audioread('data\test\s1.wav');
%audio2=audioread('data\test\s1.wav');
%fs=length(audio2);
%t=0:1/fs:1-1/fs;
%plot(t,audio2)
%xlabel('Temps (s)');
%ylabel('Amplitude');

%QUESTION 2 : representaiton discrete du signal en temporel
%clear all
%[y,Fs]=audioread('data\test\s1.wav');
%audio1=audioread('data\test\s1.wav');
%fs=length(audio1);
%l = length(audio1);
%n = 256;
%m = 100;
%blockFrames = floor((l-n)/m) + 1;
%for i = 1:n
%for j = 1:blockFrames
%M1(i,j) = audio1(((j-1) * m) + i);
%end
%end
%M1
%h=hamming(n);
%M2= diag(h)*M1;
%M2
%for i = 1:blockFrames
% M3(:,1) = fft(M2(:,i));
%end
%M3
%tspan=(0:n-1)/Fs;
%plot(tspan,abs(M3),'-ok','linewidth',2,'MarkerFaceColor','black');

%QUESTION 5 : The Mel-spaced filter bank
%plot(linspace(0, (Fs/2), 129), ( ( melfb(20,256,Fs) ) ) );
%title('Mel-Spaced Filter Bank') ;
%xlabel('Frequency (Hz)'); 

%QUESTION 7 : pick any two dimensions (say the 5th
%and the 6th) and plot the data points in a 2D plane
%[ya1,Fa1]=audioread('data\test\s1.wav');
%[ya3,Fa3]=audioread('data\test\s3.wav');
%vec1 = mfcc(ya1,Fa1);
%vec2 = mfcc(ya3,Fa3);
%plot(vec1(5, :), vec1(6, :), '*g');
%hold on;
%plot(vec2(5, :), vec2(6, :), '*r');
%title('2D Plot of Acoustic Vectors');
%xlabel('5th Dimension');
%ylabel('6th Dimension');

%QUESTION 8 : PLOT THE VQ CENTROIDS
%[ya1,Fa1]=audioread('data\test\s1.wav');
%[ya3,Fa3]=audioread('data\test\s3.wav');
%vec1 = mfcc(ya1,Fa1);
%vec2 = mfcc(ya3,Fa3);
%vq1 = vqlbg(vec1, 16);
%vq2 = vqlbg(vec2, 16);
%plot(vec1(5, :), vec1(6, :), 'og');
%hold on;
%plot(vec2(5, :), vec2(6, :), '+b');
%hold on;
%plot(vq1(5, :), vq1(6, :), 'vr');
%hold on;
%plot(vq2(5, :), vq2(6, :), '*k');
%title('Plot of Acoustic Vectors with VQ Codewords');
%xlabel('5th Dimension');
%ylabel('6th Dimension');

%QUESTION 9
code = train('data\train\', 8);
test('data\test\', 8, code);