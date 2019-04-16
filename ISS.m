G = 6.67*10^-11;

ISS_mass = 450*10^3;
ISS_vy0 = 7700;
ISS_vx0 = 0;
ISS_x0 = 400*10^3 + 6.3781*10^6;
ISS_y0 = 0;

EARTH_mass = 5.972*10^24;
EARTH_vx0 = 0;
EARTH_vy0 = 0;
EARTH_x0 = 0;
EARTH_y0 = 0;


dt = 0.1;
tmax = 7000;

[x, y, vx, vy, ax, ay, t] = orbit_Nbody(G, [EARTH_mass ISS_mass], [EARTH_x0 ISS_x0], [EARTH_y0 ISS_y0], [EARTH_vx0 ISS_vx0], [EARTH_vy0 ISS_vy0], dt, tmax);

figure
plot(x(2, :), y(2,:))
hold on
plot(x(1,:), y(1,:), '*')


t = 0:dt:tmax;
T = calc_time(x(2,:), y(2,:),t)
