clt;
load('_config.mat');
load(sav.fx_all);

n_hold_out = 10;

% Split for hold Out
X_ho      = X_raw(id_raw    <=  n_hold_out, :); 
dtr_ho    = d_raw(id_raw    <=  n_hold_out);
idr_ho    = id_raw(id_raw   <=  n_hold_out);
Xn_ho     = Xn_raw;

Z_ho      = X_raw(id_raw    >   n_hold_out, :);
dte_ho    = d_raw(id_raw    >   n_hold_out);
ide_ho    = id_raw(id_raw   >   n_hold_out);


if (cfg.wanna_save)
  save( sav.fx_ho, 'X_ho', 'Xn_ho', 'dtr_ho', 'idr_ho', 'Z_ho', 'dte_ho', 'ide_ho');
  disp(['Saved ho split features to ' sav.fx_ho]);
end
