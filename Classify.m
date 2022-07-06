RGB = imread("IMG\untitled1.png");
GRAY = rgb2gray(RGB);

threshold = graythresh(GRAY);
BW = im2bw(GRAY, threshold);

[B,L] = bwboundaries(BW, 'noholes');

STATS = regionprops(L, 'all'); 

% Квадрат = 3 = (1 + 2) = (X=Y + Extent = 1)
% Прямуогольник = 2 = (0 + 2) = (only Extent = 1)
% Круг = 1 = (1 + 0) = (X=Y , Extent < 1)
% Не распознан = 0

figure,
imshow(RGB),
title('Results');
hold on
for i = 1 : length(STATS)
  W(i) = uint8(abs(STATS(i).BoundingBox(3)-STATS(i).BoundingBox(4)) < 5);
  W(i) = W(i) + 2 * uint8((STATS(i).Extent - 1) == 0 );
  centroid = STATS(i).Centroid;
  switch W(i)
      case 0
          text(centroid(1), centroid(2),"0", ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', 'color', 'r');
      case 1
          plot(centroid(1),centroid(2),'wO');
          text(centroid(1), centroid(2),"1", ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', 'color', 'r');
      case 2
          plot(centroid(1),centroid(2),'wX');
          text(centroid(1), centroid(2),"2", ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', 'color', 'r');
      case 3
          plot(centroid(1),centroid(2),'wS');
          text(centroid(1), centroid(2),"3", ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', 'color', 'r');

  end
end
return