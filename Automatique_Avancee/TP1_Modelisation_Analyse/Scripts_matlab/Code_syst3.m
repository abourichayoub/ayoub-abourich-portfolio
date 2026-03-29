%% ================= SYSTEME 3 : MOTEUR A COURANT CONTINU (MCC) =================
clear all; close all; clc;
disp('======================================================');
disp('           SYSTEME 3 : MOTEUR A COURANT CONTINU       ');
disp('======================================================');

% 1. Données numériques
R = 1;      % Resistance (Ohm)
L = 0.5;    % Inductance (H)
kc = 0.01;  % Constante de couple (Nm/A)
ke = 0.01;  % Constante de force contre-electromotrice (V/rad/s)
J = 0.01;   % Moment d'inertie (kg.m2)
f = 0.1;    % Coefficient de frottement fluide (Nm.s)

% 2. Matrices d'état (Ordre des etats : [i ; omega ; theta])
A3 = [-R/L, -ke/L, 0 ; kc/J, -f/J, 0 ; 0, 1, 0];
B3 = [1/L ; 0 ; 0];
C3 = [0, 0, 1]; % On s'interesse a la position angulaire theta
D3 = 0;
sys3 = ss(A3, B3, C3, D3);

% 3. Dimensions
disp('Dimensions des matrices A3, B3, C3, D3 :');
disp('Taille de A3 :'); size(A3)
disp('Taille de B3 :'); size(B3)
disp('Taille de C3 :'); size(C3)
disp('Taille de D3 :'); size(D3)

% 4. Passage État -> Fonction de transfert
disp('Fonction de transfert du Système 3 (Position/Tension) :');
[num3, den3] = ss2tf(A3, B3, C3, D3);
FT3 = tf(num3, den3)

% 5. Formes canoniques
sys3_min = minreal(sys3);
sys3_diag = canon(sys3_min, 'modal');
sys3_obs  = canon(sys3_min, 'companion');

% 6. Analyse de stabilité
disp('Valeurs propres de A3 (Poles du systeme) :');
disp(eig(A3));
figure('Name', 'Sys3 : Pôles et Zéros');
pzmap(sys3);
title('Système 3 (MCC) : Carte des Pôles');

% 7. Performances en Boucle Ouverte (BO)
% ATTENTION : Le gain statique sera infini car il y a un integrateur pur (le 0 dans eig)
figure('Name', 'Sys3 : Réponse Indicielle BO');
step(sys3);
title('Système 3 (MCC) : Réponse indicielle en BO (Position)');

figure('Name', 'Sys3 : Réponse Impulsionnelle BO');
impulse(sys3);
title('Système 3 (MCC) : Réponse impulsionnelle en BO');

figure('Name', 'Sys3 : Bode');
bode(sys3);
title('Système 3 (MCC) : Diagramme de Bode');

% 8. Boucle Fermée (BF)
sys3_bf = feedback(sys3, 1);

figure('Name', 'Sys3 : Réponse Indicielle BF');
step(sys3_bf);
title('Système 3 (MCC) : Réponse indicielle en BF (retour unitaire)');

figure('Name', 'Sys3 : Réponse Impulsionnelle BF');
impulse(sys3_bf);
title('Système 3 (MCC) : Réponse impulsionnelle en BF (retour unitaire)');