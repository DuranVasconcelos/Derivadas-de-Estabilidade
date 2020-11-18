function [a,c,CL]= fCl_rW (a,c,CL)
%Função que estima a contribuição da asa para a derivada Cl_r.


%% DEFININDO PARAMETROS


%% Cl_r/CL para CL=0 e M =0

%Obtido através da figura 9.1 da referencia 1

q1 = 0.3;


%% Cl_r/CL para CL=0 e M

e= cos(a.enf_c4_rad);

B = sqrt(1-c.M^2*e.^2);

e1= 1+( (a.A*(1-B^2)/(2*B*(a.A*B+ 2*e)) ) );

e2=  (a.A*B+2*e)/(a.A*B+4*e);

e3= tan(a.enf_c4_rad).^2/8;

e4= ((a.A+2*e)/(a.A+4*e));

e5= tan(a.enf_c4_rad).^2/8;


q2= (e1+e2*e3)/(1+ e4*e5)*q1;


%% DCl_r/diedro [rad^-2]

q3 = 1/12 * (pi*a.A*sin(a.enf_c4_rad))/(a.A+4*cos(a.enf_c4_rad));


%% diedro

q4 = a.diedro;

%% DCl_r/teta

%obtido através da simulação da Fig.9.2 da referencia 1

x = a.A;
if a.lambda < 0.15 

y = -4*10^-5*x^3 + 0.0007*x^2 - 0.0046*x + 0.0006;

else

y = -1*10^-5*x^3 + 0.0003*x^2 - 0.0031*x - 0.0022;

end

q5 = y;

%% teta

q6 = a.teta;

%% DCl_r/alfa_Sigm_f

%obtido através da figura 9.3 da referencia 1 

q7 = 0.2;

%% Sigm_f
%Não faz parte do escopo do projeto

q8 = 0; 

%% alfa_Sigm_f*Sigm_F
%Não faz parte do escopo do projeto

q9 = 0;

%% ESTIMANDO A CONTRIBUIÇÃO DA ASA


a.Cl_r = CL*q2 + q3*q4 + q5*q6 + q7*q9;


