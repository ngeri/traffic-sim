clc
clear
close all

models = {
    0, 100/3.6, ChillModel;
    -20, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -40, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -60, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -80, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -100, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -120, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -140, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -160, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -180, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -200, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -220, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -240, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -260, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -280, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -300, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -320, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -340, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -360, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -380, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -400, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -420, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -440, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -460, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -480, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -500, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -520, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -540, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -560, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
    -580, 100/3.6, IDModel(struct('a_max',1.5, 'b_max',1.67, 'v_0',130/3.6, 'T',1.8, 'h_0',2, 'delta',4, 'L', 4.5));
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
   legendInfoVelocity{i} = ['v_' num2str(i)];
end

for i=2:plotcount
    hold on;
    subplot(2,1,2)
    plot(t,y(:,2*i-3)-y(:,2*i-1))
    legendInfoHeadaway{i-1} = ['h_' num2str(i-1) '_-_' num2str(i)];
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