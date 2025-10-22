psim = readtable("psim_1109.csv");
outi=out.induit.Data;
outv=out.vitesse.Data;
plot(outi)
figure;
plot(psim.Time,psim.inducteur,"red")
hold on
plot(psim.induit,"red")
plot(outi,"blue")
hold off

%%
figure;
plot(psim.vitesse, "red")
hold on
plot(outv)
hold off