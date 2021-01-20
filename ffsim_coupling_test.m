
function [ ] = ffsim_coupling_test( final_time, tstep, firefly_nr, cycle_period, coupling)

addpath('PostProcessing','Output','MainFunctions','GUI');
FFstruct = init_global_sim(final_time, tstep, firefly_nr, cycle_period, coupling);



%%SIMULATION START
f = waitbar(0,'Please wait... Starting FFSIM');


coupling_mc = 0.002:0.001:0.005
timesteps_to_converge = zeros(1,length(coupling_mc ));


for icoupling = 1 : length(coupling_mc)

    FFstruct.coupling = coupling_mc(icoupling);
    txt = sprintf('Sim for coupling %f', FFstruct.coupling);
    disp(txt);
    
    for itime = 2 : length(FFstruct.t)

       for firefly_id = 1 : FFstruct.firefly_nr

            FFstruct = run_firefly_dynamics(firefly_id,itime,FFstruct);

       end

       if firefly_check_convergence(FFstruct,itime)


           timesteps_to_converge(icoupling) = itime;           
           txt = sprintf('CONVERGENCE DONE t = %f',itime*FFstruct.tstep);
           disp(txt);
           
           break;

       end

       wbtext = sprintf('Running simulation... (%d / 100)',round(itime/length(FFstruct.t)*100));
       waitbar(itime/length(FFstruct.t),f,wbtext);

    end
    
    if(itime == length(FFstruct.t))
         timesteps_to_converge(icoupling) = -1;
    end

end

save MCRES.mat timesteps_to_converge coupling_mc
   
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

end

