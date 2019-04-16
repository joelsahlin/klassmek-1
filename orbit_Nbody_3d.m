function [x, y, vx, vy, ax, ay, t] = orbit_Nbody(G, m, x0, y0, z0, vx0, vy0, vz0, dt, tmax)

    t = 0:dt:tmax;
    steps = floor(tmax/dt);
    N = size(m, 2);

    x = zeros(N, steps);
    y = zeros(N, steps);
    z = zeros(N, steps);
    
    vx = zeros(N, steps);
    vy = zeros(N, steps);
    vz = zeros(N, steps);
    
    ax = zeros(N, steps);
    ay = zeros(N, steps);
    az = zeros(N, steps);
    
    x(:, 1) = x0;
    y(:, 1) = y0;
    z(:, 1) = z0;
    
    vx(:, 1) = vx0;
    vy(:, 1) = vy0;
    vz(:, 1) = vz0;

    [ax0, ay0, az0] = acceleration3d(G, m, x0, y0, z0);
    ax(:,1) = ax0;
    ay(:,1) = ay0;
    az(:,1) = az0;

    for j = 1:steps-1
        x(:, j+1) = x(:, j) + vx(:, j)*dt + (1/2)*ax(:, j)*(dt.^2);
        y(:, j+1) = y(:, j) + vy(:, j)*dt + (1/2)*ay(:, j)*(dt.^2);
        z(:, j+1) = z(:, j) + vz(:, j)*dt + (1/2)*az(:, j)*(dt.^2);

        [axt, ayt, azt] = acceleration3d(G, m, x(:, j+1), y(:, j+1));
        ax(:, j+1) = axt;
        ay(:, j+1) = ayt;
        az(:, j+1) = azt;

        vx(:, j+1) = vx(:, j) + (1/2)*(ax(:, j) + ax(:, j+1))*dt;
        vy(:, j+1) = vy(:, j) + (1/2)*(ay(:, j) + ay(:, j+1))*dt;
        vz(:, j+1) = vz(:, j) + (1/2)*(az(:, j) + az(:, j+1))*dt;
    end
end


