function [ file_name ] = dm_name_function( data )
%DM_IMAGE_NAME Generates a valid image name by using the given data.
%   data is an struct containing the data to generate the name.
%
%   IMPORTANT: This implementation is for:
%     Name: "face_XXXX_YYYY.png"
%     Inputs: X = data.class  [integer]
%             Y = data.id     [integer]
%   dm_name_fuction and dm_name_data.m MUST be coherent, remember to 
%   keep both up to date in changes to file name structure.

  % Expects 2 values: data and id
  class   = data.class;
  id      = data.id;
  % Expected name: face_XXXX_YYYY.png
  file_name = strcat('face_',sprintf('%4.4d',class),...
              '_',sprintf('%4.4d',id),'.png');
  
end

