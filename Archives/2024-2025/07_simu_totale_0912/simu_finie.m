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

%% Boucle de courant
kp_c=4.1926;
ki_c=31861.2735;
Ti_c=kp_c/ki_c


%% 
%calcul de ki et kp pour vitesse
z=0.7;
w0=3/0.11;

ki_v=2000*J*w0^2/(3*Kphi);
kp_v=(3*Kphi*ki_v*2*z/w0-2000*f-1000*Kphi^2/(R+Rch) )/(3*Kphi);
Ti_v=kp_v/ki_v;

%% Calcul des composants

%On fixe C dans Ti=RC
C=39e-9;
R_I_courant=Ti_c/C;
R_I_vitesse=Ti_v/C;%valeurs idéales

RIC=3.3e3; %valeurs normalisées choisies
RIV=1e6;
Ti_v_=C*RIV;
TI_c_=C*RIC;

%On fixe R1 dans Kp=R2/R1
R1_K=2.2e3;
R2_K_courant=kp_c*R1_K;
R2_K_vitesse=kp_v*R1_K;%valeurs idéales

R2KC=1e4;%valeurs normalisées choisies
R2KV=2.7e4;
kp_v_=R2KV/R1_K;
kp_c_=R2KC/R1_K;

