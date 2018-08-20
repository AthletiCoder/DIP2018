%% MyMainScript

tic;
%% Linear contrast stretching
% Contrast can be improved by linear stretching only if one of the channels
% doesn't use the entire range but in this case the whole range
% of colours is used. Also stretching wont change the distribution.
A = myLinearContrastStretching('../data/church.png');
figure('Name', 'Church - Linear stretching', 'NumberTitle', 'off'),imshow(uint8(A));colorbar
%% Histogram equalisation
% HE is prefered to contrast stretching because it changes the distribution
% of pixel intensities and spreads them across the colours.
A = myHE('../data/church.png');
figure('Name', 'Church - Histogram Equalisation', 'NumberTitle', 'off'),imshow(uint8(A));colorbar
%% Histogram matching
% 
A = myHM('../data/retina.png','../data/retinaRef.png');
figure('Name', 'Retina - Histogram Matching', 'NumberTitle', 'off'),imshow(uint8(A));colorbar
%% Adaptive histogram equalisation
%
figure('Name', 'Girl', 'NumberTitle', 'off'),imshow('../data/girl.jpg');colorbar
A = myAHE('../data/girl.jpg',5);
figure('Name', 'Girl - AHE noise amplification', 'NumberTitle', 'off'),imshow(uint8(A));colorbar
A = myAHE('../data/girl.jpg',50);
figure('Name', 'Girl - AHE good', 'NumberTitle', 'off'),imshow(uint8(A));colorbar
A = myAHE('../data/girl.jpg',75);
figure('Name', 'Girl - AHE low contrast improvement', 'NumberTitle', 'off'),imshow(uint8(A));colorbar
%% Contrast limited adaptive histogram equalisation
% CLAHE works with better with window size 5 than AHE with window size 5
A = myCLAHE('../data/girl.jpg',50,0.02);
figure('Name', 'Girl - Good Gamma Values', 'NumberTitle', 'off'),imshow(uint8(A));colorbar
A = myCLAHE('../data/girl.jpg',50,0.01);
figure('Name', 'Girl - Good Gamma Values', 'NumberTitle', 'off'),imshow(uint8(A));colorbar
toc;
