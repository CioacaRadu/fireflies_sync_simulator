figure;
title('Fireflies Dynamic State');
xlabel('time[s]');
ylabel('state[%]');
hold on
for firefly_id = 1 : FFstruct.firefly_nr
        
   plot(FFstruct.t(1:length(FFstruct.x(1,:))), FFstruct.x(firefly_id,:))
    
end
