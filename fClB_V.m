function [v] =  fClB_V (v,c)
%Função que calcula as derivadas do angulo de derrapagem em relação a CL.
%
% DADOS DE SAIDA:
% v.l       Distancia do CG da aeronave ao X_ac do Est. Vertical
% v.Cl_B    Derivada do angulo de derrapagem do Est. Vertical

v.l = abs(c.X_cg - v.X_ac_real); 

p = (v.zmgc*cos(c.alpha) - v.l*sin(c.alpha))/v.b;

v.Cl_B = v.Cy_B * p ;


