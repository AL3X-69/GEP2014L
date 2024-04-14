% GEP2014L Automatique
% Commande Servo

close all;

%% Correcteur proportionel
sys = zpk([-95+300i,-95-300i],[-140,-10+95i,-10-95i],1); % 137.2
Kc = 50;
sysc = sys * Kc;

figure(Name, Lieu des pôles);
rlocus(sys);
grid;

figure(Name, Lieu de Nyquist);
nyquist(sysc)
grid;

figure(Name, Diagramme de Bode);
bode(sysc);
grid;
