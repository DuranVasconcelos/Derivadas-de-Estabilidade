function [c,CL,u]=fuCL(c,CL)
%Função que calcula as derivadas em relação a velocidade.
%
% DADOS DE SAIDA:
%u.CD
%u.CL
%u.Cm
%

%CD_U

u.CD = 0;

% CL_U
%negligenciavel para M<0.3

%u.CL = c.M^2/(1-c.M^2)*CL;
u.CL = 0;

% Cm_u 

u.Cm = 0;

 %Cm_u  = - CL * diff(X_ac_W,M)
end
 
 