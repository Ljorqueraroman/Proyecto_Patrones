function [ image_paths, d, id_list ] = dm_path_list ( range_data, name_function, location )
%DM_PATH_LIST Summary of this function goes here
%   Detailed explanation goes here

  
  % expected parameters in range_data
  class_start = range_data.class_start;
  class_end   = range_data.class_end;
  id_start    = range_data.id_start;
  id_end      = range_data.id_end;
  % end expected parameters
  
  n_class     = class_end - class_start + 1;
  n_id        = id_end - id_start + 1;
  
  if n_class <= 0 || n_id <= 0
    disp('Warning: invalid intervals @dm_get_path_list.m')
  end

  image_paths = cell(1,n_class*n_id);
  d           = zeros(n_class*n_id,1);
  id_list     = zeros(n_class*n_id,1);
  
  
  index = 1;
  h = waitbar(0,'Finding images.');
  for class = class_start:class_end;
    for id = id_start:id_end;
      image_data.class = class;
      image_data.id = id;
      image_paths{index} = dm_image_path(image_data,name_function,location);
      
      if strcmp(image_paths{index},'')
        break;
      else
        d(index)        = class;
        id_list(index)  = id;
        index           = index + 1;
      end
    end
    progress = (class - class_start)/(class_end - class_start);
    waitbar(progress,h,strcat('Finding images:  ',sprintf('%.0f%%',100*progress)))
    
  end
  close(h);
  
  d = d(1:index-1);
  id_list = id_list(1:index-1);
  image_paths = image_paths(~cellfun('isempty',image_paths));
  disp(['Found ' int2str(index-1) ' valid file names.']);
end
