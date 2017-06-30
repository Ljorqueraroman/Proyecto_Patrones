function [ X, Xn ] = fx_extract_features( image_paths, seg_method )
%FX Summary of this function goes here
%   Detailed explanation goes here
  fx.vdiv = 1;
  fx.hdiv = 1;
  fx.dhar = 3;
  
  [ opLBPu, opHara, opHoG, opGabor ] = fx_params( fx );
 
  if ~isempty(image_paths)
    I = imread(image_paths{1});
    seg = ip_get_segments(I,seg_method);
    n_seg = length(seg);
    I(isnan(I)) = 0 ;
    
    [~,XnLBPu] = Bfx_lbp(I,[],opLBPu);
    %[~,XnLBPri] = Bfx_lbp(I,[],opLBPri);
    [~,XnHoG] = Bfx_hog(I,[],opHoG);
    [~,XnGabor] = Bfx_gabor(I,opGabor);
    %[~,XnHar] = Bfx_haralick(I,[],opHara);
    %Xnseg = [XnLBPu; XnLBPri; XnHar];
    Xnseg = [XnLBPu; XnHoG; XnGabor];
    %Xnseg = [XnLBPu; XnHoG];
    %Xnseg = XnLBPu;
    size_Xnseg = size(Xnseg);
    
    Xn = zeros(size_Xnseg(1)*n_seg, size_Xnseg(2)+4);
    
    for i = 1:n_seg
      seg_index = ['s' sprintf('%2.2d',i) '_'];
      Xn(size_Xnseg(1)*(i-1)+1:size_Xnseg(1)*(i),:) = ...
        [repmat(seg_index,size_Xnseg(1),1) Xnseg];
    end
    Xn = char(Xn);
    X = zeros(length(image_paths),length(Xn));
    
  else
    display('No image paths were given');
    return;
  end
  
  h = waitbar(0,strcat('Extracting Features: ',...
      '0/',int2str(length(image_paths)),...
      ' [',sprintf('%.0f%%',0),']'));
  for i = 1:length(image_paths)
    I = imread(image_paths{i});
    
    %debe ser horizontal
    partitions = ip_get_segments(I,seg_method);
    %partitions = I;
    
    index = 1;
    
    for j = 1:length(partitions)
      I2 = partitions{j};
      XLBPu = Bfx_lbp(I2,[],opLBPu);
      %XLBPri = Bfx_lbp(I2,[],opLBPri);
      XHoG = Bfx_hog(I2,opHoG);
      XGabor = Bfx_gabor(I2,opGabor);
      %XHar = Bfx_haralick(I2,[],opHara);
      %Xseg = [ XLBPu XLBPri XHar];
      Xseg = [ XLBPu XHoG XGabor];
      %Xseg = [ XLBPu XHoG];
      %Xseg = XLBPu;
      X(i,index:index+length(Xseg)-1) = Xseg;
      index = index + length(Xseg);
    end
    progress = i/length(image_paths);
    waitbar(progress,h,strcat('Extracting Features: ',...
      int2str(i),'/',int2str(length(image_paths)),...
      ' [',sprintf('%.0f%%',100*progress),']'))
  end
  close(h)
  
end

