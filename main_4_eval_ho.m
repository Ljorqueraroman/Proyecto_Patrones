clt;
load('_config.mat');
load(sav.fs_ho_pca);
warning('off','all')

b(1).name = 'knn';   b(1).options.k = 3;                              % KNN with 5 neighbors
b(2).name = 'knn';   b(2).options.k = 5;                              % KNN with 5 neighbors
b(3).name = 'knn';   b(3).options.k = 7;                              % KNN with 7 neighbors
b(4).name = 'knn';   b(4).options.k = 9;                              % KNN with 9 neighbors
b(5).name = 'lda';   b(5).options.p = [];                             % LDA
b(6).name = 'qda';   b(6).options.p = [];                             % QDA
b(7).name = 'dmin';  b(7).options = [];                               % Euclidean distance
op = b;

X_pca     = X_ho_pca;
d_train   = d_ho_train;
Z_pca     = Z_ho_pca;
d_test    = d_ho_test;


d_pca = Bcl_structure(X_pca,d_train,Z_pca,op);
p_pca = Bev_performance(d_pca,d_test);

classifiers = {'knn-3';'knn-5';'knn-7';'knn-9';'LDA';'QDA';'dMin'};
columns     = {'Classifier';'Performance'};
p_pca2 = num2cell(p_pca*100);
T = table(categorical(classifiers),p_pca2(:,1),...
          'VariableNames',columns)

[~,argmax] = max(p_pca);
d_pred = d_pca(:,argmax);
C = confusionmat(d_test,d_pred);
imshow(C, 'InitialMagnification',300)

%colormap(flipud(jet))
colormap(flipud(pink))
%colormap(flipud(copper))
%colormap(flipud(parula))
%colormap(flipud(hot))

save('classified_ho.mat','d_pred','d_test','C','T');
warning('on','all')