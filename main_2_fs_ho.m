clt;
load('_config.mat');
load(sav.fx_ho);
%load(savename.test_fx);


show_sfs = 1;
[ X_norm, Xn_norm, norm ] = fs_clean_normalize( X_ho, Xn_ho );
d_train = dtr_ho;
[ Z_norm, Zn_norm] = fs_normalize( Z_ho, Xn_ho, norm );
d_test = dte_ho;

[pca.X, pca.lambda ,pca.A, pca.Xs ] = Bft_pca(X_norm,cfg.nfeat);

X_ho_pca    = pca.X;
Z_ho_pca    = fs_pca_transform(Z_norm,pca.A,cfg.nfeat);
d_ho_train  = d_train;
d_ho_test   = d_test;

if(cfg.wanna_save)
  save(sav.fs_ho_pca,'X_ho_pca','d_ho_train','Z_ho_pca','d_ho_test');
  disp(['Saved selected features to ' sav.fs_ho_pca]);
end