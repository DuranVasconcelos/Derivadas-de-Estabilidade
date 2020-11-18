function [a,c,CL,v,r] = fYaw (a,c,CL,v,alpha)
%Função que estima as derivadas da taxa de guinada.

%Cy_r

[v,a,c,r] = fCy_r (v,a,c);

%Cl_r

[a,c,CL,v,r] = fCl_r (a,c,CL,v,r);

%Cn_r

[a,c,CL,v,r] = fCn_r (a,c,CL,v,alpha,r);

end