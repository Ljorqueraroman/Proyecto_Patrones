function [ pca, sfs ] = fs_main( X_train, Xn_train, d_train, nfeat, show )
%FS_MAIN Summary of this function goes here
%   Detailed explanation goes here
  
  %PCA
  disp('Using PCA...')
  [pca.X,pca.lambda,pca.A,pca.Xs ] = Bft_pca(X_train,nfeat);

  %SFS
  disp('Using SFS...')
  op_sfs.m = nfeat;    op_sfs.show = show;    op_sfs.b.name = 'fisher';
  %sfs.s = Bfs_sfs(X_train,d_train,op_sfs);
  %sfs.Xn = Xn_train(sfs.s,:);
  sfs = []
end

