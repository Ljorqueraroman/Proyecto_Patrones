clt;
load('_config.mat');
load('savename.testing_fx')

disp('Working on Testing Set...')
[ Z_raw, Zn_raw, d_test, ~ ] = ...
  fx_extract_set(test_data , '',  config.loc , config.seg_method, norm);