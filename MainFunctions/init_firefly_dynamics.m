function [ FFstruct ] = init_firefly_dynamics(FFstruct)



%%AUTO INITIALIZATION
for firefly_id = 1 : FFstruct.firefly_nr
    
    FFstruct.x(firefly_id,1) = 0;
    FFstruct.fire(firefly_id,1) = 0;
    FFstruct.phase(firefly_id,1) = randi(FFstruct.phase_max,1,1);
    
    
%     FFstruct.phase(1,1) = 1;
%     
%     FFstruct.phase(2,1) = 20;
    

end

%%INDEPENDENT INITIALIZATION
% 
% FFstruct.x(1,1) = 0
% FFstruct.istate(1) = 5
% 
% 
% FFstruct.x(2,1) = 0
% FFstruct.istate(2) = 25