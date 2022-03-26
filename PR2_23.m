IMG = imread('Исходное.jpg');
IMGBW = rgb2gray(IMG);
[y, x] = size(IMGBW);
NEWIMG = uint8(zeros(y, x));
k=3;
BLOCK = uint8(ones(k, k));
for i = 1:k:y-k
    for j = 1:k:x-k
        NEWIMG(i:(i+k-1), j:(j+k-1)) = BLOCK(1:k,1:k)*IMGBW(i,j);
    end
end
figure, imshow(NEWIMG);
figure, imhist(NEWIMG);