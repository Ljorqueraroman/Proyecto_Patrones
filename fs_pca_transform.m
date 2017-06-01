function [ Y ] = fs_pca_transform( X, A, m )
%PCATRANSFORM Summary of this function goes here
%   Detailed explanation goes here
  [N,~] = size(X);
  mx = mean(X);
  MX = ones(N,1)*mx;
  X0 = X - MX;
  
  B = A(:,1:m);
  Y = X0*B;
end

