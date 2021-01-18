clear all
close all
clc

addpath('PostProcessing','Output','MainFunctions');
FFstruct = init_global_sim();



%%SIMULATION START
f = waitbar(0,'Please wait... Starting FFSIM');


for itime = 2 : length(FFstruct.t)
    
   for firefly_id = 1 : FFstruct.firefly_nr

        FFstruct = run_firefly_dynamics(firefly_id,itime,FFstruct);
    
   end

   
   wbtext = sprintf('Running simulation... (%d / 100)',round(itime/length(FFstruct.t)*100));
   waitbar(itime/length(FFstruct.t),f,wbtext);

end
   
waitbar(itime/length(FFstruct.t),f,'Completed simulation! (100 / 100)');
close(f);
%% SIMULATION END

%% SAVE RESULTS

filename = sprintf('Output/%s',datetime(now,'ConvertFrom','datenum'));
filename = regexprep(filename, ' ', '-');
filename = regexprep(filename, ':', '-');
mkdir(filename)
cd(filename);
save FFstruct.mat FFstruct
cd ..
cd ..
%%
   
   
postprocessing;
