clear all;
close all;

% Считываем изображение
img=imread('Shapes1bit1.png');
bn=im2bw(img);

% Получаем бинарную матрицу изображения
[L, Ne]=bwlabel(bn); 

% Получаем все свойства фигур, обнаруженных на изображении
prop=regionprops(L,'all');

% Выводим изображение
imshow(bn);

% Анализируем каждую фигуру в цикле
for k=1:length(prop)
    % Centroid - центр фигуры для вывода текста.
    centroid = prop(k).Centroid;

    % КВАДРАТ:
    % Extent - вокруг фигуры строится ограничивающая п/у рамка и вычисляется
    % коэффициент заполнения этой области фигурой. Для неразвернутого
    % квадрата этот коэффициент равен 1;
    % MinorAxisLength и MajorAxisLength - длины главной и побочной оси
    % фигуры. У квадрата они равны;
    % Solidity - выпуклость фигуры, для квадрата равна 1.
    if((abs(prop(k).Extent-1)<=0.15) == 1 && prop(k).MajorAxisLength == prop(k).MinorAxisLength && (abs(prop(k).Solidity-1)<0.15) == 1)
        text(centroid(1), centroid(2),"Квадр.", ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', 'color', 'r');

    % ПРЯМОУГОЛЬНИК: 
    % MajorAxisLength и MinorAxisLength - не равны;
    % Extent - равен 1.
    elseif((abs(prop(k).Extent-1)<=0.15) == 1 && prop(k).MajorAxisLength ~= prop(k).MinorAxisLength)
        text(centroid(1), centroid(2),"Прямоуг.", ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', 'color', 'r');

    % КРУГ: 
    % Circularity - округлость фигуры, для круга больше или равна 1.
    elseif(prop(k).Circularity >= 1)
        text(centroid(1), centroid(2),"Круг", ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', 'color', 'r');

    % ОВАЛ: 
    % Вычисляем примерную площадь овала по формуле a*b*pi и сравниваем её с
    % площадью из свойств - Area.
    elseif((abs((prop(k).MinorAxisLength/2 * prop(k).MajorAxisLength/2 * pi) - prop(k).Area)<=2) == 1)
        text(centroid(1), centroid(2),"Овал", ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', 'color', 'r');

    % ТРЕУГОЛЬНИК: 
    % Вычисляем примерную площадь треугольника по формуле sqrt(p(p-a)(p-b)(p-c))
    % и сравниваем ей с площадью из свойств - Area.
    elseif((abs(sqrt(prop(k).Perimeter/2*(prop(k).Perimeter/2-prop(k).Perimeter/3)*(prop(k).Perimeter/2-prop(k).Perimeter/3)*(prop(k).Perimeter/2-prop(k).Perimeter/3))-prop(k).Area) < 1500)==1)
        text(centroid(1), centroid(2),"Треуг.", ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', 'color', 'r');

    % РОМБ:
    % MajorAxisLength и MinorAxisLength - не равны;
    % Extent - не равен 1;
    % Eccentricity - эксцентриситет больше 0.5 и меньше 1;
    elseif(prop(k).MajorAxisLength ~= prop(k).MinorAxisLength && (abs(prop(k).Extent-1)<=0.15) == 0 && prop(k).Eccentricity > 0.5 && prop(k).Eccentricity < 1)
        text(centroid(1), centroid(2),"Ромб", ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', 'color', 'r');

    % ПЯТИУГОЛЬНИК И ШЕСТИУГОЛЬНИК: 
    % Вычисляем примерную площадь фигур по формулам, опытным путём
    % вычисляем допустимую погрешность (сравнивая с Area). Не универсальный
    % метод.
    else
        S5 = (((prop(k).Perimeter*prop(k).Perimeter)/4)/5)/tand(180/5)-prop(k).Area;
        S6 = (((prop(k).Perimeter*prop(k).Perimeter)/4)/6)/tand(180/6)-prop(k).Area;
        if(S5<0 && S5>-600)
            text(centroid(1), centroid(2),"5угол.", ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle', 'color', 'r');
        elseif(S6<0 && S6>-1600)
            text(centroid(1), centroid(2),"6угол.", ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle', 'color', 'r');
        else
            % 3, 5, 6-конечные звезды:
            % Отталкиваемся от количества экстремум (крайних точек) фигур.
            % Свойство Extrema возвращает двумерную матрицу с координатами
            % точек в формате [top-left top-right right-top right-bottom 
            % bottom-right bottom-left left-bottom left-top].
            % Некоторые пары или тройки координат для звезд будут иметь
            % одинаковые (с небольшой погрешностью) координаты, их
            % необходимо считать за одну вершину.
            % В цикле обходим матрицу, подсчитываем количество уникальных
            % вершин (считая одинаковые экстремумы за одну вершину) и
            % получаем количество вершин звезды.
            % Для упрощения вычислений на этапе настройки следует 
            % анализировать звезду на отдельном от всех фигур изображении.
            same = 0;
            for i = 1:8
                x=prop(k).Extrema(i,1);
                y=prop(k).Extrema(i,2);
                
                for j = 1+i:8
                    minX = x - prop(k).Extrema(j,1);
                    minY = y - prop(k).Extrema(j,2);
                    if((minX>=-2 && minX<=2) && (minY>=-2 && minY<=2)) 
                    else 
                        same = same + 1;
                    end
                end
            end
            if(same == 21)
                text(centroid(1), centroid(2),"3-звез.", ...
                'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'middle', 'color', 'r');
            elseif(same == 26 || same == 24)
                text(centroid(1), centroid(2),"6-звез.", ...
                'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'middle', 'color', 'r');
            elseif(same == 25)
                text(centroid(1), centroid(2),"5-звез.", ...
                'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'middle', 'color', 'r');
            end
        end
    end
end