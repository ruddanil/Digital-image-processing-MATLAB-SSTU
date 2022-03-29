IMG = imread("IMG\Айвазовский.jpg");
IMG = rgb2gray(IMG);
%figure, imhist(IMG);
%figure, imshow(IMG);
IMG = im2double(IMG);
[y, x] = size(IMG);
NEWIMG = double(zeros(y, x));

for i = 1:y
    for j = 1:x
        if IMG(i,j) >= 0.75 && IMG(i,j) <= 0.8
            NEWIMG(i,j) = 1;
        else
            NEWIMG(i,j) = IMG(i,j);
        end    
    end
end

figure, imshow(NEWIMG);
figure, imhist(NEWIMG);