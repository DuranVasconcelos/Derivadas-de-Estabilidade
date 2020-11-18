function  [a,h,alpha,c,dalpha]= fdAlpha (a,h,alpha,c)
%Fun��o que calcula as derivadas em rela��o a taxa de varia��o de alpha
%
% DADOS DE SAIDA:
%
% dalpha.CD     Derivada da taxa de varia��o de alpha em rela��o ao CD ;
% CL_dalpha     Derivada da taxa de varia��o de alpha em rela��o ao CL para cada perfil
% dalpha.CL          Derivada da taxa de varia��o de alpha em rel. CL
% Cm_dalpha          Derivada da taxa de varia��o de alpha em rela��o ao Cm
% para cada perfil.
% dalpha.Cm          Derivada da taxa de varia��o de alpha em rel. Cm



%% CDalfa_dot � negligenciavel para subsonico

dalpha.CD = 0;

%% CL_alfa_dot [rad-1]


h.CL_dalpha = 2*h.CL_alfa * h.n * h.V_barra * alpha.diffezinalfa_M ; %[rad-1]

dalpha.CL = ( h.CL_dalpha) ;





%% Cm_dalpha [rad-1]

a.Cm_dalpha = 0; % exceto asas triangulares a contribui��o � negligenciavel


h.Cm_dalpha = - 2* h.CL_alfa * h.n * h.V_barra * (h.X_cg_ac/h.c_barra) * alpha.diffezinalfa_M; %[rad-1]




dalpha.Cm = (h.Cm_dalpha); %-34.9973







end





