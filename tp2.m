sys = zpk([-95+290i,-95-290i],[-140,-10+95i,-10-95i],137.2);
Kc=0.5;
sysc = sys * Kc;
%rlocus(sys)
%nyquist(sys*Kc)
bode(sysc);
grid;