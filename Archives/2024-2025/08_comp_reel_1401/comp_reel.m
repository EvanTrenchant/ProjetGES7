close all;
X = readtable("boucle_tachy.csv");
A = readtable("boucle_tachy_pm.csv");

Res = readtable("scope_90.csv");
temps_psim = Y.Time;
vitesse_psim = X.vitesse;

% Alignment parameters
x1_target = 1.74; % Original x-value in Figure 1
x2_target = 0.4;  % Target x-value in Figure 2
x_shift = x2_target - x1_target; % Shift amount

% Adjust x-axis data for Figure 1
adjusted_x1 = Res.Var1 + x_shift;

%% Plot Figure 2 with Data from Figure 1
figure(2)
plot(temps_psim, vitesse_psim, 'r');
hold on;
plot(out.N, 'b');
plot(temps_psim, A.vitesse, 'c');

% Add Figure 1 data into Figure 2 in the correct position
plot(adjusted_x1, (movmean(Res.Var3, 1) * 1000 / 3), 'k', 'LineWidth', 1.5); % Add Figure 1 graph
plot(adjusted_x1, (movmean(Res.Var3, 5) * 1000 / 3)*2000/2022, 'b', 'LineWidth', 1.5); % Add Figure 1 graph
legend("Boucle Tachy", "Simulink", "Boucle Tachy avec comparateur cablé", "Test réel","Test réel moyenné *2000/2022")
grid on
title('Figure 2: Comparaison Réalité vs simulation')
xlabel('Temps')
ylabel('Vitesse')
