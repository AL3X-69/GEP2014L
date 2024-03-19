% GEP2014L Automatique
% Commande Servo

%% Analyse du modele entree-sortie du systeme
% Définition du système
s = tf("s");
a = 0.45;
b = 31;
Moteur = b/(s*(s+a));

% Diagramme des poles
figure("Name", "Diagramme des poles");
pzmap(Moteur);
grid;

% Réponse indicielle
figure("Name", "Réponse indicielle");
step(Moteur);
grid;

% Lieu de Nyquist
figure("Name", "Lieu de Nyquist");
nyquist(Moteur);
grid;

% Diagramme de Bode
figure("Name", "Diagramme de Bode");
bode(Moteur);
grid;

%% Commande proportionelle
% Boucle ouverte
Kc = 1;
H0 = (Kc*b)/(s*(s+a));

% Lieu des poles en boucle ouverte
figure("Name","Lieu des poles en boucle ouverte");
rlocus(H0);
grid;

% Diagramme de Bode en boucle ouverte
figure("Name", "Diagramme de Bode en boucle ouverte");
bode(H0);
grid;