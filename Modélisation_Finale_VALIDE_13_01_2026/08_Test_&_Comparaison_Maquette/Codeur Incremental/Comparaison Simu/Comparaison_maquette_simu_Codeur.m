%Avant d'éxécuter ce code, faire attention a bien éxécuter la simulation
%Simulink pour avoir les valeur matlab

%Lecture des fichiers de points
data_maquette = readmatrix(['Scope_Codeur_Charge.csv'], 'NumHeaderLines', 2);
data_psim = readmatrix('Data_Essai_PSIM_Codeur.txt');

% Extraction des colonnes de temps
t = data_maquette(:, 1); 
t = t+1;
t_psim = data_psim(:, 1);
% Extraction des grandeurs mesurées
Consigne_maquette = data_maquette(:, 2);
Vitesse_maquette = data_maquette(:, 3);
Courant_maquette = data_maquette(:, 4);
% Extraction des grandeurs simulées sur PSIM
Consigne_psim = data_psim(:, 2);
Vitesse_psim = data_psim(:, 3);
Courant_psim = data_psim(:, 4);


%Synchronisation des signaux
offset = 0.88; 
t_synchro = t + offset;

%Ajout du facteur 6/1000 pour la vitesse venant de la dynamo tachymétrique
Vitesse_maquette = Vitesse_maquette*(1000/6);


%Tracé des courbes
close all;

%Tracé de la consigne
figure;
plot(t_maquette_coupe, Consigne_maquette_coupe, 'r', 'LineWidth', 1.5); hold on;
plot(t_psim, Consigne_psim, 'b', 'LineWidth', 1.5);
plot(out.consigne, 'g', 'LineWidth', 1.5);

grid on;
xlabel('Temps (s)');
ylabel('Tension (V)');
title('Comparaison Consigne');
legend('Maquette', 'PSIM', 'Matlab');

%Tracé de la vitesse
figure;
plot(t_maquette_coupe, Vitesse_maquette_coupe, 'r', 'LineWidth', 1.5); hold on;
plot(t_psim, Vitesse_psim, 'b', 'LineWidth', 1.5);
plot(out.vitesse, 'g', 'LineWidth', 1.5);

grid on;
xlabel('Temps (s)');
ylabel('Vitesse (tr/min)');
title('Comparaison Vitesse');
legend('Maquette', 'PSIM', 'Matlab');

%Tracé du courant moteur
figure;
plot(t_maquette_coupe, Courant_maquette_coupe, 'r', 'LineWidth', 1.5); hold on;
plot(t_psim, Courant_psim, 'b', 'LineWidth', 1.5);
plot(out.courant_moteur, 'g', 'LineWidth', 1.5);

grid on;
xlabel('Temps (s)');
ylabel('Courant Moteur (A)');
title('Comparaison Courant');
legend('Maquette', 'PSIM', 'Matlab');