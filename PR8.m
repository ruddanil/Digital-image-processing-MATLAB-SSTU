clear all;
close all;
IMG = imread("12345.jpg"); 
% IMG = rgb2gray(IMG); % Перевод в чб
IMG = im2double(IMG);
% figure, imhist(IMG);
% figure, imshow(IMG);

% 2.3 Выбор порога по алгоритму
Tstart = 0.01;
Ttemp = (min(IMG(:)) + max(IMG(:)))/2;
GROUP1 = find(IMG > Ttemp); % Выбор пикселей со значением серого больше порога (сегментация)
GROUP2 = find(IMG <= Ttemp); % Выбор пикселей со значением серого меньше порога (сегментация)
Tnew = (mean(IMG(GROUP1)) + mean(IMG(GROUP2)))/2; % Средние яркости Мю и новое значение порога по среднему
while abs(Tnew - Ttemp) < Tstart % Разница значений Т при соседних итерациях не окажется меньше значения T
    Ttemp = Tnew;
    GROUP1 = find(IMG > Ttemp);
    GROUP2 = find(IMG <= Ttemp);
    Tnew = (mean(IMG(GROUP1)) + mean(IMG(GROUP2)))/2;
end
IMG1 = im2bw(IMG, Tnew);
IMGtoXOR1 = im2bw(IMG,0.5);
figure, imshow(IMG1); % Обработанное изображение 
figure, imshow(xor(IMG1,IMGtoXOR1)); % XOR с п.2

% 2.4 Порог по умолчанию
IMG2 = im2bw(IMG);
IMGtoXOR2 = im2bw(IMG,graythresh(IMG));
figure, imshow(IMG2); % Обработанное изображение 
figure, imshow(xor(IMG2,IMGtoXOR2));% XOR с п.3

% 2.5 Порог с помощью функции
Tgt = graythresh(IMG);
IMG3 = im2bw(IMG,Tgt);  
figure, imshow(IMG3); % Обработанное изображение 
figure, imshow(xor(IMG3,IMG1)); % XOR с п.1

% 3.1 
IMG4 = imread("Good.jpg"); 
IMG4 = rgb2gray(IMG4); % Перевод в чб
IMG4 = im2double(IMG4);
IMG41 = im2bw(IMG4);
IMG42 = im2bw(IMG4,graythresh(IMG4));
figure, imshow(IMG41);
figure, imshow(IMG42);
figure, imshow(xor(IMG41,IMG42));

% 3.2
Tstart = 0.1;
Ttemp = (min(IMG(:)) + max(IMG(:)))/2;
GROUP1 = find(IMG > Ttemp); % Выбор пикселей со значением серого больше порога (сегментация)
GROUP2 = find(IMG <= Ttemp); % Выбор пикселей со значением серого меньше порога (сегментация)
Tnew = (mean(IMG(GROUP1)) + mean(IMG(GROUP2)))/2; % средние яркости Мю и новое значение порога по среднему
while abs(Tnew - Ttemp) < Tstart % разница значений Т при соседних итерациях не окажется меньше значения T
    Ttemp = Tnew;
    GROUP1 = find(IMG <= Ttemp);
    GROUP2 = find(IMG > Ttemp);
    Tnew = (mean(IMG(GROUP1)) + mean(IMG(GROUP2)))/2;
end
IMG1 = im2bw(IMG, Tnew);
figure, imshow(IMG1); % Обработанное изображение 