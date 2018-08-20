function B = myHE(s)
    A = imread(s);
    [R,C,N] = size(A);
    B = A;
    for i=1:1:N
        cdf = zeros(256);
        for j=1:1:256
            cdf(j) = (sum(sum(A(:,:,i)<=j))/(R*C))*255;
        end
        B(:,:,i) = cdf(A(:,:,i) + 1);
    end
end