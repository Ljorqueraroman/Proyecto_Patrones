clt;
load('_config.mat');
load(savename.train_fs);
load(savename.test_fs);
warning('off','all')


b(1).name = 'knn';   b(1).options.k = 5;                              % KNN with 5 neighbors
b(2).name = 'knn';   b(2).options.k = 7;                              % KNN with 7 neighbors
b(3).name = 'knn';   b(3).options.k = 9;                              % KNN with 9 neighbors
b(4).name = 'lda';   b(4).options.p = [];                             % LDA
b(5).name = 'qda';   b(5).options.p = [];                             % QDA
b(6).name = 'dmin';  b(6).options = [];                               % Euclidean distance
op = b;

d_pca = Bcl_structure(X_pca,d_train,Z_pca,op);
p_pca = Bev_performance(d_pca,d_test)  ;


%disp('LDA confusion matrix:')
%c_mat_pca = confusionmat(d_test,d_pca(:,4));
%disp(c_mat_pca)

d_sfs = Bcl_structure(X_sfs,d_train,Z_sfs,op);
p_sfs = Bev_performance(d_sfs,d_test);        

%disp('LDA confusion matrix:')
%c_mat_sfs = confusionmat(d_test,d_sfs(:,4));
%disp(c_mat_sfs)

[p_sfs p_pca]
warning('on','all')