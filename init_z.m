function [Z_train, Z_test] = init_Z(n_train, n_test, n_facelandmarks)
    if(modo == 1)
        Z_train = zeros(n_train*n_facelandmarks,59);
        Z_test  = zeros(n_test*n_facelandmarks,59);
end