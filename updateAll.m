function [ carStruct ] = updateAll( carStruct_in, nextCarPos )
%UPDATEALL Summary of this function goes here
%   Detailed explanation goes here
    carStruct = updatePos(updateVel(updateAcc(carStruct_in, nextCarPos)));

end

