function [a,h,v,B]= fCl_B(a,h,v,b,c,CL,B)
%Fun��o que estima a derivada Cl_B.


%CONTRIBUI��O DA ASA:

%Por ser uma figura complexa, recomenda-se a analise individual, por
%padr�o,K_N est� definido como -0.000035 (alterar linha 396) Figura 7.17 -
%REFERENCIA 1

[a]= fClB_WB (CL,a,c,b);


%CONTRIBUI��O DO ESTABILIZADOR HORIZONTAL:

%Por ser uma figura complexa, recomenda-se a analise individual, por
%padr�o,K_N est� definido como -0.000023 (alterar linha 388) Figura 7.17
%REFERENCIA 1

[h]= fClB_HB (CL,h,c,b);

%CONTRIBUI��O DO ESTABILIZADOR VERTICAL:

[v] = fClB_V (v,c);


%DEFINI��O DE Cl_B:

B.Cl_B = a.Cl_B + h.Cl_B + v.Cl_B;

end