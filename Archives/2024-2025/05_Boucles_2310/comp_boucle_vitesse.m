close all;
X = readtable("simu_totale.csv");
temps_psim = X.Time;
vitesse_psim = X.vitesse;
%% 

figure(1)
plot(temps_psim,vitesse_psim,'r');
hold on;
plot(out.N,'b');
plot(out.N1,'m');
grid
%% 

figure(2)
plot(temps_psim,X.induit,'r');
hold on;
plot(out.IM,'b');
grid
