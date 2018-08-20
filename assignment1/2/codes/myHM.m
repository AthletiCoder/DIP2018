function out = myHM(inFile, refFile)
    in = imread(inFile);
    ref = imread(refFile);
    [R1,C1,N] = size(in);
    cdfIn = zeros(256,N);
    [R2,C2,N] = size(ref);
    cdfRef = zeros(256,N);
    noOfBins = 256;
    totalPixels1 = R1*C1;
    totalPixels2 = R2*C2;
    % computing the cdfs of in and ref images
    for i=1:1:noOfBins
        for j=1:1:N
            cdfIn(i,j) = (sum(sum(in(:,:,j)<=i))/totalPixels1)*255;
            cdfRef(i,j) = (sum(sum(ref(:,:,j)<=i))/totalPixels2)*255;
        end
    end
    inverseMap = zeros(256,N,'uint8');
    % inverse mapping from cdf-values to pixels
    for idx=1:1:256
        for chan=1:1:3
            [~,ind] = min(abs(cdfIn(idx,chan) - cdfRef(:,chan)));
            inverseMap(idx,chan) = ind-1;
        end
    end
    out = inverseMap(double(in)+1);
    imwrite(out, '../data/retinaMatched.png');
end
