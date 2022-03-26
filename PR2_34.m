IMG = imread('15. roga_19.tiff');
[y, x] = size(IMG);
SPIXEL = IMG(1,1);
if y < x
    LEN = y;
else
    LEN = x;
end
POS = 0;
for i = 1:y
    for j = 1:x
        POS = POS + 1;
        if IMG(i,j) ~= SPIXEL && IMG(i,j) ~= 0 && LEN > POS
            SPIXEL = IMG(i,j);
            if 
                LEN = POS;
            end
            POS = 0;
        end 
    end
end
LEN
ySpaceResol = y / LEN
xSpaceResol = x / LEN