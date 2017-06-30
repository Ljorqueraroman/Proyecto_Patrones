clt
configfile = '_config.mat';

cfg.wanna_save = 1;
cfg.nfeat = 286;
cfg.loc = '';
cfg.seg_method = 'landmarks';
cfg.xval_ncuts = 4;

sav.fx_all     = '_fx_all.mat';
sav.fx_ho      = '_fx_ho.mat';
sav.fx_xval    = '_fx_xval.mat';
sav.fs_ho_pca  = '_fs_ho_pca.mat';
sav.fs_xval_pca  = '_fs_ho_pca.mat';

save( configfile, 'cfg', 'sav' );
disp('Saved new configuration');