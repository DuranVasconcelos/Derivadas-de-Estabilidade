function [c,b,a,v,B] = fCn_B (c,b,a,v,B)

%a.Cn_B
a.Cn_B = 0; %[Negligenciavel]


%b.Cn_B

%Por ser uma figura complexa, recomenda-se a analise individual, por
%padrão,K_N está definido como -.0012 (alterar LINHA 21) Figura 7.19
%REFERENCIA 1

[c,b,a] = fCnB_b (c,b,a);


%v.Cn_B

[a,v,c] =  fCnB_V (a,v,c);


%% DEFININDO A DERIVADA Cn_B

B.Cn_B = a.Cn_B + b.Cn_B +v.Cn_B;

end