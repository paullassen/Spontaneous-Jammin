function [ carStruct ] = updateVel( carStruct_in )
%UPDATEVEL Updates velocity of car

    carStruct = carStruct_in;
    carStruct.vel = carStruct.vel + carStruct.acc*carStruct.ts;
    t = carStruct.t0-carStruct.tau;
    carStruct.st = carStruct.s0 + carStruct.vel*t;
end

