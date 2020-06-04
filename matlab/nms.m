function supressionValue = nms(dir, mag)
    center = ceil(length(mag)/2);
    %mapping in degrees
    if (dir < 22.5 && dir > -22.5) || dir < -157.5 || dir > 157.5
        temp = mag(center,:);
    elseif (dir >= 22.5 && dir < 67.5) || (dir < -112.5 && dir >= -157.5)
        temp = diag(mag);
    elseif (dir >= 67.5 && dir < 112.5) || (dir < -67.5 && dir >= -112.5)
        temp = mag(:,center);
    elseif (dir >= 112.5 && dir <= 157.5) || (dir < -22.5 && dir >= -67.5)
        temp = diag(fliplr(mag));
    end
    
    %Comparison and supression
    supressionValue = temp(center);
    for i = 1:length(temp)
        if i == center
            continue;
        end
        if temp(i) > temp(center)
            supressionValue = 0;
            break;
        end
    end
end