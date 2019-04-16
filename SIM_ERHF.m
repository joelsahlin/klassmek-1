G = 6.67*10^(-11);

AU = 1.496*10^11;

EARTH_mass = 5.972*10^24;
EARTH_vx0 = 0;
EARTH_vy0 = 30*10^3;
EARTH_r = 6.3781*10^6;
EARTH_x0 = AU;
EARTH_y0 = 0;

MERC_mass = 0.0553*EARTH_mass;
MERC_vx0 = 0;
MERC_vy0 = 47.36*10^3;
MERC_r = 6.3781*10^6;
MERC_x0 = 0.39*AU;
MERC_y0 = 0;

VENU_mass = 0.815*EARTH_mass;
VENU_vx0 = 0;
VENU_vy0 = 35.02*10^3;
VENU_r = 6.3781*10^6;
VENU_x0 = 0.723*AU;
VENU_y0 = 0;

MARS_mass = 0.11*EARTH_mass;
MARS_vx0 = 0;
MARS_vy0 = 24.08*10^3;
MARS_r = 6.3781*10^6;
MARS_x0 = 1.524*AU;
MARS_y0 = 0;

SUN_mass = 1.9885*10^30;
SUN_vx0 = 0;
SUN_vy0 = 0;
SUN_x0 = 0;
SUN_y0 = 0;

MASS =  [SUN_mass   MERC_mass   VENU_mass   EARTH_mass  MARS_mass];
X0 =    [SUN_x0     MERC_x0     VENU_x0     EARTH_x0    MARS_x0];
Y0 =    [SUN_y0     MERC_y0     VENU_y0     EARTH_y0    MARS_y0];
VX0 =   [SUN_vx0    MERC_vx0    VENU_vx0    EARTH_vx0   MARS_vx0];
VY0 =   [SUN_vy0    MERC_vy0    VENU_vy0    EARTH_vy0   MARS_vy0];

dt = 86400;
tmax = 3*10^8;

[x, y, vx, vy, ax, ay, t] = orbit_Nbody(G, MASS, X0, Y0, VX0, VY0, dt, tmax);


figure(1)
plot(x(1,:), y(1,:), '*')
hold on
plot(x(2, :), y(2,:))
plot(x(3, :), y(3,:))
plot(x(4, :), y(4,:))
plot(x(5, :), y(5,:))

T = [];
for i=2:5
    T(i-1) = calc_time(x(i,:), y(i,:),t);
end
