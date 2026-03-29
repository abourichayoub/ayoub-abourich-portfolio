%% ================= TP3 : COMMANDE OPTIMALE (LQR) =================
clear all; close all; clc;

% --- 1. Paramètres du moteur MCC ---
J = 3.2284e-6;  % Moment d'inertie
b = 3.5077e-6;  % Frottement visqueux
Kb = 0.0274;    % Constante FCEM
Kt = 0.0274;    % Constante de couple
R = 4;          % Résistance
L = 2.75e-6;    % Inductance

% --- Q3. Modélisation d'état (ss) ---
A = [0, 1, 0 ; 0, -b/J, Kt/J ; 0, -Kb/L, -R/L];
B = [0 ; 0 ; 1/L];
C = [1, 0, 0];
D = 0;
sys = ss(A, B, C, D);

% --- Q4. Fonction de transfert (tf) ---
disp('--- Q4. Fonction de transfert ---');
FT = tf(sys)

% --- Matrices de pondération Q et R ---
% Le vecteur d'état est de taille 3, donc Q doit être 3x3.
Q = C' * C; 
R_val = 1;

% --- Q5. Résolution de Riccati par 'care' ---
[P_care, L_eig, G] = care(A, B, Q, R_val);
disp('--- Q5. Matrice P (solution de Riccati avec care) ---');
disp(P_care);

% --- Q6. Calcul du gain K manuel ---
K_manuel = inv(R_val) * B' * P_care;
disp('--- Q6. Gain K calculé manuellement (R^-1 * B^T * P) ---');
disp(K_manuel);

% --- Q7. Comparaison avec la fonction 'lqr' ---
[K_lqr, P_lqr, E_lqr] = lqr(A, B, Q, R_val);
disp('--- Q7. Gain K calculé par la fonction lqr ---');
disp(K_lqr);
disp(['Erreur entre les deux méthodes : ', num2str(norm(K_manuel - K_lqr))]);

% --- Q8. Influence de Q et R ---
Q_fort = 100 * (C'*C); % On pénalise fortement l'erreur de position
R_fort = 10;           % On pénalise fortement l'effort de commande u
[K_Qfort, ~, ~] = lqr(A, B, Q_fort, R_val);
[K_Rfort, ~, ~] = lqr(A, B, Q, R_fort);

sys_cl_base = ss(A - B*K_lqr, B, C, D);
sys_cl_Qfort = ss(A - B*K_Qfort, B, C, D);
sys_cl_Rfort = ss(A - B*K_Rfort, B, C, D);

figure('Name', 'Influence de Q et R');
step(sys_cl_base, 'b', sys_cl_Qfort, 'r', sys_cl_Rfort, 'g', 0.1);
legend('LQR Base (Q=1, R=1)', 'Q fort (Q=100)', 'R fort (R=10)');
title('Q8. Comparaison des réponses LQR sans pré-compensation');

% --- Q9. LQR avec pré-compensation Nbar ---
% Calcul de Nbar (remplace rscale.m par la formule mathématique exacte)
Nbar = -inv(C * inv(A - B*K_lqr) * B);
disp(['--- Q9. Valeur du gain de pré-compensation Nbar = ', num2str(Nbar)]);

sys_cl_nbar = ss(A - B*K_lqr, B*Nbar, C, D);

figure('Name', 'LQR avec Pré-compensation');
step(sys_cl_base, 'b', sys_cl_nbar, 'r--', 0.1);
legend('LQR sans Nbar', 'LQR avec Nbar');
title('Q9. Réponse indicielle avec pré-compensation Nbar');