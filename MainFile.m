% clear
% close all
% axis([-1 1 -1 1]);
% h = animatedline('Marker','*','LineWidth',2,'color',[1 0.5 0]);
% g = animatedline('Marker','*','LineWidth',2,'color',[0 0.5 1]);
% lane1 = animatedline([-1 1],[-0.1 -0.1]);
% lane2 = animatedline([-1 1],[0.1 0.1],'LineStyle','--','color',[0.8 0.8 0]);
% lane3 = animatedline([-1 1],[0.3 0.3]);
% for i = 1:10
%     for j = -1:0.01:1
%         clearpoints(h);
%         clearpoints(g);
%         addpoints(h,j,0);
%         %addpoints(h,j+0.1,0);
% 
%         addpoints(g,j*1.2,0);
%         %addpoints(g,(j+0.1)*1.2,0);
%         drawnow %limitrate
%         
%     end
% end
%%
clear
close all

T = 50;
ts = 0.01;
N = T/ts;
t = (0:N)*ts;
car = createCar(ts,[],10,[],[],[],[]);

x = 0;
v = 0;
a = 0;

while length(v) <= N
    car = updateAll(car);
    x = cat(2,x,car.pos);
    v = cat(2,v,car.vel);
    a = cat(2,a,car.acc);
end
subplot(2,2,1)
plot(t,x)
hold on
plot([t(1) t(end)],[500 500],'--k')
plot([t(1) t(end)],[500-car.s0 500-car.s0],'--k')
xlabel('Time (s)', 'Interpreter' ,'latex')
ylabel('Position (m)', 'Interpreter', 'latex')
grid on
subplot(2,2,3)
hold on
plot(t,a)
plot(t,v)
plot([t(1) t(end)], [car.vd car.vd], '--k')
xlabel('Time (s)', 'Interpreter' ,'latex')
ylabel('Vel $\frac{m}{s}$ / Accel $\frac{m}{s^2}$', 'Interpreter' ,'latex')
grid on
legend('Acceleration','Velocity','Target Velocity')

car1 = createCar(ts,[],10,[],[],[],[]);

x1 = 0;
v1 = 0;
a1 = 0;

while length(v1) <= N
    car1 = updatePos(updateVel(updateAcc1(car1)));
    x1 = cat(2,x1,car1.pos);
    v1 = cat(2,v1,car1.vel);
    a1 = cat(2,a1,car1.acc);
end
subplot(2,2,2)
plot(t,x1)
hold on
plot([t(1) t(end)],[500 500],'--k')
xlabel('Time (s)', 'Interpreter' ,'latex')
ylabel('Position (m)', 'Interpreter', 'latex')
grid on
subplot(2,2,4)
hold on
xlabel('Time (s)', 'Interpreter' ,'latex')
ylabel('Vel $\frac{m}{s}$ / Accel $\frac{m}{s^2}$', 'Interpreter' ,'latex')
plot(t,a1)
plot(t,v1)
plot([t(1) t(end)], [car.vd car.vd], '--k')
grid on
legend('Acceleration','Velocity','Target Velocity')



