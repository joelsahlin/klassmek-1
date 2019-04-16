function [x, y, vx, vy, ax, ay] = orbit_1body(G, M, x0, y0, vx0, vy0, dt, tmax)

    t = dt:dt:tmax;
    steps = floor(tmax/dt);

    x = zeros(steps, 1);
    y = zeros(steps, 1);
    vx = zeros(steps, 1);
    vy = zeros(steps, 1);
    ax = zeros(steps, 1);
    ay = zeros(steps, 1);
   
    x(1) = x0;
    y(1) = y0;
    vx(1) = vx0;
    vy(1) = vy0;

    r = @(x, y) sqrt((x.^2) + (y.^2));

    acx = @(x, y) -G .* M .*(x ./ (r(x, y)).^3);
    acy = @(x, y) -G .* M .*(y ./ (r(x, y)).^3);


    for i = 1:steps-1
        x(i+1) = x(i) + vx(i)*dt + (1/2)*ax(i)*(dt.^2);
        y(i+1) = y(i) + vy(i)*dt + (1/2)*ay(i)*(dt.^2);

        ax(i+1) = acx(x(i), y(i));
        ay(i+1) = acy(x(i), y(i));

        vx(i+1) = vx(i) + (1/2)*(ax(i)+ax(i+1))*dt;
        vy(i+1) = vy(i) + (1/2)*(ay(i)+ay(i+1))*dt;
     
    end

end

