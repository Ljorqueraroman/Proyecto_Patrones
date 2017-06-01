clt;
load('_config.mat');
load(sav.fx_xval);

show_sfs = 0;

X_xval_norm    = cell(size(X_xval));
Xn_xval_norm   = cell(size(Xn_xval));
d_xval_train   = cell(size(d_xval));

Z_xval_norm    = cell(size(X_xval));
Zn_xval_norm   = cell(size(Xn_xval));
d_xval_test    = cell(size(d_xval));


h = waitbar(0,'Cleaning and normalizing Features...');
for i = 1:length(X_xval)
  
  X_join = xval_join(X_xval,i);
  [X_norm, Xn_norm, norm] = fs_clean_normalize( X_join, Xn_xval );
  X_xval_norm{i}      = X_norm;
  Xn_xval_norm{i}     = Xn_norm;
  d_xval_train{i}     = xval_join(d_xval,i);
  
  
  [ Z_norm, Zn_norm]  = fs_normalize( X_xval{i}, Xn_xval, norm );
  Z_xval_norm{i}      = Z_norm;
  Zn_xval_norm{i}     = Zn_norm;
  d_xval_test{i}      = d_xval{i};
  progress = i/length(X_xval);
  waitbar(progress,h,strcat('Cleaning Features...',sprintf('%.0f%%',100*progress)))
end
close(h);

X_xval_pca = cell(size(X_xval));
Z_xval_pca = cell(size(X_xval));

h = waitbar(0,'Selecting PCA Features...');
for i = 1:length(X_xval_norm)
  [pca.X, pca.lambda ,pca.A, pca.Xs ] = Bft_pca(X_xval_norm{i},cfg.nfeat);
  X_xval_pca{i} = pca.X;            
  Z_xval_pca{i} = fs_pca_transform(Z_xval_norm{i},pca.A,cfg.nfeat);
  
  progress = i/length(X_xval_norm);
  waitbar(progress,h,strcat('Selecting PCA Features...',sprintf('%.0f%%',100*progress)))
end
close(h);

if(cfg.wanna_save)
  
  save(sav.fs_xval_pca,'X_xval_pca','d_xval_train','Z_xval_pca','d_xval_test');
  disp(['Saved selected testing features to ' sav.fs_xval_pca]);
  
end