function [ data ] = dm_name_data( filename )
%DM_NAME_DATA Generates the relevant data for an image by analyzing it's
%   filename. Returns a struct containing it.
%
%   IMPORTANT: This implementation is for:
%     Name: "face_XXXX_YYYY.png"
%     Outputs: data.class = X [integer]
%              data.id    = Y [integer]
%   dm_name_fuction and dm_name_data.m MUST be coherent, remember to 
%   keep both up to date in changes to file name structure.

  data.class    = str2double(filename(6:9));
  data.id       = str2double(filename(11:14));

end

