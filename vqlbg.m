function r = vqlbg(d, k)
% VQLBG Vector quantization using the Linde-Buzo-Gray algorithm
%
% Inputs:
% d contains training data vectors (one per column)
% k is number of centroids required
%
% Outputs:
% c contains the result VQ codebook (k columns, one for each centroids)

% 1. Design a 1-vector codebook; this is the centroid of the entire set of training vectors 

  
e   = .0003; %precision des centroids/barycentres
r   = mean(d, 2); % on prend la moyenne de chaque ligne
dpr = 10000; 

for i = 1:log2(k) %k nbre de centroids quon veut extraire. repeat until codebook (size M) is designed
   r = [r*(1+e), r*(1-e)];%pas de saut, pas plus precis que la diff dintervalle 
    
  while (1 == 1) %tant quon est pas ok avec la precision. the average distance falls below a preset threshold
        
        % 2. Double the size of the codebook by splitting each current codebook yn; 
        %where n varies from 1 to the current size of the codebook, and ? is a splitting parameter 
        
        %3. Cluster Vectors - Nearest-Neighbor Search: for each training vector, find the codeword in the current
        %codebook that is closest (in terms of similarity measurement), and
        %assign that vector to the corresponding cell (associated with the closest codeword).
        
        %The nearest-neighbor search step is: given a current codebook c, assign each training vector in d with a closest codeword. To do that, one needs to
        %compute the pair-wise distances between each vectors in d to each vectors (codeword) in c. This can be done with the supplied function disteu:
         
       z = disteu(d, r); %distance entre vect reel d et intervalle de recherche %distances euclidiennes entre les colonnes de deux matrices
        
        %Now z(i, j) would be the distance between the training vector d(:, i) and the codeword c(:, j). Next step, for each training vector, find the
        %closest codeword. For this, use the Matlab function min:
  
       [m,ind] = min(z, [], 2); %si il est plus pres de la gauche ou droite, on reteint lendroit ou c le plus court
        
        %4. Centroid Update: update the codeword in each cell using the centroid
        %of the training vectors assigned to that cell.
        t = 0; 
        for j = 1:2^i %j va de 1 a 2, puis 1 a 4, 1 a 8, 1 a 16, r est mis au carre, pr chque colonne on a deux colonnes
           %find (ind==j),2 : donne les deux premieres valeurs dt lindice =j
            
            %moy des lignes qui ont les plus petites distances a la moy
            r(:, j) = mean(d(:, find(ind == j)), 2); %moyenne des 168x20 valeurs on prend tte la colonne dindice j, on la remplace par moyenne
              x = disteu(d(:, find(ind == j)), r(:, j)) %fait les distances moyennes des distances au centroide/barrycentre
            for q = 1:length(x) %
                t = t + x(q); %on somme les distances reeles. somme des plus petites distances a la moy. a quel point le barycentre est bon
            end 
        end 
        if (((dpr - t)/t) < e) %momoent ou dpr-t tend vers 1. dpr est une valeur fixe de precision. 
           break; %on est arrivé a la bonne valeur. t est suffisament precis, petit
            %on arrete qud on est satisfait de la precision
       else 
            dpr = t; %
       end 
    end
end


% Hints



%The result index vector ind contains the associated cluster number for each training vector. So to access to all the training vectors that belong to the
%cluster number j (those vectors that are closest to the codeword c(:, j)), one can use:
    %d(:, find(ind == j));
%Find Centroids
%The centroid of all vectors in a particular cluster is found by the Matlab function mean. For example, after the Nearest-Neighbor Search step above,
%the new centroids of the clusters number j can be updated as follows:
    %c(:, j) = mean(d(:, find(ind == j)), 2);