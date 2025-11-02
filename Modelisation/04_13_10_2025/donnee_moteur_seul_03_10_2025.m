% données pour 1 moteur

R= 1.52; % résistance de l'induit
Rch= 10; % charge

L=2.2e-3; % inductance propre de l'induit
J=8.3e-5; % moment d'inertie pour une machine
U1=48; % tension d'alimentation
Kphi=0.127; % constante de couple, de force électromotrice

f=(0.53*30*10^-2)/(1000*pi);  %frottement
C0 = 2.4*10^-2;           %couple de frottement sec du moteur


u_commande=11.25;
UM=15;

A = [-R/L   0   -Kphi/L
     0  -(R+Rch)/L  Kphi/L
     Kphi/(2*J) -Kphi/(2*J) -f/(J)];
eig(A);
M=A;

N1=[U1/L;0;-C0/J];
Xinfini1= -inv(M)*N1;
iMinfini1=[1 0 0]*Xinfini1;
iGinfini1=[0 1 0]*Xinfini1;

Ninfini1=30/pi*[0 0 1]*Xinfini1;


format long
N=[U1/L;0;-C0/J];
Xinfini=-inv(M)*N;
N_hacheur=[(2*u_commande/UM-1)*U1/L;0;-C0/J];
Xinfini_hacheur= -[1 0 0; 0 1 0; 0 0 30/pi]*inv(M)*N_hacheur
iMinfini1_hacheur=[1 0 0]*Xinfini_hacheur




s = tf('s');
A= 1/(2*J*s);
B = 2*f;
C= Kphi^2/(R+Rch+L*s);
H = A/(1+A*(B+C));
T = 1/(R+L*s);
FTBO= 6.4*T/(1+Kphi^2*H*T);