function out = myAHE(inFile,N)
    in = imread(inFile);
    [R,C,chan] = size(in);
    temp = 1:1:R;
    temp2 = 1:1:C;
    x0 = max(0,temp-N)+1;
    y0 = max(0,temp2-N)+1;
    x1 = min(temp+N,R);
    y1 = min(temp2+N,C);
    out = zeros(size(in));
    for i=1:1:R
        for j=1:1:C
            for k=1:1:chan
                window = in(x0(i):x1(i),y0(j):y1(j),k);
                out(i,j,k) = sum(sum(window<=in(i,j,k)))*255/((x1(i)-x0(i)+1)*(y1(j)-y0(j)+1));
            end
        end
    end     
end
