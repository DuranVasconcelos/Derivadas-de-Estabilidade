function [a,c,CL,v] = fCn_rW (a,c,CL,v,alpha)
%Função que estima a contribuição da asa para a derivada Cn_r.

%%DEFININDO PARAMETROS

%%Cn_r/CL^2 

%obtido através da fig 9.4 da referencia 1
q1 = -0.4;

%% CD_alpha

q2 = alpha.CD;

%% Cnr/CD0

%obtido através da simulação da figura 9.5 da referencia 1

xb = c.X_cg - a.X_ac_real;

p1 = xb/a.c_barra;
x= a.A;

if p1< 0.1

if a.enf_c4<20
y = 0.0056*x^3 - 0.1*x^2 + 0.5675*x - 1.38;


else
if 20<=a.enf_c4<45

y = 0.0035*x^3 - 0.0637*x^2 + 0.3683*x - 1.11;



else
if 45<=a.enf<55
y = 0.0015*x^3 - 0.0275*x^2 + 0.1642*x - 0.93;


else
if a.enf>=55
y = 0.0006*x^3 - 0.01*x^2 + 0.0425*x - 1.05;


end
end
end
end
else
if 0.1<=p1< 0.3

if a.enf_c4<20

y = 0.0067*x^3 - 0.125*x^2 + 0.7633*x - 1.88;

else
if 20<=a.enf_c4<45

y = 0.0075*x^3 - 0.135*x^2 + 0.78*x - 1.88;

else
if 45<=a.enf<55

y = 0.0048*x^3 - 0.085*x^2 + 0.4758*x - 1.45;


else
if a.enf>=55

y = 0.0006*x^3 - 0.01*x^2 + 0.0425*x - 1.05;


end
end
end
end
else
if p1>= 0.3
if a.enf_c4<20

y = 0.0083*x^3 - 0.16*x^2 + 1.0067*x - 2.44;

else
if 20<=a.enf_c4<45

y = 0.0117*x^3 - 0.21*x^2 + 1.2133*x - 2.68;

else
if 45<=a.enf<55

y = 0.009*x^3 - 0.16*x^2 + 0.9092*x - 2.25;

else
if a.enf>=55

y = 0.0006*x^3 - 0.01*x^2 + 0.0425*x - 1.05;

end
end
end
end

end
end
end

q3 = y;



%% ESTIMANDO A CONTRIBUIÇÃO DA ASA

a.Cn_r = q1*CL^2+ q3*q2;


end


