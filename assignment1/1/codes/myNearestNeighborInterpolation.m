function B = myNearestNeighborInterpolation(file)
    input = imread(file);
    [M,N] = size(input);
    outputImage = zeros(3*M-2,2*N-1);
    for i=1:1:3*M-2
        for j=1:1:2*N-1
            x = (i-1)/3+1;
            y = (j-1)/2+1;
            x1 = floor(x);
            y1 = floor(y);
            x2 = ceil(x);
            y2 = ceil(y);
            if x-x1 > x2-x
                x = x2;
            else
                x = x1;
            end
            if y-y1 > y2-y
                y = y2;
            else
                y = y1;
            end
            outputImage(i,j)=input(x,y);
        end
    end
    B = outputImage;
end
