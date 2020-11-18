 function [a,c,CL,v,r] = fCn_r (a,c,CL,v,alpha,r)
%Fun��o que estima a derivada relativa a varia��o do coeficiente de
 %momento de arfagem com o taxa de guinada.


%a.Cn_r
 
 [a,c,CL,v] = fCn_rW (a,c,CL,v,alpha);

%v.Cn_r

[a,c,CL,v] = fCn_rV (a,c,CL,v);


%% DEFINI��O DA DERIVADA

r.Cn_r = a.Cn_r + v.Cn_r;

end