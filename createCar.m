function [ carStruct ] = createCar( ts,t0,s0,ta,vd,tau,var )
%CREATECAR Creates a car struct with attributes

    if isempty(s0)
        carStruct.s0 = 1;     % Distance between cars at 0 m/s
    else
        carStruct.s0 = s0; %1;     % Distance between cars at 0 m/s
    end
    
    if isempty(vd)
        carStruct.vd = 28;    % Preferred speed limit
    else
        carStruct.vd = vd; %28;    % Preferred speed limit
    end
    
    if isempty(ta)
        carStruct.ta = 2.5;   % Accel constant
    else
        carStruct.ta = ta;   % Accel constant
    end
    
    if isempty(t0)
        carStruct.t0 = 6;     % Time to next car
    else
        carStruct.t0 = t0; %3;     % Time to next car
    end
    
    if isempty(tau)
        carStruct.tau = .03; % Reaction time   
    else 
        carStruct.tau = tau; %.03; % Reaction time   
    end
    
    if isempty(var)
        carStruct.var = 'Whatever works';      % Driver 'skill'
    else
        carStruct.var = var;      % Driver 'skill'
    end
    
    carStruct.vel = 0;
    carStruct.acc = 0;
    carStruct.pos = 0;
    carStruct.ts  = ts;
    
    carStruct.st = 0;
end

