clt;
load('_config.mat');
load(sav.fs_xval_pca);
warning('off','all')

b(1).name = 'knn';   b(1).options.k = 3;                              % KNN with 5 neighbors
b(2).name = 'knn';   b(2).options.k = 5;                              % KNN with 5 neighbors
b(3).name = 'knn';   b(3).options.k = 7;                              % KNN with 7 neighbors
b(4).name = 'knn';   b(4).options.k = 9;                              % KNN with 9 neighbors
b(5).name = 'lda';   b(5).options.p = [];                             % LDA
b(6).name = 'qda';   b(6).options.p = [];                             % QDA
b(7).name = 'dmin';  b(7).options = [];
b(8).name = 'nnglm'; b(8).options.method = 3; b(8).options.iter = 1;
% Euclidean distance
op = b;


n_folds = length(X_xval_pca);
n_classifiers = 8;

d_pca = cell(1,n_folds);
d_test = cell(1,n_folds);
p_pca = zeros(n_classifiers,n_folds);

h = waitbar(0,strcat('Crossvalidating, fold: ',...
      '0/',int2str(n_folds),...
      ' [',sprintf('%.0f%%',0),']'));
for i = 1:n_folds
  progress = i/n_folds;
  waitbar(progress,h,strcat('Crossvalidating, fold: ',...
      int2str(i),'/',int2str(n_folds),...
      ' [',sprintf('%.0f%%',100*progress),']'))
    
  X_pca     = X_xval_pca{i};
  d_train   = d_xval_train{i};
  Z_pca     = Z_xval_pca{i};
  d_test{i}    = d_xval_test{i};
  
  d_pca{i} = Bcl_structure(X_pca,d_train,Z_pca,op);
  p_pca(:,i) = Bev_performance(d_pca{i},d_test{i});
  
  
end
close(h);

classifiers = {'knn-3';'knn-5';'knn-7';'knn-9';'LDA';'QDA';'dMin';'nnglm';};
columns     = {'Classifier';'Fold_1';'Fold_2';'Fold_3';'Fold_4';'Mean'};
P = num2cell(mean(p_pca,2)*100);
p_pca2 = num2cell(p_pca*100);
T = table(categorical(classifiers),...
          p_pca2(:,1),p_pca2(:,2),p_pca2(:,3),p_pca2(:,4),P,...
          'VariableNames',columns)
        

C = cell(1,n_folds);   
[~,argmax] = max(P{1});
for i = 1:n_folds
  d_pred = d_pca{i}(:,argmax);
  C{i} = confusionmat(d_test{i},d_pred);
end

save('classified_xval.mat','d_pred','d_test','C','T','p_pca');
warning('on','all')