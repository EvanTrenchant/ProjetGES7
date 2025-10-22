close all;
X = readtable("valeurs_psim.csv");
temps_psim = X.Time;
courant_generateur_psim = X.IG;
vitesse_psim = X.vitesse;

figure(2)
plot(temps_psim,vitesse_psim,'r');
hold on;
plot(out.omega,'b');
grid

figure(3)
plot(temps_psim,X.induit,'r');
hold on;
plot(out.IM,'b');
grid