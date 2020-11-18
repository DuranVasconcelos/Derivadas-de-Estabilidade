function [a,h,v,B]= fCl_B(a,h,v,b,c,CL,B)
%Função que estima a derivada Cl_B.


%CONTRIBUIÇÃO DA ASA:

%Por ser uma figura complexa, recomenda-se a analise individual, por
%padrão,K_N está definido como -0.000035 (alterar linha 396) Figura 7.17 -
%REFERENCIA 1

[a]= fClB_WB (CL,a,c,b);


%CONTRIBUIÇÃO DO ESTABILIZADOR HORIZONTAL:

%Por ser uma figura complexa, recomenda-se a analise individual, por
%padrão,K_N está definido como -0.000023 (alterar linha 388) Figura 7.17
%REFERENCIA 1

[h]= fClB_HB (CL,h,c,b);

%CONTRIBUIÇÃO DO ESTABILIZADOR VERTICAL:

[v] = fClB_V (v,c);


%DEFINIÇÃO DE Cl_B:

B.Cl_B = a.Cl_B + h.Cl_B + v.Cl_B;

end