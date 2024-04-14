% GEP2014L Automatique
% Commande Servo

close all;

%% Analyse du modele entree-sortie du systeme
% Definition du systeme
s = tf(s);
a = 0.45;
b = 31;
Moteur = b/(s*(s+a));

% Diagramme des poles
figure(Name, Diagramme des poles);
pzmap(Moteur);
grid;

% Reponse indicielle
figure(Name, Reponse indicielle);
step(Moteur);
grid;

% Lieu de Nyquist
figure(Name, Lieu de Nyquist);
nyquist(Moteur);
grid;

% Diagramme de Bode
figure(Name, Diagramme de Bode);
bode(Moteur);
grid;

%% Commande proportionelle
% Boucle ouverte
Kc = 0.1;
H0 = (Kc*b)/(s*(s+a));

% Lieu des poles en boucle ouverte
figure(Name,Lieu des poles en boucle ouverte);
rlocus(H0);
grid;

% Diagramme de Bode en boucle ouverte
figure(Name, Diagramme de Bode en boucle ouverte);
bode(H0);
grid;

% Boucle fermée et réponse indicielle
Hbf = feedback(H0, 1);

figure(Name, réponse indicielle en boucle fermée avec K=1);
step(Hbf);
grid;

%% Commande proportionelle dérivée filtrée
Td = 2.12;
alpha = 20;
Tf = Td/alpha;
Kc1 = 0.19;
C1 = Kc1 * (1 + (Td*s)/(1+Tf*s));

% Diagramme de bode du correcteur
figure(Name, Diagramme de Bode du correcteur);
bode(C1);
grid;

% Diagramme de bode du système en boucle ouverte
H01 = C1*Moteur;

figure(Name, Diagramme de bode du système en boucle ouverte avec correcteur); 
bode(H01);
grid;

Hbf2 = feedback(H01, 1);
figure(Name, Lieu des poles en boucle fermee);
pzmap(Hbf2);
grid;

