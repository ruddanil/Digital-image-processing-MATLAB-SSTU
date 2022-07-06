IMG = imread('IMG\Алиса4.jpg'); 
%figure, imshow(IMG);

% Применение эрозии - из объекта удаляются точки, лежащие на его границе
% таким образом мы удалим с изображения все фигуры, размер которых меньше 
% структурного элемента strel
%ER = imerode(IMG, strel('diamond', 15)); 
ER = imerode(IMG, strel('sphere', 10));
%ER = imerode(ER, strel('rectangle', 10,7));
figure, imshow(ER);

% Применение дилатации - добавляем к оставшемуся после эрозии кругу
% дополнительные точки, чтобы увеличить его размер до исходного
DI = imdilate(ER, strel('sphere', 25)); 
figure, imshow(DI);

% Удаляем из исходного изображения полученный дилатацией круг
% в результате на изображении остаются только остальные фигуры
%CIRCLE = IMG-DI;
%figure, imshow(NEWIMG);

% Находим разницу между исходным и полученным изображениями
%RESULT = imabsdiff(IMG,CIRCLE);
%figure, imshow(RESULT);
