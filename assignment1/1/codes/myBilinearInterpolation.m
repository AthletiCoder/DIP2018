function B = myBilinearInterpolation(file)
    inputImage = imread(file);
    [M,N] = size(inputImage);
    outputImage = zeros(3*M-2,2*N-1);
    for i=1:1:3*M-2
        for j=1:1:2*N-1
            x = (i-1)/3+1;
            y = (j-1)/2+1;
            x1 = floor(x);
            y1 = floor(y);
            x2 = ceil(x);
            y2 = ceil(y);
            f11 = inputImage(x1,y1);
            f12 = inputImage(x1,y2);
            f21 = inputImage(x2,y1);
            f22 = inputImage(x2,y2);
            if x-x1==0 && y-y1==0
                outputImage(i,j)=f11;
            elseif y-y1==0
                outputImage(i,j)=(f11*(x2-x)+f21*(x-x1))/(x2-x1);
            elseif x-x1==0
                outputImage(i,j)=(f11*(y2-y)+f12*(y-y1))/(y2-y1);
            else
                outputImage(i,j)=(f11*(x2-x)*(y2-y)+f21*(x-x1)*(y2-y)...
                +f12*(x2-x)*(y-y1)+f22*(x-x1)*(y-y1))/((x2-x1)*(y2-y1));
            end
        end
    end
    B = outputImage;
end
