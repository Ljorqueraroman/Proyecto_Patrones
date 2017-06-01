clt
configfile = '_config.mat';
config.wanna_save = 1;
config.nfeat = 75;
config.loc = '';
config.seg_method = '4x5';

savename.train_fx   = '_train_fx.mat';
savename.test_fx    = '_test_fx.mat';
savename.fs         = '_feat_selection.mat';
savename.train_fs   = '_train_fs.mat';
savename.test_fs   = '_test_fs.mat';

train_data.class_start    = 1;
train_data.class_end      = 143;
train_data.id_start       = 1;
train_data.id_end         = 10000;
train_data.skip_errors    = 1;

test_data.class_start     = 1;
test_data.class_end       = 1;
test_data.id_start        = 1;
test_data.id_end          = 1;
test_data.skip_errors     = 1;

save( configfile );
disp('Saved new configuration');