function [v] =  fCl_pV (v,c)
%Fun�ao que calcula a derivada da taxa de rolagem em rela��o a Cl p/ Est. Vertical
%
%DADOS DE SAIDA:
%v.Cl_P    Derivada da taxa de rolagem em rela��o a Cl p/ Est. Vertical


p = (v.zmgc^2)/v.b;

v.Cl_p = 2*v.Cy_B* p ;