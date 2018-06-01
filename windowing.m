function Frames=windowing(x,N,M)

L=length(x);
nbFrames=floor((L-N)/M+1);
Frames=zeros(N,nbFrames+1);

for k=0:nbFrames-1
    Frames(:,k+1)=x(k*M+1:k*M+N);    
end

lastL=L-nbFrames*M;
Frames(1:lastL,end)=x(L-lastL+1:end);

W=hamming(N)*ones(1,nbFrames+1);

Frames=Frames.*W;


