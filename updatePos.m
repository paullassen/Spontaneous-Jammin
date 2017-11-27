function [ carStruct ] = updatePos( carStruct_in )
%UPDATEPOS Summary of this function goes here
%   Detailed explanation goes here
    carStruct = carStruct_in;
    carStruct.pos = carStruct.pos + carStruct.vel*carStruct.ts;

end

