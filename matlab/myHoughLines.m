function [rhos, thetas] = myHoughLines(H, nLines)
%Your implemention here
    [~, width] = size(H);

    H = imerode(H, strel('square',3));
    H = reshape(H,1,[]);
    [~, I] = maxk(H, nLines);
    rhos = zeros(length(I),1); %row
    thetas = zeros(length(I),1); %column
    for i=1:length(I)
       thetas(i) = mod(I(i), width);
       rhos(i) = ceil(I(i)/width);
       if thetas(i) == 0
           thetas(i) = width;
       end
    end
    
    
end
        