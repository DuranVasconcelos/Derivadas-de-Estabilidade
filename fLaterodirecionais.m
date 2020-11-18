function [a,h,v,b,c,CL,alpha,B,p,r] = fLaterodirecionais(a,h,v,b,c,CL,alpha)
%Função que estima as derivadas latero-direcionais

%Calculo da area efetiva do Est. Vertical

[v]= fAreaV(h,v,b);
 
%Calculo de CL_alfa do Est. Vertical

[a,h,v,b,c,alpha] = fAlphaV(a,h,v,b,c,alpha);
 
 
%% DERIVADAS DO ANGULO DE DERRAPAGEM

[a,h,v,b,c,B]= fBeta(a,h,v,b,c,CL);

%% DERIVADAS DA TAXA DE ROLAGEM

[CL,a,c,v,p] = fRoll(CL,a,c,v,h);


 %% DERIVADAS DA TAXA DE GUINADA

[a,c,CL,v,r] = fYaw (a,c,CL,v,alpha);

end