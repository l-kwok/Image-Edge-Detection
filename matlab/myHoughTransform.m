function [H, rhoScale, thetaScale] = myHoughTransform(Im, threshold, rhoRes, thetaRes)
%Your implementation here
    [height, width] = size(Im);
    rhoRange = double((norm(size(Im))/rhoRes)/2);
    thetaScale = -90:thetaRes:89;
    M = length(thetaScale);
    rhoScale = (rhoRange*-1):double(rhoRange/(M/2)):(rhoRange);
 
    H = zeros(length(rhoScale), length(thetaScale));
    
    for y=1:height
        for x=1:width
            if Im(y,x) > threshold
                for theta = 1:length(thetaScale)
                   distance = x*cosd(thetaScale(theta))+y*sind(thetaScale(theta));       
                   [~, rho] = min(abs(rhoScale-distance));
                   H(rho, theta) = H(rho, theta)+1;
                end
            end
        end
    end

end
        
        