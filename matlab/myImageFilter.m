function [img1] = myImageFilter(img0, h)
    %initialization
    filterSize = length(h);
    imageSize = size(img0); 
    img1 = double(zeros(size(img0))); 
    padAmount = (filterSize-1)/2;
    h = flip(flip(h,2)); %convolution
    img0 = double(padarray(img0, [padAmount padAmount], 'replicate', 'both'));
    for i = 1:imageSize(1) %col
        for j = 1:imageSize(2) %row
           img1(i,j) = sum(sum(img0(i:(filterSize-1+i), j:(filterSize-1+j)).*h));
        end
    end
end
