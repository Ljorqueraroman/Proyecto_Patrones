function [ Y, Yn ] = fs_normalize( X, Xn, norm )
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here
  Z = X(:,norm.s);
  Yn = Xn(norm.s,:);
  Y = repmat(norm.a,size(Z,1),1).*Z + repmat(norm.b,size(Z,1),1);
  
end

