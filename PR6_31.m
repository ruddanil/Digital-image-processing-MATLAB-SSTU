% Преобразование в негатив
IMG = imread("Исходное.jpg");
IMG = rgb2gray(IMG);
IMG = im2double(IMG);
NEWIMG = imadjust(IMG,[0 1],[1 0]);
% subplot(2,2,1); imshow(IMG);
% subplot(2,2,2); imhist(IMG);
% subplot(2,2,3); imshow(NEWIMG); 
% subplot(2,2,4); imhist(NEWIMG);

% Растяжение диапазонов
IMG1 = imread("Bad.jpg"); 
IMG1 = rgb2gray(IMG1);
IMG1 = im2double(IMG1);
NEWIMG1 = imadjust(IMG1,[0 0.4],[0 1]);
% subplot(2,2,1); imshow(IMG1);
% subplot(2,2,2); imhist(IMG1);
% subplot(2,2,3); imshow(NEWIMG1); 
% subplot(2,2,4); imhist(NEWIMG1);

% Преобразование с гамма-коррекцией
IMG2 = imread("Good.jpg"); 
IMG2 = rgb2gray(IMG2);
IMG2 = im2double(IMG2);
NEWIMG21 = imadjust(IMG2,[],[],0.15);
NEWIMG22 = imadjust(IMG2,[],[],1);
NEWIMG23 = imadjust(IMG2,[],[],1.85);
% subplot(2,4,1); imshow(IMG2);
% subplot(2,4,2); imhist(IMG2);
% subplot(2,4,3); imshow(NEWIMG21);
% subplot(2,4,4); imhist(NEWIMG21);
% subplot(2,4,5); imshow(NEWIMG22);
% subplot(2,4,6); imhist(NEWIMG22);
% subplot(2,4,7); imshow(NEWIMG23);
% subplot(2,4,8); imhist(NEWIMG23);

% Растяжение диапазонов с гамма-коррекцией 
IMG3 = imread("VeryGood.jpg"); 
IMG3 = rgb2gray(IMG3);
IMG3 = im2double(IMG3);
NEWIMG3 = imadjust(IMG3,[0.65 1],[0 1],0.6);
subplot(2,2,1); imshow(IMG3);
subplot(2,2,2); imhist(IMG3);
subplot(2,2,3); imshow(NEWIMG3); 
subplot(2,2,4); imhist(NEWIMG3);

%(lowIn,highIn,lowOut,highOut)