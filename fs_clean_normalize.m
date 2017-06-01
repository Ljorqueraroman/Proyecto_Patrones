function [ Y, Yn, norm ] = fs_clean_normalize( X, Xn )
%CLEANANDNORMALIZE Eliminates constant features and correlated features,
%also normalizes what is left.
%   X is a feature matrix.
%   Xn is a matrix containing the names of the features.
%
%   Y is a clean and normalized feature matrix
%   Yn is a clean feature name matrix
%   s is the filter vector.
%   norm contains the normalization constants.
%
%   Y = norm.a * X(:,s) + norm.b
%   Yn = Xn(s,:)
  
  s = Bfs_clean(X,0);
  norm.s = s;
  Y = X(:,s);
  [Y,norm.a,norm.b] = Bft_norm(Y,1);
  
  
  Yn = Xn(s,:);

end

