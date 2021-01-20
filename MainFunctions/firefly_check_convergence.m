function [ conv] = run_firefly_dynamics( FFstruct,itime )


     if sum(FFstruct.fire(:,itime)) == FFstruct.firefly_nr
         
         conv = 1;
     else
         conv = 0;
     end

end
