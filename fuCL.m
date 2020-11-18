function [a,c,CL,u]=fuCL(a,c,CL)
%Função que calcula as derivadas em relação a velocidade.
%
% DADOS DE SAIDA:
%u.CD
%u.CL
%u.Cm
%

%CD_U

u.CD = 0;   %negligenciavel para M<0.3

% CL_U


u.CL = c.M^2/(1-c.M^2)*CL;


% Cm_u 

u.Cm = - CL * tan(a.X_ac_real/c.M)*(pi/180);

 
end
 
 