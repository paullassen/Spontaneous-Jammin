function [ carStruct ] = updateVel( carStruct_in )
%UPDATEVEL Summary of this function goes here
%   Detailed explanation goes here
    carStruct = carStruct_in;
    carStruct.vel = carStruct.vel + carStruct.acc*carStruct.ts;
    t = carStruct.t0-carStruct.tau;
    carStruct.st = carStruct.s0 + carStruct.vel*t;
end

