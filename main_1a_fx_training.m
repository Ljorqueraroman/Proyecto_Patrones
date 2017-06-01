clt;
load('_config.mat');

disp('Working on Training Set...')
[ X_raw, Xn_raw, d_train ] = ...
  fx_extract_set(train_data , '', config.loc , config.seg_method);

if (config.wanna_save)
  save( savename.train_fx, 'X_raw', 'Xn_raw', 'd_train');
  disp(['Saved training features to ' savename.train_fx]);
end