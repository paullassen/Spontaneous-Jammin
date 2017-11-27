function [ carStruct ] = updateAcc( carStruct_in )
%UPDATEACC Summary of this function goes here
%   Detailed explanation goes here
    carStruct = carStruct_in;
    ds = 500-carStruct.pos;
    if  ds < carStruct.st
        t = carStruct.t0-carStruct.tau;
        carStruct.acc = 2*(ds-(carStruct.s0+carStruct.vel*t))./t.^2;
    else
        carStruct.acc = (carStruct.vd-carStruct.vel)/carStruct.ta;
    end

end

