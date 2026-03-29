%% ========================================================================
%% TP N2 : COMMANDE PAR PLACEMENT DE POLES (MCC)
%% Réalisé par : ABOURICH Ayoub & EL KOULI Khalid
%% ========================================================================
clear all; clc; close all;

%% --- 1. Paramètres du Moteur à Courant Continu (MCC) ---
R = 0.5; L = 0.01; J = 0.02; f = 0.01; Ke = 0.01;

% Matrices d'état originales (Ordre 2)
A = [-R/L, -Ke/L ; Ke/J, -f/J];
B1 = [1/L ; 0];
C = [0, 1]; % Sortie = Vitesse

%% --- 2. PARTIE 1 : RETOUR D'ÉTAT SIMPLE (TABLEAU 1) ---
% Liste des pôles (2 pôles par ligne)
poles_simple = [
    -20, -21;
    -22, -23;
    -25, -26;
    -22+15i, -22-15i;
    -22+20i, -22-20i;
    -22+25i, -22-25i
];

res_simple = zeros(size(poles_simple, 1), 7); % P1, P2, k1, k2, Dep, Err, Tr

for i = 1:size(poles_simple, 1)
    K = place(A, B1, poles_simple(i, :));
    sys_cl = ss(A - B1*K, B1, C, 0); % Gain direct = 1 (consigne)
    
    info = stepinfo(sys_cl);
    [y, t] = step(sys_cl, 5);
    
    res_simple(i, 1:2) = real(poles_simple(i, :));
    res_simple(i, 3:4) = real(K);
    res_simple(i, 5)   = info.Overshoot;
    res_simple(i, 6)   = abs(1 - y(end)); % Erreur statique pour consigne 1
    res_simple(i, 7)   = info.SettlingTime;
end

%% --- 3. PARTIE 2 : RETOUR D'ÉTAT + INTÉGRATEUR (TABLEAU 2) ---
% Système augmenté (Ordre 3)
Aa = [A, zeros(2,1) ; -C, 0];
Ba = [B1 ; 0];
Ca = [C, 0];

% Liste des pôles (3 pôles par ligne)
poles_integral = [
    -20, -21, -22;
    -22, -23, -24;
    -25, -26, -27;
    -22+15i, -22-15i, -22;
    -22+20i, -22-20i, -22;
    -22+35i, -22-35i, -22
];

res_integral = zeros(size(poles_integral, 1), 9); % P1, P2, P3, k1, k2, kr, Dep, Err, Tr

for i = 1:size(poles_integral, 1)
    Ka = place(Aa, Ba, poles_integral(i, :));
    
    % Extraction des gains
    k_fb = real([Ka(1), Ka(2)]); % Gains de retour d'état
    kr = real(-Ka(3));           % Gain de l'intégrateur
    
    % BF Augmentée : u = kr*xr - k*x
    % L'entrée du système bouclé est maintenant la consigne xr sur l'intégrateur
    sys_cl_int = ss(Aa - Ba*Ka, [0;0;1], Ca, 0);
    
    info_int = stepinfo(sys_cl_int);
    [y_int, t_int] = step(sys_cl_int, 5);
    
    res_integral(i, 1:3) = real(poles_integral(i, :));
    res_integral(i, 4:5) = k_fb;
    res_integral(i, 6)   = kr;
    res_integral(i, 7)   = info_int.Overshoot;
    res_integral(i, 8)   = abs(1 - y_int(end)); % Erreur statique (doit être 0)
    res_integral(i, 9)   = info_int.SettlingTime;
end

%% --- 4. AFFICHAGE FINAL ---
fprintf('\n================== TABLEAU 1 : RETOUR SIMPLE ==================\n');
fprintf('  P1    P2   |    k1       k2    | Dépas(%%)  Erreur   Tr(5%%)\n');
disp(res_simple);

fprintf('\n================ TABLEAU 2 : RETOUR + INTEGRATEUR ===============\n');
fprintf('  P1    P2    P3   |    k1       k2       kr    | Dépas(%%)  Err   Tr(5%%)\n');
disp(res_integral);