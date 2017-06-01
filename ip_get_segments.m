function [ segments ] = ip_get_segments(I, method)
%FX_SEGMENT_IMAGE Summary of this function goes here
%   Detailed explanation goes here

  %Expected size 160x110
  I_size = size(I);
  if strcmp(method,'manual')
    t_lim = [ 0.242   0.364   0.001   1.000;...   Frown
              0.333   0.455   0.125   0.417;...   Left Eye
              0.333   0.455   0.583   0.875;...   Right Eye
              0.576   0.878   0.250   0.750;...   Mouth
              0.849   1.000   0.167   0.833;...   Chin
              0.364   0.606   0.375   0.625 ...   Nose
              ];
    lim = [ ceil(I_size(1)*t_lim(:,1:2)) ceil(I_size(2)*t_lim(:,3:4)) ];
  elseif ~isempty( strfind(method,'x') )
    x_pos = strfind(method,'x');
    n_part_v = str2double(method(1:x_pos-1));
    n_part_h = str2double(method(x_pos+1:end));
    dv = floor(I_size(1)/n_part_v);     v = [1 dv];
    dh = floor(I_size(2)/n_part_h);     h = [1 dh];
    lim = zeros(n_part_v*n_part_h,4);
    for i = 1:n_part_v*n_part_h;
      lim(i,:) = [ v+dv*rem((i-1),n_part_v) h+dh*floor((i-1)/n_part_v)];
    end
  else
    lim = [1 I_size(1) 1 I_size(2)];
  end
  s = size(lim);
  segments = cell(1,s(1));
  for i = 1:s(1)
    segments{i} = I(lim(i,1):lim(i,2),lim(i,3):lim(i,4));
  end
end

