clt;
load('_config.mat')
load(savename.train_fs);

%Classifier Testing by Crossvalidation
b(1).name = 'knn';   b(1).options.k = 3;                              % KNN with 3 neighbors
b(2).name = 'knn';   b(2).options.k = 5;                              % KNN with 5 neighbors
b(3).name = 'knn';   b(3).options.k = 7;                              % KNN with 7 neighbors
b(4).name = 'knn';   b(4).options.k = 9;                              % KNN with 9 neighbors
b(5).name = 'lda';   b(5).options.p = [];                             % LDA
b(6).name = 'qda';   b(6).options.p = [];                             % QDA
b(7).name = 'dmin';  b(7).options = [];                               % Euclidean distance
%b(7).name = 'libsvm';b(7).options.kernel = '-t 2';                    % rbf-SVM
%b(7).name = 'maha';  b(7).options = [];                               % Mahalanobis distance
op.strat=1; op.b = b; op.v = 10; op.show = 1; op.c = 0.95;        	  % 10 groups cross-validation

warning('off','all')
display('SFS Xval')
%[sfs_xval_p,sfs_xval_ci] = Bev_crossval(X_sfs,d_train,op);            % cross valitadion
display('PCA Xval')
[pca_xval_p,pca_xval_ci] = Bev_crossval(X_pca,d_train,op);            % cross valitadion
warning('on','all')

display(['SFS/PCA Crossvalidation for ' int2str(config.nfeat) ' features']);
[ sfs_xval_p pca_xval_p ]

