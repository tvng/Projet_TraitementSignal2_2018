function c = vqlbg(d, k)
% VQLBG Vector quantization using the Linde-Buzo-Gray algorithm
%
% Inputs:
% d contains training data vectors (one per column)
% k is number of centroids required
%
% Outputs:
% c contains the result VQ codebook (k columns, one for each centroids)

% 1. Design a 1-vector codebook; this is the centroid of the entire set of training vectors 

yn   = mean(d, 2);%  on prend la moyenne de chaque ligne

e=0.01;
for i = 1:log2(k) %repeat until codebook (size M) is designed

    
    while (1==1)%the average distance falls below a preset threshold
        % 2. Double the size of the codebook by splitting each current codebook yn; 
        %where n varies from 1 to the current size of the codebook, and ? is a splitting parameter 
        ynd = [yn*(1+e), yn*(1-e)]:

        %3. Cluster Vectors - Nearest-Neighbor Search: for each training vector, find the codeword in the current
        %codebook that is closest (in terms of similarity measurement), and
        %assign that vector to the corresponding cell (associated with the closest codeword).
        
        %The nearest-neighbor search step is: given a current codebook c, assign each training vector in d with a closest codeword. To do that, one needs to
        %compute the pair-wise distances between each vectors in d to each vectors (codeword) in c. This can be done with the supplied function disteu:
         
        z = disteu(d, ynd); %distances euclidiennes entre les colonnes de deux matrices
        
        %Now z(i, j) would be the distance between the training vector d(:, i) and the codeword c(:, j). Next step, for each training vector, find the
        %closest codeword. For this, use the Matlab function min:
        [m, ind] = min(z, [], 2);
        
        %4. Centroid Update: update the codeword in each cell using the centroid
        %of the training vectors assigned to that cell.

          %% mettre du code ici
    end
end


% Hints



%The result index vector ind contains the associated cluster number for each training vector. So to access to all the training vectors that belong to the
%cluster number j (those vectors that are closest to the codeword c(:, j)), one can use:
d(:, find(ind == j));
%Find Centroids
%The centroid of all vectors in a particular cluster is found by the Matlab function mean. For example, after the Nearest-Neighbor Search step above,
%the new centroids of the clusters number j can be updated as follows:
c(:, j) = mean(d(:, find(ind == j)), 2);