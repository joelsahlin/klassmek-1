close all
clear all
G = 1;
m = 0.01;
M = 10;
x0 = 10;
y0 = 0;
vx0 = 0;
vy0 = 0.75;
dt = 0.5;
tmax = 30000;

[x, y, vx, vy, ax, ay] = orbit_1body(G, M, x0, y0, vx0, vy0, dt, tmax);

r = @(x, y) sqrt((x.^2) + (y.^2));
t = dt:dt:tmax;
steps = floor(tmax/dt);
skip = 10000;

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

calc_time(x, y, t)

theta = 0:pi/100:2*pi;
xunit = cos(theta).*R_CM;
yunit = sin(theta).*R_CM;

xunit = xunit(end,:);
yunit = yunit(end,:);

plot(x,y)
% Plotting time
figure(1)
plot(xskip, yskip)
hold on
quiver(xskip, yskip, vxskip, vyskip)
quiver(xskip, yskip, axskip, ayskip)
plot(0, 0, '*')
legend('Orbit', 'Velocity', 'Acceleration', 'Planet')
plot(xunit, yunit)

figure(2)
plot(E_k)
hold on
plot(E_p)
plot(E)

figure(3)
plot(P)

figure(4)

%plot(R_CM)
