close all;
X = readtable("boucle_courant.csv");
temps_psim = X.Time;
vitesse_psim = X.vitesse;
%% 

figure("Comparaison vitesse après boucle de courant")
plot(temps_psim,vitesse_psim,'r');
hold on;
plot(out.N,'b');
grid
%% 

figure("Comparaison courant après boucle de courant")
plot(temps_psim,X.induit,'r');
hold on;
plot(out.IM,'b');
grid