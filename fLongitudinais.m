function [a,h,v,b,c,CL,alpha,u,q,dalpha] = fLongitudinais(a,h,v,b,c,CL,esc)
%Função que estima as derivadas longitudinais

%%  DERIVADAS DO ANGULO DE ATAQUE

[a,h,v,b,c,CL,alpha] = fAlpha(a,h,v,b,c,CL,esc);


%% DERIVADAS DE VELOCIDADE 

[a,c,CL,u]=fuCL(a,c,CL);

%% DERIVADAS DA TAXA DE ARFAGEM
 
[a,h,c,q,b] = fqCLt (a,h,c,b);

%% DERIVADAS DA TAXA DO ANGULO DE ATAQUE
 
[a,h,alpha,c,dalpha]= fdAlpha (a,h,alpha,c);

end