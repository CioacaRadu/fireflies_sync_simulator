load MCRES2

coupling_mc2 = coupling_mc(2:end);
timesteps_to_converge2 = timesteps_to_converge(2:end);;

load MCRES1

coupling_mc1 = coupling_mc;
timesteps_to_converge1 = timesteps_to_converge;


coupling_mc = [ coupling_mc2 coupling_mc1 ];
timesteps_to_converge = [timesteps_to_converge2 timesteps_to_converge1];

figure;
plot(log(coupling_mc*100), timesteps_to_converge*0.01,'LineWidth',1.5);
title('Convergence time vs Coupling (200ff, T=2s)')
ylabel('convergence time[s]');
xlabel('log(coupling[%])');