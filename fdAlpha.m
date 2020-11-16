function  [a,h,alpha,c,dalpha]= fdAlpha (a,h,alpha,c)
%Função que calcula as derivadas em relação a taxa de variação de alpha
%
% DADOS DE SAIDA:
%
% dalpha.CD     Derivada da taxa de variação de alpha em relação ao CD ;
% CL_dalpha     Derivada da taxa de variação de alpha em relação ao CL para cada perfil
% dalpha.CL          Derivada da taxa de variação de alpha em rel. CL
% Cm_dalpha          Derivada da taxa de variação de alpha em relação ao Cm
% para cada perfil.
% dalpha.Cm          Derivada da taxa de variação de alpha em rel. Cm



%% CDalfa_dot é negligenciavel para subsonico

dalpha.CD = 0;

%% CL_alfa_dot [rad-1]


h.CL_dalpha = 2*h.CL_alfa * h.n * h.V_barra * alpha.diffezinalfa_M ; %[rad-1]

dalpha.CL = ( h.CL_dalpha) ;





%% Cm_dalpha [rad-1]

a.Cm_dalpha = 0; % exceto asas triangulares a contribuição é negligenciavel


h.Cm_dalpha = - 2* h.CL_alfa * h.n * h.V_barra * (h.X_cg_ac/h.c_barra) * alpha.diffezinalfa_M; %[rad-1]




dalpha.Cm = (h.Cm_dalpha); %-34.9973







end





