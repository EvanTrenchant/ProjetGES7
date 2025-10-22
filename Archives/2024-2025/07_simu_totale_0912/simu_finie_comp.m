close all;
X = readtable("boucle_tachy.csv");
Y = readtable("boucle_codeur.csv");
Z = readtable("boucle_codeur_pm.csv");
A = readtable("boucle_tachy_pm.csv");
temps_psim = Y.Time;
vitesse_psim = X.vitesse;
%% 

figure(2)
plot(temps_psim,vitesse_psim,'r');
hold on;
plot(out.N,'b');
plot(temps_psim,Y.vitesse,'m')
plot(temps_psim,Z.vitesse,"g")
plot(temps_psim,A.vitesse)
legend("Boucle Tachy","Simulink", "Boucle Codeur", "Boucle Codeur avec comparateur cablé", "Boucle Tachy avec comparateur cablé")
grid