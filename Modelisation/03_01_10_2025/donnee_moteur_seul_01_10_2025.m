% données pour 1 moteur

R= 1.52; % résistance de l'induit
Rch= 10; % charge

L=2.2e-3; % inductance propre de l'induit
J=8.3e-5; % moment d'inertie pour une machine
U1=48; % tension d'alimentation
Kphi=0.127; % constante de couple, de force électromotrice

f=(0.53*30*10^-2)/(1000*pi);  %frottement
C0 = 2.4*10^-2;           %couple de frottement sec du moteur



M=A;
u_commande=11.25;
UM=15;

N1=[U1/L;0;-C0/J];
Xinfini1= -inv(M)*N1;
iMinfini1=[1 0 0]*Xinfini1;
iGinfini1=[0 1 0]*Xinfini1;

Ninfini1=30/pi*[0 0 1]*Xinfini1;

A = [-R/L   0   -Kphi/L
     0  -(R+Rch)/L  Kphi/L
     Kphi/(2*J) -Kphi/(2*J) -f/(J)];
eig(A);
M=A;

N=[U/L;0;-C0/J];
Xinfini=-inv(M)*N;
N_hacheur=[(2*u_commande/UM-1)*U/L;0;-C0/J];
Xinfini_hacheur=-[1 0 0; 0 1 0; 0 0 30/pi]*inv(M)*N_hacheur;