G = 1;    %6.67.*10^-11;
m = 0.01;    %5.972.*10^24;
M = 10;
x0 = 10;   %400 .* 10^3;
y0 = 0;   %0;
vx0 = 0;  %0;
vy0 = 0.75;  %7700;
tmax = 100; %3000;
dt = 10^-3;  %10^-3;

[x, y, vx, vy, ax, ay, E_k, E_p, P, R_CM] = orbit_1body(G,M, m,x0,y0,vx0,vy0,dt,tmax);

E = E_p + E_k;

figure(1)
plot(x, y)
hold on
plot(0,0, '*')
hold off

return;
figure(2)
plot(E_k)
hold on
plot(E_p)
plot(E)
hold off

figure(3)
plot(P)

figure(4)
plot(R_CM)
hold on
plot(0,0, '*')
hold off

