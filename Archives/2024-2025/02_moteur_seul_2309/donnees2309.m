clear all;
R=1.52;
L=2.2e-3;
kphi=0.127;
J=83e-6;
u=48;
C0=2.4e-2;
f=5.06e-5;
Rch=10;
A=[R 0 kphi; 0 R+Rch -kphi; kphi -kphi -2*f];
M=(A^-1)*[u 0 2*C0]';
Im=M(1);
Ig=M(2);
OmInf=M(3);


