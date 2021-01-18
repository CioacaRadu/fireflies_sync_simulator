function [ FFstruct ] = init_global_sim()

%%--CONFIGURABLE PARAMETERS--

FFstruct.tstep = 0.01;
FFstruct.coupling = 0.05;
FFstruct.final_time = 100;
FFstruct.firefly_nr = 12; %Number of fireflies
FFstruct.firefly_cycle_period = 2; %time for a full oscilation
%%--CONFIGURABLE PARAMETERS END--




FFstruct.t = 0:FFstruct.tstep:FFstruct.final_time; %time axis init


FFstruct.phase_max = FFstruct.firefly_cycle_period / FFstruct.tstep ; 

FFstruct.simulation_time = datetime(now,'ConvertFrom','datenum');

FFstruct = init_firefly_dynamics(FFstruct); % init all the fireflies with a random state
end
