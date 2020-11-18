function [a,h,v,b,c,CL,alpha] = fAlpha(a,h,v,b,c,CL,esc)


%CL_alpha [rad-1]

[a,h,v,b,c,alpha] = fAlphaCL(a,h,v,b,c);   





%__________________CalculoX_AC dos perfis [xac/cr]____________________//
[a,h,v,b,c,alpha] = calculoX_AC (a,h,v,b,c,alpha);



%FIG 3.12 
%DADOS DE ENTRADA NECESSARIOS P/ calculo de X_ac:

%I) Divida a distancia do nariz ao x_LE em 5 partes.
%II) Divida a distancia do x_c4 do est.Horizontal ao trailling edge em 5
%partes.

f.c = 0.10274*esc;      %distancia entre LE e TE

f.dxi1 = 0.02726*esc;   %comprimento das partes da div.I
f.dxi2 = 0.05951*esc;   %comprimento das partes da div.II

f.lh = 0.17854*esc;     %distancia do x_c4 do est.Horizontal ao trailling edge

f.xi1 = 0.06815*esc;    %distancia entre o centro da terceira parte da div. I e x_LE
f.xi2 = 0.08927*esc;    %distancia entre o centro da segunda parte da div. II e trailling edge.

f.w1 = 0.06062*esc;     %largura da fuselagem em f.xi1
f.w2 = 0.04606*esc;     %largura da fuselagem em f.xi2

%CalculoX_AC real da aeronave e dos perfis [k1,k2,diff]

[a,h,v,b,c,alpha,f] = calculok2 (a,h,v,b,c,alpha,f);

%_____________________________________________________________________//


% Cm_alfa [rad-1]
[a,h,v,b,c,alpha,f] = fAlphaCm (a,h,v,b,c,alpha,f);



% CD_alpha [rad-1]
[a,alpha,CL] = fAlphaCD (a,alpha,CL);

end