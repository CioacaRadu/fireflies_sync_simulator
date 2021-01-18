function [ FFstruct ] = init_global_sim(final_time, tstep, firefly_nr, cycle_period, coupling)

%%--CONFIGURABLE PARAMETERS--

FFstruct.tstep = tstep;
FFstruct.coupling = coupling;
FFstruct.final_time = final_time;
FFstruct.firefly_nr = firefly_nr; %Number of fireflies
FFstruct.firefly_cycle_period = cycle_period; %time for a full oscilation
%%--CONFIGURABLE PARAMETERS END--




FFstruct.t = 0:FFstruct.tstep:FFstruct.final_time; %time axis init


FFstruct.phase_max = FFstruct.firefly_cycle_period / FFstruct.tstep ; 

FFstruct.simulation_time = datetime(now,'ConvertFrom','datenum');

FFstruct = init_firefly_dynamics(FFstruct); % init all the fireflies with a random state
end
