IMG = imread("15. Centre.jpg");
%IMG = rgb2gray(IMG); % перевод в чб
%figure, imhist(IMG);
[y, x] = size(IMG);
NEWIMG = double(zeros(y, x));
IMG2=im2double(IMG);
%figure, imhist(IMG2);
Xmin = double(112/255); Xmax = double(173/255);
Ymin=0; Ymax=1;
for i = 1:y
    for j = 1:x 
        NEWIMG(i,j)=(((IMG2(i,j)-Xmin)/(Xmax-Xmin))*(Ymax-Ymin)+Ymin);
    end
end
figure, imshow(NEWIMG);
figure, imhist(NEWIMG);