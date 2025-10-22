%Donnees moteur du cours (datasheet sur pdf projet dispo sur moodle)
clear

R=1.52;
L=2.2e-3;
Kphi=0.127;
J=8.3e-5;
U=48;

format long;
vitesse=1374.04582;
fem=vitesse*13.3/1000;

Rch = 10;
Co = 2.4e-2;
f = (5.3e-3/1e3)*30/pi;
M = [R,0,Kphi;0,R+Rch,-Kphi;Kphi,-Kphi,-2*f];
RP = [U,0,2*Co];
X=RP*inv(M);
IM = X(1,1);
IG = X(1,2);
OmegaInfini = X(1,3);
NInfini = X(1,3)*30/pi;

%% 
%calcul de ki et kp pour
z=0.7;
w0=3/0.11;

ki=2000*J*w0^2/(3*Kphi);
kp=(3*Kphi*ki*2*z/w0-2000*f-1000*Kphi^2/(R+Rch) )/(3*Kphi);
Ti=kp/ki;