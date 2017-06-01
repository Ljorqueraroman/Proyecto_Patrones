function [ X ] = xval_join( xval_data, leftout )
%XVAL_JOIN Summary of this function goes here
%   Detailed explanation goes here
  
  lengths = zeros(size(xval_data,1)+1,1);
  pause(1)
  for i = 1:size(xval_data,1)
    if(i ~= leftout)
      lengths(i+1) = lengths(i)+size(xval_data{i},1);
    else
      lengths(i+1) = lengths(i);
    end
  end
  width = size(xval_data{i},2);
  X = zeros(lengths(end),width);
  for i = 1:size(xval_data,1)
    if(i ~= leftout)
      X(lengths(i)+1:lengths(i+1),:) = xval_data{i};
    end
  end
  
end

