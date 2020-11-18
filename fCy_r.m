function [v,a,c,r] = fCy_r (v,a,c)
%função que calcula a derivada relativa a variação do coeficiente de foça
%lateral com a taxa de guinada(Cy_r).

%Cy_r tem baixa importancia


p1 =(v.l * cos(c.alpha) + v.zmgc * sin(c.alpha));

r.Cy_r = -(2/v.b)* p1 * v.Cy_B;