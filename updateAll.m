function [ carStruct ] = updateAll( carStruct_in, nextCarPos )
%UPDATEALL Updates position, velocity and acceleration

    carStruct = updatePos(updateVel(updateAcc(carStruct_in, nextCarPos)));

end

