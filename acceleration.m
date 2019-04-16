function [ax, ay] = acceleration(G, m, x, y)

    N = size(m,2);

    ax = zeros(N, 1);
    ay = zeros(N, 1);

    
    for i=1:N
        for j=1:N
            if (j == i)
                continue;
            end
            r = sqrt((x(j) - x(i))^2 + (y(j) - y(i))^2);
            ax(i) = ax(i) + (-G.*m(j).*(x(i) - x(j))./(r^3));
            ay(i) = ay(i) + (-G.*m(j).*(y(i) - y(j))./(r^3));
        end
    end

end

