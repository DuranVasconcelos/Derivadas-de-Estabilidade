function [v]= fAreaV(h,v,b)
%Função que calcula a area efetiva do Est. Vertical
%
%DADOS DE SAIDA:
%
%v.Aeff      Area efetiva do Est. Vertical
%


%% CAlculo do AV efetivo [adm]


AV = v.b^2/v.S; %[adm]

q1= AV;



%A_VB_A_V [adm]
%Simulando Figura 7.5

x = v.b/b.D1;

y = -0.0062*x^4 + 0.1165*x^3 - 0.7518*x^2 + 1.8243*x - 0.0163;


A_VB_A_V = y; %[adm]

q2= A_VB_A_V;




% A_VHB_A_VB [adm]
%Simulando Figura 7.6

x = v.zmgc/v.b;

p1 = abs(h.X_ac_real - v.X_LE )/v.c_barra;

if p1>= 0.65
y = 1.8229*x^4 + 0.8681*x^3 + 0.1979*x^2 + 0.6552*x + 1.2012;
else
y = 0.7812*x^4 - 0.9838*x^3 - 0.6632*x^2 + 0.5011*x + 1.0996;
end



A_VHB_A_VB = y; %[adm]
q3 = A_VHB_A_VB;



%KH [adm]
%Simulando Figura 7.7

x= h.S/v.S;

y = 3*10^-13*x^4 + 0.1389*x^3 - 0.7682*x^2 + 1.544*x - 0.0006;


KH = y; %[adm]
q4 = KH; 




%% CALCULO DE v.Aeff [adm]

v.Aeff = q2*q1*(1+q4*(q3-1)); %[adm]

 
 
 
 
 
end