x = [0;0;0;0];

u = 0;
%Definição de parâmetros
%m=1; L=1; b=0.5; J=m*L^2;

g=9.8;
mw2 = 1;
lw2 = -14;
m2o = 0.785;
lco = 0.071;
m1o = 0.103;
mw1 = 0.131;
lo = 0.33;
Jo = 0.0246;

m1 = m1o + mw1;
m2 = m2o + mw2;

lc = (mw2*lw2 + m2o*lco) / m2;

Jbarra = Jo +mw2 * (lw2^2);
Jasterisco = Jo +m1*(lo^2) + mw2*(lw2^2);


%Definição de variáveis
x1=x(1);
x2=x(2);
x3=x(3);
x4=x(4);

x2ponto = (-1/Jbarra)*(2.*m1.*x2.*x3.*x4+m1.*lo.*(x2.^2).*x3-m2.*lc.*g.*sin(x1)-m1.*g.*x3.*cos(x1)+lo.*u);

x4ponto = (1/Jbarra) * (Jasterisco.*(x2.^2).*x3 + 2.*m1.*lo.*x2.*x3.*x4 - (m2.*lo.*lc - Jbarra).*g.*sin(x1) - m1.*lo.*g.*x3.*cos(x1)+Jasterisco.*u/m1);

dx = [x2;x2ponto;x4;x4ponto];
 
