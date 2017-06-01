clt;
load('_config.mat');

range.class_start    = 1;
range.class_end      = 143;
range.id_start       = 1;
range.id_end         = 10000;

disp('Extracting features from the whole set...')
[ X_raw, Xn_raw, d_raw, id_raw ] = ...
  fx_extract_set(range , '', config.loc , config.seg_method);

if (config.wanna_save)
  save( sav.fx_all, 'X_raw', 'Xn_raw', 'd_raw','id_raw');
  disp(['Saved training features to ' sav.fx_all]);
end