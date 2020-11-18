function [v,a,c,r] = fCy_r (v,a,c)
%fun��o que calcula a derivada relativa a varia��o do coeficiente de fo�a
%lateral com a taxa de guinada(Cy_r).

%Cy_r tem baixa importancia


p1 =(v.l * cos(c.alpha) + v.zmgc * sin(c.alpha));

r.Cy_r = -(2/v.b)* p1 * v.Cy_B;