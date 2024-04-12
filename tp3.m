% GEP2014L Automatique
% Commande Servo

close all;

%% Analyse en boucle ouverte
J = 0.0219;
D = 0.0105;
Ks = 0.0391;
Kt = 0.0011;
s=tf('s');

K = Kt/Ks;
wn = sqrt(Ks/J);
z = D*wn/(2*Ks);

H=K/((s^2)/(wn^2) + 2*z*s/wn + 1);

% Diagramme de Bode en boucle ouverte
figure(1);
bode(H);

% Réponse indicielle en boucle ouverte
figure(2);
step(H);

%% Correcteur PIV
z1 = 0.7;
Kd = 2 * (z1 - z) / (K*wn);
Cd = Kd * s;
H1 = feedback(H, Cd);

% Réponse indicielle du système avec correcteur dérivateur
figure(2);
hold on;
step(H1);
grid on;

% Diagramme de Bode du système avec correcteur dérivateur
figure(1);
hold on;
bode(H1);
grid on;

% Diagramme de Bode avec les deux correcteurs et Kp = 1
Ti = 1.17;
Kp = 1;
CPI = Kp * (1 + 1 / (Ti * s));
H0 = CPI * H1; 
figure(3);
bode(H0);

% Diagramme de Bode avec les deux correcteurs et Kp = 84.14
Kp2 = 84.14;
CPI2 = Kp2 * (1 + 1 / (Ti * s));
H02 = CPI2 * H1;
figure(3);
hold on;
bode(H02);
grid;

% Réponse indicielle du système avec les deux correcteurs et Kp = 84.14
Hbf = feedback(H02, 1);
figure(4);
step(Hbf);
grid;
