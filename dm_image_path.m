function [ path ] = dm_image_path...
  ( image_meta_data, name_function, location)
%GET_IMAGE generates the path to a image by giving it the relevant data.
%
%   location is the directory where the image is stored
%   name_function is a function that generates a valid filename by using
%     the data in varargin.
%   image_metadata is an struct containing the relevant data for the image
%     (ex: subject, id, gender, etc).
%
%   If name_function is the empty string, it uses a harcoded function.
%   If location is the empty string, it uses a hardcoded default location.

  % Default location
  if strcmp(location,'')
    location = 'data\';	
  end
  if (name_function == '')
    name = dm_name_function(image_meta_data);
  else
    name = dm_name_function(image_meta_data);
  end
  path = strcat(location,name);
  
  if ~exist(path,'file')
    path = '';
  end
end

