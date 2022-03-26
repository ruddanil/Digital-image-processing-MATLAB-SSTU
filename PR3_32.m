IMG = imread('6. 1_Izo4_14.tiff'); % Исходное изображение
figure, histogram(IMG); % Вывод гистограммы
length(unique(IMG)) % Подсчет количества уникальных значений яркости
