clt;
load('_config.mat');

range.class_start    = 1;
range.class_end      = 143;
range.id_start       = 1;
range.id_end         = 1500;

disp('Extracting features from the whole set...')
[ X_raw, Xn_raw, d_raw, id_raw ] = ...
  fx_extract_set(range , '', cfg.loc , cfg.seg_method);

if (cfg.wanna_save)
  save( sav.fx_all, 'X_raw', 'Xn_raw', 'd_raw','id_raw');
  disp(['Saved training feawtures to ' sav.fx_all]);
end