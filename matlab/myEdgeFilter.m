function [img1] = myEdgeFilter(img0, sigma)
%Your implemention
    %Smooth Image using Guassian Blur
    hsize = 2*ceil(3*sigma)+1;
    h = fspecial('gaussian', hsize, sigma);
    smoothedImage = myImageFilter(img0, h);
    
    %Calculate X and Y gradients
    h = fspecial('sobel');
    imgy = myImageFilter(smoothedImage, h);
    h = transpose(h);
    imgx = myImageFilter(smoothedImage, h);
    
    %Calculates Image Magnitude
    imgMag = sqrt(double(imgx).^2 + double(imgy).^2);
    %Calculates Image Gradient Direction
    imgDir = atan2d(double(imgy), double(imgx));

   
    %Non Maximal Supression
    filterSize = 7; %Size of the neibourhood used to calculate NMS
    padAmount = (filterSize-1)/2;
    [height, width] = size(imgMag);
    imgMag = padarray(imgMag,[padAmount padAmount], 0, 'both');

    
    for i = 1:height
        for j = 1:width
            %sub-array the size of filter with index (i,j) at the center
            imgMag(i+padAmount,j+padAmount) = nms(imgDir(i,j), imgMag(i:(filterSize-1+i), j:(filterSize-1+j)));
        end
    end
    [height, width] = size(imgMag);
    %strips padding
    img1 = imgMag(padAmount+1:height-padAmount, padAmount+1:width-padAmount);
end
    
                
        
        
