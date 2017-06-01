clt;
load('_config.mat');

%fx_extract_set(  data_range,name_function, location, seg_method, norm)
disp('Working on Training Set...')
[ X_norm, Xn_norm, d_train, norm ] = ...
  fx_extract_set(train_data , '', config.loc , config.seg_method, []);

disp('Working on Testing Set...')
[ Z_norm, Zn_norm, d_test, ~ ] = ...
  fx_extract_set(test_data , '',  config.loc , config.seg_method, norm);



if (config.wanna_save)
  save( savename.train_fx, 'X_norm', 'Xn_norm', 'd_train', 'norm');
  disp(['Saved training variables to ' savename.train_fx]);

  save( savename.test_fx, 'Z_norm', 'Zn_norm', 'd_test', 'norm');
  disp(['Saved testing variables to ' savename.test_fx]);
end