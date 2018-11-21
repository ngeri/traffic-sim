clc
clear
close all

models = {
    0, 100/3.6, ChillModel, 1;
    -20, 110/3.6, ChillModel, 2;
    -40, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5)), 1;
    -60, 110/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5)), 2;
    -80, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5)), 1;
    -100, 110/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5)), 2;
    -120, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5)), 1;
    -140, 110/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5)), 2;
    -160, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5)), 1;
    -180, 110/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5)), 2;
};

for i=1:size(models)
   y0(2*i-1) = models{i,1};
   y0(2*i) = models{i,2};
end

y0 = y0';

T = 150;
opts = odeset('RelTol',1e-6);
[t,y] = ode45(@(t,y) lane(t, y, models), [0 T], y0, opts);

plotcount = size(models,1);
figure();

for i=1:plotcount
   hold on;
   subplot(2,1,1)
   plot(t,y(:,2*i)*3.6)
   legendInfoVelocity{i} = ['v_{' num2str(i) '}'];
end

for i=2:plotcount
    hold on;
    subplot(2,1,2)
    plot(t,y(:,2*i-3)-y(:,2*i-1))
    legendInfoHeadaway{i-1} = ['h_{' num2str(i-1) '-' num2str(i) '}'];
end
hold on;
subplot(2,1,1)
title('Velocity and Headway')
legend(legendInfoVelocity)
ylabel('v [km/h]')
xlabel('t [s]')
hold on;
subplot(2,1,2)
legend(legendInfoHeadaway)
ylabel('x [m]')
xlabel('t [s]')