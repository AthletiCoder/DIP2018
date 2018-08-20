function B =  myShrinkImageByFactorD(s,d)
    A = imread(s);
    B = downsample(A,d);
    B = downsample(B',d);
    B = B';
end