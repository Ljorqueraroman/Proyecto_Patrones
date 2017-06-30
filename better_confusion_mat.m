clt;
load('_classified_xval.mat');

n_folds = length(C);

C_norm = cell(1,n_folds);

for i = 1:n_folds
  divisor = sum(C{i},2);
  denom = repmat(divisor, [1, length(C{i})]);
  C_norm{i} = C{i} ./ denom;
  C_norm{i}(denom==0) = 0;
end

C_all = C{1} + C{2} + C{3} + C{4};
divisor = sum(C_all,2);
denom = repmat(divisor, [1, length(C_all)]);
C_norm_all = C_all ./ denom;
C_norm_all(denom==0) = 0;

%imshow(C_norm{1}, 'InitialMagnification',300)
%colormap(flipud(bone))

CI = zeros(size(p_pca,1),1);
for i = 1:size(p_pca,1)
  x = p_pca(i,:);
  SEM = std(x)/sqrt(length(x));               % Standard Error
  ts = tinv([0.025  0.975],length(x)-1);      % T-Score
  %CI = mean(x) + ts*SEM;                      % Confidence Intervals
  CI(i) = ts(2)*SEM;
end

imshow(C_norm_all, 'InitialMagnification',300)
%colormap(flipud(bone))
a = bone;
bone2 = [a(1:200,:); a(end,:)];
colormap(flipud(bone2))
ylabel('Clase Real')
xlabel('Clase Predicha')
title('Matriz de confusion: Suma de Folds')
