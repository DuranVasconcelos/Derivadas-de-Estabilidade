function[a,h,v,b,c,B]= fBeta(a,h,v,b,c,CL)

%Função que estima as derivadas do angulo de derrapagem

%% DERIVADAS DO ANGULO DE DERRAPAGEM

%% Cy_B

[a,h,v,B]= fCy_B(a,h,v,b,c);

%% Cl_B

[a,h,v,B]= fCl_B(a,h,v,b,c,CL,B);

%% Cn_B 

[c,b,a,v,B] = fCn_B (c,b,a,v,B);

end
