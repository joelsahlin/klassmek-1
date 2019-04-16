close all
clear all

%%%%%%%
% Sat %
%%%%%%%

G = 1;
m = 0.01;
M = 10;
x0 = 10;
y0 = 0;
vx0 = 0;
vy0 = 0.75;
dt = 0.001;
tmax = 100;

[x, y, vx, vy, ax, ay] = orbit_1body(G, M, x0, y0, vx0, vy0, dt, tmax);

r = @(x, y) sqrt((x.^2) + (y.^2));
t = dt:dt:tmax;
steps = floor(tmax/dt);
skip = 1000;

E_k = zeros(steps, 1);
E_p = zeros(steps, 1);
P = zeros(steps, 1);
R_CM = zeros(steps, 1);
 
v = sqrt((vx.^2) + (vy.^2));
E_k = (m*(v.^2))/2;
E_p = -G * M*m./r(x,y);
E = E_k + E_p;

P = M.*vx + M.*vy;

R_CM = (1/(M + m))*m*r(x(1:10000:end), y(1:10000:end));

xskip = x(1:skip:end);
yskip = y(1:skip:end);
vxskip = vx(1:skip:end);
vyskip = vy(1:skip:end);
axskip = ax(1:skip:end);
ayskip = ay(1:skip:end);

calc_time(x, y, t);

theta = 0:pi/100:2*pi;
xunit = cos(theta).*R_CM;
yunit = sin(theta).*R_CM;

xunit = xunit(end,:);
yunit = yunit(end,:);

% Plotting time
figure(1)
plot(xskip, yskip)
hold on
quiver(xskip, yskip, vxskip, vyskip)
quiver(xskip, yskip, axskip, ayskip)
plot(0, 0, '.')
legend('Orbit', 'Velocity', 'Acceleration', 'Planet')
plot(xunit, yunit)
title('Satellite orbit')
xlabel('x')
ylabel('y')

figure(2)
plot(E_k)
hold on
plot(E_p)
plot(E)
legend('E_k', 'E_p', 'E')
title('Energies in the system')
xlabel('t')
ylabel('Energy level')

figure(3)
plot(P)
legend('P')
title('Momentum')
xlabel('t')
ylabel('Energy level')

%%%%%%%
% ISS %
%%%%%%%

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

figure(4)
plot(x(2, :), y(2,:))
hold on
plot(x(1,:), y(1,:), '*')
legend('ISS','Earth')
title('ISS orbit around Earth')
xlabel('x')
ylabel('y')

t = 0:dt:tmax;
T = calc_time(x(2,:), y(2,:),t)/(3600*24)

%%%%%%%%%%%%%%%%
% SOLAR SYSTEM %
%%%%%%%%%%%%%%%%

G = 6.67*10^(-11);

AU = 1.496*10^11;

SUN_mass = 1.9885*10^30;
SUN_vx0 = 0;
SUN_vy0 = 0;
SUN_x0 = 0;
SUN_y0 = 0;

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

EARTH_mass = 5.972*10^24;
EARTH_vx0 = 0;
EARTH_vy0 = 30*10^3;
EARTH_r = 6.3781*10^6;
EARTH_x0 = AU;
EARTH_y0 = 0;

MARS_mass = 0.11*EARTH_mass;
MARS_vx0 = 0;
MARS_vy0 = 24.08*10^3;
MARS_r = 6.3781*10^6;
MARS_x0 = 1.524*AU;
MARS_y0 = 0;



MASS =  [SUN_mass   MERC_mass   VENU_mass   EARTH_mass  MARS_mass];
X0 =    [SUN_x0     MERC_x0     VENU_x0     EARTH_x0    MARS_x0];
Y0 =    [SUN_y0     MERC_y0     VENU_y0     EARTH_y0    MARS_y0];
VX0 =   [SUN_vx0    MERC_vx0    VENU_vx0    EARTH_vx0   MARS_vx0];
VY0 =   [SUN_vy0    MERC_vy0    VENU_vy0    EARTH_vy0   MARS_vy0];

dt = 86400;
tmax = 3*10^8;

[x, y, vx, vy, ax, ay, t] = orbit_Nbody(G, MASS, X0, Y0, VX0, VY0, dt, tmax);


figure(5)
plot(x(1,:), y(1,:), '*')
hold on
plot(x(2, :), y(2,:))
plot(x(3, :), y(3,:))
plot(x(4, :), y(4,:))
plot(x(5, :), y(5,:))
legend('Sun','Mercury','Venus','Earth','Mars')
title('Solar system')
xlabel('x')
ylabel('y')

T = [];
for i=2:5
    T(i-1) = calc_time(x(i,:), y(i,:),t)/(3600*24);
end
T
