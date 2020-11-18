function [a,alpha,CL] = fAlphaCD (a,alpha,CL)

%% ___________________________CALCULO CD_alpha________________________%%

x = a.A;

y = -0.0035*x^2 + 0.0418*x + 0.7564;

e = y;

alpha.CD = 2* CL * alpha.CL/(pi*a.A*e);


end