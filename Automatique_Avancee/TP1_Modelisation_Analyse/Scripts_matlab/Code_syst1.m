%% ================= SYSTEME 1 : CIRCUIT RLC =================
clear all; close all; clc;
disp('======================================================');
disp('                SYSTEME 1 : CIRCUIT RLC               ');
disp('======================================================');

% 1. Données numériques
R = 400; 
C = 100e-6; 
L = 10;

% 2. Matrices d'état
A = [-R/L, 0, -1/L ; 1, 0, 0 ; 1/C, 0, 0];
B = [1/L ; 0 ; 0];
C = [0, 0, 1];
D = 0;
sys1 = ss(A, B, C, D);

% 3. Dimensions
disp('Dimensions des matrices A, B, C, D :');
disp('Taille de A :'); size(A)
disp('Taille de B :'); size(B)
disp('Taille de C :'); size(C)
disp('Taille de D :'); size(D)

% 4. Passage État -> Fonction de transfert (Représentation externe)
disp('Fonction de transfert du Système 1 :');
[num1, den1] = ss2tf(A, B, C, D);
FT1 = tf(num1, den1)

% 5. Passage FT -> État (vérification tf2ss)
[A_v, B_v, C_v, D_v] = tf2ss(num1, den1);

% 6. Formes canoniques
sys1_min = minreal(sys1);
% On peut maintenant calculer les formes canoniques sur le système minimal
sys1_diag = canon(sys1_min, 'modal');
sys1_obs  = canon(sys1_min, 'companion');

% 7. Analyse de stabilité
disp('Valeurs propres de A :');
disp(eig(A));
figure('Name', 'Sys1 : Pôles et Zéros');
pzmap(sys1);
title('Système 1 (RLC) : Carte des Pôles et Zéros');

% 8. Performances en Boucle Ouverte (BO)
disp(['Gain statique Sys1 : ', num2str(dcgain(sys1))]);

figure('Name', 'Sys1 : Réponse Indicielle BO');
step(sys1);
title('Système 1 (RLC) : Réponse indicielle en BO');

figure('Name', 'Sys1 : Réponse Impulsionnelle BO');
impulse(sys1);
title('Système 1 (RLC) : Réponse impulsionnelle en BO');

figure('Name', 'Sys1 : Bode');
bode(sys1);
title('Système 1 (RLC) : Diagramme de Bode');

% 9. Boucle Fermée (BF)
% La consigne est unitaire, on boucle la sortie sur l'entrée
sys1_bf = feedback(sys1, 1);

figure('Name', 'Sys1 : Réponse Indicielle BF');
step(sys1_bf);
title('Système 1 (RLC) : Réponse indicielle en BF (retour unitaire)');

% --- LIGNE AJOUTÉE : Réponse Impulsionnelle en BF ---
figure('Name', 'Sys1 : Réponse Impulsionnelle BF');
impulse(sys1_bf);
title('Système 1 (RLC) : Réponse impulsionnelle en BF (retour unitaire)');