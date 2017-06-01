clt;
load('_config.mat');
load(sav.fx_all);

ncuts = 4;

% Split for X-val
cut = 1/ncuts;
x = unique(d_raw);
N = numel(x);
count = zeros(N,1);
for k = 1:N
  count(k) = sum(d_raw==x(k));
end

t = floor(cut*count);
T = [t 2*t 3*t 4*t];

lowest = 1;
for n_iter = 1:ncuts
  for i=1:N
    if(T(i,4) < count(i))
      for j = lowest:4
        T(i,j) = T(i,j)+1;
      end
      lowest = mod(lowest,4)+1;
    end
  end
end

X_xval  = cell(ncuts,1);
d_xval  = cell(ncuts,1);
id_xval = cell(ncuts,1);

T2 = [zeros(N,1) T];
T3 = zeros(length(id_raw),5);
index = 1;
for i=1:N
  T3(index:(count(i)+index-1),:) = repmat(T2(i,:),count(i),1);
  index = index + count(i);
end
for i=1:ncuts
  min = T3(:,i);
  max = T3(:,i+1);
  X_xval{i}   = X_raw(  id_raw > min & id_raw <= max, :);
  d_xval{i}   = d_raw(  id_raw > min & id_raw <= max);
  id_xval{i}  = id_raw( id_raw > min & id_raw <= max);
end
Xn_xval = Xn_raw;

if (cfg.wanna_save)
  save(sav.fx_xval, 'X_xval', 'Xn_xval', 'd_xval', 'id_xval');
  disp(['Saved HO split features to ' sav.fx_xval]);
end

