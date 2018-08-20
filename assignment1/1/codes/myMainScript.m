tic;
%% Question 1
% Shrink image by factor 2
A = myShrinkImageByFactorD('../data/circles_concentric.png',2);
figure('Name', 'Concentric cirles', 'NumberTitle', 'off'),imshow(uint8(A));colorbar
%%
% Shrink image by factor 3
A = myShrinkImageByFactorD('../data/circles_concentric.png',3);
figure('Name', 'Shrunk', 'NumberTitle', 'off'),imshow(uint8(A));colorbar
%%
% Barbara small image
figure('Name', 'BarbaraSmall', 'NumberTitle', 'off'),imshow('../data/barbaraSmall.png');
%%
% Bilinear interpolation on barbara
A = myBilinearInterpolation('../data/barbaraSmall.png');
figure('Name', 'Bilinear', 'NumberTitle', 'off'),imshow(uint8(A));colorbar
%%
%Nearest neighbours on barbara
A = myNearestNeighborInterpolation('../data/barbaraSmall.png');
figure('Name', 'NearestNeighbor', 'NumberTitle', 'off'),imshow(uint8(A));colorbar

toc;