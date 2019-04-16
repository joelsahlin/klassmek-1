function T = calc_time(x, y, t)
    % semi-major axis
    T = 0;
    index = 1;
    for i=2:size(x,2)
        if y(i) < 0
            index = i;
            break;
        end

    end

   T = t(index)*2;

end
