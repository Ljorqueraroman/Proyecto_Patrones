function [ X_raw, Xn_raw, d] = ...
  fx_extract_set(  data_range,name_function, location, seg_method )
%MAIN_FX Summary of this function goes here
%   Detailed explanation goes here
  if strcmp(seg_method,'')
    seg_method = 'manual';
  end
    
  disp('Finding images...');
  [image_paths_train,d] = ...
    dm_path_list(data_range,name_function,location);
  
  disp('Extracting features...');
  [X_raw,Xn_raw] = fx_extract_features(image_paths_train,seg_method);
  
end

