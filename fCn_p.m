function [CL,a,c,Cl_p,v,Cn_p] = fCn_p (CL,a,c,Cl_p,v)
%Função que calcula a derivada da taxa de rolagem em relação a Cn
%
%DADOS DE SAIDA:
%
%Cn_p   Derivada da taxa de rolagem em relação a Cn total e dos perfis





% A Eq. de Cn_pW é muito extensa, e depende de varios parametros que serao
% calculados um a um daqui em diante

%% Cl_pW => q1

q1 =a.Cl_p; %[rad-1]

%% alpha => q2
%angulo de ataque da asa

alpha = 0; %[rad]

q2 = alpha;
%% CL => q3


q3 = CL;

%% Cn_p/CL para /CL = 0 e M = 0 => q4

B= sqrt(1- c.M^2 * cos(a.enf_c4_rad).^2) ; %[adm]

x_barra = a.X_ac_real - c.X_cg;            %[m]

%Obs = x_barra é positivo qnd X_ac é posterior ao X_cg

e1= -(1/6);
e2= 6*(a.A + cos(a.enf_c4_rad));
e3= x_barra/a.c_barra;
e4= (e3*tan(a.enf_c4_rad)/a.A) + (tan(a.enf_c4_rad).^2/12);
e5= a.A + 4*cos(a.enf_c4_rad);


q4= e1*(a.A+e2*e4)/e5;


%% Cn_p/CL para /CL = 0 e M ~= 0 => q5



r1= a.A + 4*cos(a.enf_c4_rad);
r2= a.A*B + 4*cos(a.enf_c4_rad);
r3= a.A*B + (1/2)*(a.A*B + cos(a.enf_c4_rad)) * tan(a.enf_c4_rad).^2;
r4= a.A + (1/2)*(a.A + cos(a.enf_c4_rad)) * tan(a.enf_c4_rad).^2;


q5= (r1/r2)*(r3/r4)*q4;

%% DCn_p/teta [1/(rad-deg)]     => q6
%é o efeito do linear wing twist

%Simulando Figura 8.2
%Considerando as curvas como retas

x=a.A;
p=a.lambda;

if p >= 0.9
    y = 0.001*x - 0.010;
else
    if p<0.9 && p>=0.7
        y= (0.010/8)*x - 0.010;
    else
        if p<0.7 && p>=0.3
        y= (0.010/6)*x - 0.010;
        else
            if p<0.3
                y= (0.003/4)*x - 0.003;
            end
        end
    end
end

q6 = y;



%% teta => q7

teta = 0;

q7 = teta;

%% DCn_p/(alpha_Sigm_f* Sigm_f) => q8

%é o efeito de simetria da deflexão dos flaps.
%Simulando Figura 8.3

p1 = a.lambda;
x = a.A;

if p1<0.2 
    y1 = (0.0005/2)*x - 0.0005;
else
    if p1>=0.2 && p1<0.6 
     y1 = (0.0015/5.5)*x - 0.0015;
    else
        if p1>=0.6
            y1= (0.002/8)*x - 0.002;
        end
    end
end

q8=y1;

%% Sigm_f => q9

%é o stramwise da deflexão dos flaps em graus

q9 = 0;

%% alpha_Sigm_f => q10

%é o parametro bi-dimencional do efeitao da sustenção

%Simulando a figura 10.2

%alpha_Sigm depende de cf/c [não está dentro dos paremetros previsto para este projeto, portanto será considerado um valor médio aceitavel]

q10 = -0.6;




%% Calculando Cn_pW

a.Cn_p = -q1*tan(q2) - (-Cl_p * tan(alpha) - (q5)*(q3))+ q6*q7 + q8*q9*q10;





%% Calculando Cn_pV

c.alpha= 90*(pi/180);

v.Cn_p = -(2/v.b) *(v.l*cos(c.alpha) + v.zmgc*sin(c.alpha))*((v.zmgc*cos(c.alpha)- v.l*sin(c.alpha))/v.b)*v.Cy_B;

%v.Cn_P2= 2*v.CL_alfa * (v.zmgc/v.b) * (v.xmgc/v.b) *(v.n* v.S/a.S)


%% Calculando Cn_p

Cn_p = a.Cn_p + v.Cn_p;




