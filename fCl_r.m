function [a,c,CL,v,r] = fCl_r (a,c,CL,v,r)
%Fun��o que estima a derivada relativa a varia��o do coeficiente de
%sustenta��o com a taxa de guinada

%a.Cl_r

[a,c,CL]= fCl_rW (a,c,CL);

%v.Cl_r

[a,c,CL,v]= fCl_rV (a,c,CL,v);



%% DEFINI��O DA DERIVADA  Cl_r

r.Cl_r = a.Cl_r + v.Cl_r;

end