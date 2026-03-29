%% ================= SYSTEME 2 : MASSE EN TRANSLATION =================
clear all; close all; clc;
disp('======================================================');
disp('           SYSTEME 2 : MASSE EN TRANSLATION           ');
disp('======================================================');

% 1. Données numériques
kr = 2;   % Raideur du ressort (N/m)
b = 8;    % Coefficient de frottement visqueux (N.s/m)
M = 3;    % Masse (kg)

% 2. Matrices d'état
A2 = [0, 1 ; -kr/M, -b/M];
B2 = [0 ; 1/M];
C2 = [1, 0];
D2 = 0;
sys2 = ss(A2, B2, C2, D2);

% 3. Dimensions
disp('Dimensions des matrices A2, B2, C2, D2 :');
disp('Taille de A2 :'); size(A2)
disp('Taille de B2 :'); size(B2)
disp('Taille de C2 :'); size(C2)
disp('Taille de D2 :'); size(D2)

% 4. Passage État -> Fonction de transfert (Représentation externe)
disp('Fonction de transfert du Système 2 :');
[num2, den2] = ss2tf(A2, B2, C2, D2);
FT2 = tf(num2, den2)

% 5. Passage FT -> État (vérification tf2ss)
[A2_v, B2_v, C2_v, D2_v] = tf2ss(num2, den2);

% 6. Formes canoniques
sys2_min = minreal(sys2);
sys2_diag = canon(sys2_min, 'modal');
sys2_obs  = canon(sys2_min, 'companion');

% 7. Analyse de stabilité
disp('Valeurs propres de A2 :');
disp(eig(A2));
figure('Name', 'Sys2 : Pôles et Zéros');
pzmap(sys2);
title('Système 2 (Mécanique) : Carte des Pôles');

% 8. Performances en Boucle Ouverte (BO)
disp(['Gain statique Sys2 : ', num2str(dcgain(sys2))]);

figure('Name', 'Sys2 : Réponse Indicielle BO');
step(sys2);
title('Système 2 (Mécanique) : Réponse indicielle en BO');

figure('Name', 'Sys2 : Réponse Impulsionnelle BO');
impulse(sys2);
title('Système 2 (Mécanique) : Réponse impulsionnelle en BO');

figure('Name', 'Sys2 : Bode');
bode(sys2);
title('Système 2 (Mécanique) : Diagramme de Bode');

% 9. Boucle Fermée (BF)
% La consigne est unitaire, on boucle la sortie sur l'entrée
sys2_bf = feedback(sys2, 1);

figure('Name', 'Sys2 : Réponse Indicielle BF');
step(sys2_bf);
title('Système 2 (Mécanique) : Réponse indicielle en BF (retour unitaire)');

figure('Name', 'Sys2 : Réponse Impulsionnelle BF');
impulse(sys2_bf);
title('Système 2 (Mécanique) : Réponse impulsionnelle en BF (retour unitaire)');