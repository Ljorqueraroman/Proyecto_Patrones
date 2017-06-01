clt;
load('_config.mat');
load(savename.train_fx);
%load(savename.test_fx);
show_sfs = 1;

[ pca, sfs ] = fs_main( X_norm, Xn_norm, d_train, config.nfeat, show_sfs );

%X_sfs = X_norm(:,sfs.s);  %Z_sfs = Z_norm(:,sfs.s);
X_pca = pca.X;            %Z_pca = fs_pca_transform(Z_norm,pca.A,config.nfeat);

if(config.wanna_save)
  save( savename.fs, 'pca', 'sfs');
  disp(['Saved selected features (or map) to ' savename.fs]);
  
  %save(savename.train_fs,'X_sfs','X_pca','d_train');
  save(savename.train_fs,'X_pca','d_train');
  disp(['Saved selected testing features to ' savename.train_fs]);
  
  %save(savename.test_fs,'Z_sfs','Z_pca','d_test');
  %disp(['Saved selected training features to ' savename.test_fs]);
  
end