function [ carStruct ] = updateAll( carStruct_in )
%UPDATEALL Summary of this function goes here
%   Detailed explanation goes here
    carStruct = updatePos(updateVel(updateAcc(carStruct_in)));

end

