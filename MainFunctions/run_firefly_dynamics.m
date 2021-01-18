function [ FFstruct ] = run_firefly_dynamics( firefly_id, itime, FFstruct )

    coupling = FFstruct.coupling;
    somebody_fired_before = 0;
    

    

    for i = 1:FFstruct.firefly_nr


        if FFstruct.fire(i,itime-1) && i ~= firefly_id %if someone fired at previous time step but not me
            somebody_fired_before = somebody_fired_before + 1;
        end

    end

    
    %PREVIOUS TIME STEP CORRECTION
    if somebody_fired_before && FFstruct.phase(firefly_id,itime-1) ~= 0  % if someone fired at previous time step and i didn t fire together with it
        
        FFstruct.phase(firefly_id,itime-1) = min( FFstruct.phase_max, FFstruct.phase(firefly_id,itime-1) + somebody_fired_before * round(coupling*FFstruct.phase_max));
        
        if( FFstruct.phase(firefly_id,itime-1) >= FFstruct.phase_max ) %check if it should have fired at the previous time step
        
        FFstruct.phase(firefly_id,itime-1) = 0; %restart phase
        FFstruct.fire(firefly_id,itime-1) = 1; %fire
        else
            FFstruct.fire(firefly_id,itime-1) = 0; %no fire triggered
        end
    
    
    end
    

    
    
    
    
    % UPDATE CURRENT STEP
    

    FFstruct.phase(firefly_id,itime) = FFstruct.phase(firefly_id,itime-1) + 1; % continue as regular

    if firefly_id == 5 && itime == 6000
    
        FFstruct.phase(firefly_id,itime) = FFstruct.phase(firefly_id,itime) + 12
    
    end
    
    
    
    if( FFstruct.phase(firefly_id,itime) >= FFstruct.phase_max ) %check if it should have fired at the previous time step
        
        FFstruct.phase(firefly_id,itime) = 0; %restart phase
        FFstruct.fire(firefly_id,itime) = 1; %fire
    else
        FFstruct.fire(firefly_id,itime) = 0; %no fire triggered
    end
    
    
    
       
    FFstruct.x(firefly_id,itime) = 1 - exp( -4/FFstruct.firefly_cycle_period * FFstruct.phase(firefly_id,itime)*FFstruct.tstep );
    
   
    
    
    
    
    
    
%     if( norm( FFstruct.x(firefly_id,itime-1) - 1 ) < 1e-4 ) 
%     
% 
%         FFstruct.istate(firefly_id) = 1;     
%         
%         %%fire happend
%         FFstruct.fire(firefly_id) = 1;
%     end
    
    
    
    
  
    

end

