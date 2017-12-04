function [ carStruct ] = updateAcc( carStruct_in, nextCarPos )
%UPDATEACC Summary of this function goes here
%   Detailed explanation goes here
    carStruct = carStruct_in;
    ds = nextCarPos-carStruct.pos;
    if  ds < carStruct.st
        t = carStruct.t0-carStruct.tau;
        carStruct.acc = 2*(ds-(carStruct.s0+carStruct.vel*t))./t.^2;
        % This is a comment to test merging and the like
    else
        carStruct.acc = (carStruct.vd-carStruct.vel)/carStruct.ta;
    end

end

