clear all;
close all;
clc;

global g;
g = 9.81;
m = 1;
R = 0.2;
omega0 = 0;
omega = 2*sqrt(g/R);
theta0 = acos(g/(omega*omega*R))+0.1;

t = linspace(0,5, 500);
phi = omega*t;

options = odeset;
[t,resenje] = ode45(@jnaKretanjaTeta, t, [theta0,omega0], options, R, omega);

figure(1)
plot(t,resenje(:,1));
xlabel('vreme [s]')
ylabel('teta-otklon kuglice')
title('Zavisnost ugla otklona kuglice u funkciji vremena')

figure(2)
[x,y,z] = sph2cart(resenje(:,1),phi,R);
plot3(x,y,z,'Linewidth', 2);
xlabel('x');
ylabel('y')
zlabel('z')
title('Trajektorija kuglice')


figure(3)
plot(resenje(:,1),resenje(:,2))
xlabel('teta-otklon kuglice')
ylabel('ugaona brzina kuglice')
title('Fazni dijagram zavisnosti ugaone brzine kuglice od ugla njenog otklona')


Fresenje = silaOgranicenja(resenje(:,1), resenje(:,2),R, omega, m);
figure(4)
plot(t,Fresenje(:))
xlabel('vreme [s]')
ylabel('sila ogranicenja po r')
title('Zavisnost sile ogranicenja u funkciji vremena')


Fresenje1 = silaOgranicenja2(resenje(:,1), resenje(:,2),R, omega, m);
figure(5)
plot(t,Fresenje1(:))
xlabel('vreme [s]')
ylabel('sila ogranicenja po fi')
title('Zavisnost sile ogranicenja u funkciji vremena')
