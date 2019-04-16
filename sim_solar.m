earth_mass = 5.972 .* 10^24;
earth_vx0 = 0;
earth_vy0 = 0;
earth_x0 = 0;
earth_y0 = 0;

G = 6.67.*10^-11;



ISS_mass = 450 .* 10^3;
ISS_x0 = 400 .*10^3;
ISS_y0 = 0;
ISS_vy0 = 7700;
ISS_vx0 = 0;

m = [earth_mass ISS_mass];
x0 = [earth_x0 ISS_x0];
y0 = [earth_y0 ISS_y0];
vx0 = [earth_vx0 ISS_vx0];
vy0 = [earth_vy0 ISS_vy0];
dt = 10;
tmax = 10;

[x, y, vx, vy, ax, ay, t] = orbit_Nbody(G, m, x0, y0, vx0, vy0, dt, tmax);

figure(1)
plot(x(2, :), y(2, :))
hold on
plot(x(1, :), y(1, :), '*')
hold off

calc_time(x(2,:), y(2,:), t);
