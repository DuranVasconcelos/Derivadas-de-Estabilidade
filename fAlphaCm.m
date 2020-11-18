function [a,h,v,b,c,alpha,f] = fAlphaCm (a,h,v,b,c,alpha,f)

%% ___________________________CALCULO Cm_alpha________________________%%


diffCmCL =  ((c.X_cg_c_barra/100) - b.X_ac);

alpha.Cm = diffCmCL * alpha.CL; %[rad-1]

% Metodo 2:
% alpha.Cm2 = a.CL_alfa_WB*((c.X_cg_c_barra/100)- a.X_ac_wb) - h.CL_alfa*h.n*(h.S/a.S)*(h.X_ac_cb - (c.X_cg_c_barra/100))*(1-alpha.diffezinalfa_M);%[rad-1]

end

