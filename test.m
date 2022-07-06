clear all;
close all;

img2=imread('PropsImg\ShapesSimple\3star1.png');
img3=imread('PropsImg\ShapesSimple\5star1.png');
img4=imread('PropsImg\ShapesSimple\6star1.png');

bn2=im2bw(img2);
bn3=im2bw(img3);
bn4=im2bw(img4);

[L2, Ne2]=bwlabel(bn2); 
[L3, Ne3]=bwlabel(bn3); 
[L4, Ne4]=bwlabel(bn4); 

prop2=regionprops(L2,'all');
prop3=regionprops(L3,'all');
prop4=regionprops(L4,'all');

    same = 0;
    for i = 1:8
        x=prop4.Extrema(i,1);
        y=prop4.Extrema(i,2);
        
        for j = 1+i:8
            minX = x - prop4.Extrema(j,1);
            minY = y - prop4.Extrema(j,2);
            if((minX>=-2 && minX<=2) && (minY>=-2 && minY<=2)) 
            else 
                same = same + 1;
            end
        end
    end
    same

% 
% img=imread('PropsImg\Ex\Shapes1bit.png');
% bn=im2bw(img);
% [L, Ne]=bwlabel(bn); 
% prop=regionprops(L,'all');
% imshow(bn);
% 
% 
% for k=1:length(prop)
%     centroid = prop(k).Centroid;
%     
%     text(centroid(1), centroid(2),string(prop(k).Solidity), ...
%         'HorizontalAlignment', 'center', ...
%         'VerticalAlignment', 'middle', 'color', 'r');  
% end