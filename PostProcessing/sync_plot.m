figure;
stem(FFstruct.t(1:end), sum(FFstruct.fire,1),'.')
title('Fireflies Synchronization Plot');
xlabel('time[s]');
ylabel('nr. of fireflies sync');


