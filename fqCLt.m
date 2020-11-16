function [a,h,c,q,b] = fqCLt (a,h,c,b)
%Função que calcula as derivadas em relação a taxa de arfagem
%
% DADOS DE SAIDA:
% X_cg_ac       Distancia entre cg e x_ac
% CL_q          Derivada da taxa de arfagem em relação ao CL para cada perfil
% CL_q_M0       CL_q p/M=0
% q.CL          Derivada da taxa de arfagem em rel. CL
% Cm_q_M0       CM_q p/M=0
% Cm_q          Derivada da taxa de arfagem em relação ao Cm para cada perf
% q.Cm          Derivada da taxa de arfagem em rel. Cm


%% CD_Q

q.CD = 0; %Negligenciavel


%% CL_Q

c.B2 = (1 - c.M^2*cos(a.enf_c4_rad.^2))^(1/2);  %[adm]   (Beta)  
c.Bm0 = 1;                                      %[adm]   (Beta p/ M=0)  


a.X_cg_ac = (a.X_ac_real - (c.X_cg)) ;          %[m]     Distancia entre cg e x_ac

h.X_cg_ac = abs(h.X_ac_real - (c.X_cg)) ;       %[m]     Distancia entre cg e x_ac
%h.X_cg_ac = (h.X_c4 - a.X_c4);                 %outro método utilizavel 



%EST. HORIZONTAL

%h.V_barra
h.V_barra = (h.S * h.X_cg_ac) /(a.S * a.c_barra); %[adm]
 
%h.CL_q
h.CL_q = 2*h.CL_alfa * h.n * h.V_barra; %[deg]

%q.CL

q.CL = h.CL_q;

% OBS:
%A parte derivada do est. horizontal é a única considerada, a influencia da
%parte da asa é muito pequena




%% CALCULO DE CM_Q


%q.Cm

q.Cm = - 2.2 * h.CL_alfa * h.n * h.V_barra * (h.X_ac_cb - (c.X_cg_c_barra/100));


end