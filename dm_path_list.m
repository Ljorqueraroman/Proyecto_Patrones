function [ image_paths, d ] = dm_path_list ( range_data, name_function, location )
%DM_PATH_LIST Summary of this function goes here
%   Detailed explanation goes here

  
  % expected parameters in range_data
  class_start = range_data.class_start;
  class_end   = range_data.class_end;
  id_start    = range_data.id_start;
  id_end      = range_data.id_end;
  skip_errors = range_data.skip_errors;
  % end expected parameters
  
  n_class     = class_end - class_start + 1;
  n_id        = id_end - id_start + 1;
  
  if n_class <= 0 || n_id <= 0
    disp('Warning: invalid intervals @dm_get_path_list.m')
  end

  image_paths = cell(1,n_class*n_id);
  d = zeros(n_class*n_id,1);
  
  index = 1;
  errors = 0;
  for class = class_start:class_end;
    for id = id_start:id_end;
      image_data.class = class;
      image_data.id = id;
      image_paths{index} = dm_image_path(image_data,name_function,location);
      
      if strcmp(image_paths{index},'')
        errors = errors+1;
        if skip_errors
          break;
        end
      else
        d(index) = class;
        index = index + 1;
      end
    end
  end
  if errors > 0
    if ~skip_errors
      disp('One or more images were not found');
    end
    d = d(1:index-1);
    image_paths = image_paths(~cellfun('isempty',image_paths));
  end
  disp(['Found ' int2str(index-1) ' valid file names.']);
end
