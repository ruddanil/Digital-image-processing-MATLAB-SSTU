IMG = imread('Sea.jpg'); % Исходное изображение
IMGBW = rgb2gray(IMG); % Перевод в ЧБ
[y, x] = size(IMGBW); % Разрешение изображения
NEWIMG = uint8(zeros(y, x)); % Заготовка под новое изображение

k=256; % Количество разрешенных уровней яркости
Pr=256/k; % Промежуточная константа
for i = 1:y 
    for j = 1:x 
        NEWIMG(i,j)= Pr*round(IMGBW(i,j)/Pr); % Присвоение
    end
end                                       
%figure, imshow(NEWIMG); % Вывод полученного изображения
%figure, histogram(NEWIMG); % Вывод гистограммы
length(unique(NEWIMG))