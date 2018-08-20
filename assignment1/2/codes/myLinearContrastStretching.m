function B = myLinearContrastStretching(s)
    A = imread(s);
    B = A;
    for i=1:1:size(A,3)
        maxm = max(max(A(:,:,i)));
        minm = min(min(A(:,:,i)));
        B(:,:,i) = (A(:,:,i) - minm)*(255/(maxm-minm));
    end
end