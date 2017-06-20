% V, number of words
%P es el numero de personas
function [H_train, H_test] = get_histograms(V, Z_train, Z_test, n_face_landmarks, n_train, n_test, P)
    fprintf('Creating Visual Vocabulary with %d words...\n',V);
    [~,C] = Bct_kmeans(Z_train,V);

    disp('Computing histograms...');

    kd = vl_kdtreebuild(C');
    i1a = 1;
    i2a = n_face_landmarks;
    i1b = 1;
    i2b = n_face_landmarks;
    H_train = zeros(n_train,V);
    H_test  = zeros(n_test,V);
    tr = 0;
    te = 0;
    for i=1:n_train
        dq = Z_train(i1a:i2a,:);
        i1a = i1a+n_face_landmarks;
        i2a = i2a+n_face_landmarks;
        j = vl_kdtreequery(kd,C',dq','NumNeighbors',1);
        tr = tr+1;
        H_train(tr,:) = hist(j,1:V);
    end

    for i=1:n_test
        dq = Z_test(i1b:i2b,:);
        i1b = i1b+n_face_landmarks;
        i2b = i2b+n_face_landmarks;
        j = vl_kdtreequery(kd,C',dq','NumNeighbors',1);
        te = te+1;
        H_test(te,:) = hist(j,1:V);
    end
end