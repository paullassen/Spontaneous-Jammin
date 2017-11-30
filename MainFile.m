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
%% Code above is for UI, below for basic car struct testing
clear
close all

T = 100;
ts = 0.01;
N = T/ts;
t = (0:N)*ts;
car = createCar(ts,[],2,[],[],[],[]);
car1 = createCar(ts,[],3,[],31,[],[]);
x = car.pos;
car1.pos = -250;
x1 = car1.pos;
tx = 300;
tv = 20; 
v = 0;
v1 = 0;
a = 0;
a1 = 0;

while length(v) <= N
    car = updateAll(car,tx(end));
    car1 = updateAll(car1,car.pos);
    x = cat(2,x,car.pos);
    v = cat(2,v,car.vel);
    a = cat(2,a,car.acc);
    x1 = cat(2,x1,car1.pos);
    v1 = cat(2,v1,car1.vel);
    a1 = cat(2,a1,car1.acc);
    tx = cat(2,tx,tx(end)+tv*ts);
end
subplot(2,2,1)
hold on
plot(t,tx)
plot(t,x)
plot(t,x1)
%plot([t(1) t(end)],[500 500],'--k')
%plot([t(1) t(end)],[500-car.s0 500-car.s0],'--k')
xlabel('Time (s)', 'Interpreter' ,'latex')
ylabel('Position (m)', 'Interpreter', 'latex')
grid on
legend('Target','Car','Car1')
subplot(2,2,3)
hold on
plot(t,a)
plot(t,v)
%plot([t(find(x>499.9,1,'first')) t(find(x>499.9,1,'first'))], [-5 30], '--k')
plot([t(1) t(end)], [car.vd car.vd], '--k')
xlabel('Time (s)', 'Interpreter' ,'latex')
ylabel('Vel $\frac{m}{s}$ / Accel $\frac{m}{s^2}$', 'Interpreter' ,'latex')
grid on
legend('Acceleration','Velocity','Target Velocity')
subplot(2,2,2)
hold on
plot(t,a1)
plot(t,v1)
%plot([t(find(x>499.9,1,'first')) t(find(x>499.9,1,'first'))], [-5 30], '--k')
plot([t(1) t(end)], [car1.vd car1.vd], '--k')
xlabel('Time (s)', 'Interpreter' ,'latex')
ylabel('Vel $\frac{m}{s}$ / Accel $\frac{m}{s^2}$', 'Interpreter' ,'latex')
grid on
legend('Acceleration','Velocity','Target Velocity')

subplot(2,4,7)
hold on
plot(t,v)
plot(t,v1)
%plot([t(find(x>499.9,1,'first')) t(find(x>499.9,1,'first'))], [-5 30], '--k')
plot([t(1) t(end)], [car.vd car.vd], '--m')
plot([t(1) t(end)], [car1.vd car1.vd], '--k')
xlabel('Time (s)', 'Interpreter' ,'latex')
ylabel('Velocity $\frac{m}{s}$', 'Interpreter' ,'latex')
grid on
legend('Velocity of Car','Velocity of Car1', 'Target Velocity of Car',...
    'Target Velocity of Car1')
subplot(2,4,8)
hold on
plot(t,a)
plot(t,a1)
ylabel('Acceleration $\frac{m}{s^2}$', 'Interpreter' ,'latex')
xlabel('Time (s)', 'Interpreter' ,'latex')
%plot([t(find(x>499.9,1,'first')) t(find(x>499.9,1,'first'))], [-5 30], '--k')
grid on
legend('Acceleration of Car', 'Acceleration of Car1')
% car1 = createCar(ts,[],10,[],[],[],[]);
% 
% x1 = 0;
% v1 = 0;
% a1 = 0;
% 
% while length(v1) <= N
%     car1 = updatePos(updateVel(updateAcc1(car1)));
%     x1 = cat(2,x1,car1.pos);
%     v1 = cat(2,v1,car1.vel);
%     a1 = cat(2,a1,car1.acc);
% end
% subplot(2,2,2)
% plot(t,x1)
% hold on
% plot([t(1) t(end)],[500 500],'--k')
% xlabel('Time (s)', 'Interpreter' ,'latex')
% ylabel('Position (m)', 'Interpreter', 'latex')
% grid on
% subplot(2,2,4)
% hold on
% xlabel('Time (s)', 'Interpreter' ,'latex')
% ylabel('Vel $\frac{m}{s}$ / Accel $\frac{m}{s^2}$', 'Interpreter' ,'latex')
% plot(t,a1)
% plot(t,v1)
% plot([t(find(x1>499.9,1,'first')) t(find(x1>499.9,1,'first'))], [-5 30], '--k')
% plot([t(1) t(end)], [car.vd car.vd], '--k')
% grid on
% legend('Acceleration','Velocity','Target Velocity')
% 
% 
% 
