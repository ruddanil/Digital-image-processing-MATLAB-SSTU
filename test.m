IMG1 = imread("Bad.jpg"); 
%IMG1 = imread("Good.jpg"); 
%IMG1 = imread("VeryGood.jpg"); 
%IMG1 = imread("123.jpg");

IMG1 = rgb2gray(IMG1); % перевод в чб
IMG = im2double(IMG1);
[y, x] = size(IMG);

NEWIMG = double(zeros(y, x));
Xmax = max(IMG(:));
K = double(4/Xmax);

for i = 1:y
    for j = 1:x 
        NEWIMG(i,j) = K * IMG(i,j) * (Xmax - IMG(i,j));
    end
end

subplot(2,2,1); imshow(IMG);
subplot(2,2,2); imhist(IMG);
subplot(2,2,3); imshow(NEWIMG); 
subplot(2,2,4); imhist(NEWIMG);

%Ymax = double((Xmax^2)/2);
%K = double(255/Ymax);
