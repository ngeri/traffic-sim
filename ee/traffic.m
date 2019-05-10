clc
clear
close all

%% Constants
consts.a_max = 1.5;      %% 0.8 to 2.5 m/s^s
consts.b_max = 1.67;     %% around 2 m/s^s
consts.v_0 = 130/3.6;    %% limit speed
consts.T = 1.8;          %% German recommendation at driving schools
consts.h_0 = 2;          %% standstill minimum gap
consts.delta = 4;        %% acceleration exponent
L = 4.5;                 %% cars length
omega = 0*2*pi;

%% Grid parameters
dt = 0.01;
Tend = 100;
t(1) = 0;
N = ((Tend - t(1)) / dt) - 1;
y(1)= 1;

x1(1) = 100;        % Initial position of car 1
x2(1) = 0;          % Initial position of car 2
v1(1) = 100/3.6;    % Initial velocity of car 1
v2(1) = 100/3.6;    % Initial velocity of car 2

%% Compute the solution on the grid
for i=1:N
    % Calculate current time stamp
    t(i + 1) = t(i) + dt;
    
    a1 = 0;
    v1(i + 1) = v1(i) + dt * a1;
    x1(i + 1) = x1(i) + dt * v1(i);

    params.v = v2(i);
    params.h = x1(i) - x2(i) - L;
    params.delta_v = v2(i) - v1(i);
   
    a2 = idm(params, consts);
    v2(i + 1) = v2(i) + dt * a2; 
    x2(i + 1) = x2(i) + dt * v2(i);
end

%figure

% subplot(3,2,1)
% plot(t,v1)
% title('Velocity of car 1')
% xlabel('t [s]')
% ylabel('v [m/s]')
% 
% subplot(3,2,2)
% plot(t,v2)
% title('Velocity of car 2')
% xlabel('t [s]')
% ylabel('v [m/s]')

% subplot(3,2,3)
% plot(t,x1)
% title('Position of car 1')
% xlabel('t [s]')
% ylabel('x [m]')
% 
% subplot(3,2,4)
% plot(t,x2)
% title('Position of car 2')
% xlabel('t [s]')
% ylabel('x [m]')

figure_size = [0,0,10,5];
figure('Units','centimeters','Position',figure_size)
set(gca,'fontname','meslo','fontsize',10')
plot(t,x1-x2)
title('Headway of car 2')
xlabel('t [s]')
ylabel('s [m]')
print('basic_2_car_headaway','-depsc')

