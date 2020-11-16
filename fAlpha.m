function [a,h,v,b,c,alpha] = fAlpha(a,h,v,b,c,alpha)
% Função que calcula CLalpha para cada perfil.
%
% Dados de entrada:
% a.cl_alpha
% b.D
% a.b
% a.A
% c.B
% a.enf_c2_rad
% h.h
% h.enf_c4_rad
% S
%
% Dados de saida:
% alpha.CD    Variação do coeficiente de arrasto em relação ao angulo de ataque 
% alpha.CL    Variação do coeficiente de sustentação em relação ao angulo de ataque
% h.l         l_H é a distancia entre c_barra/4 do est. horizontal e do c_barra/4 da asa
% CL_alfa     Variação do coeficiente de sustentaçao em relação ao angulo de ataque para cada perfil
% CL_alfa_M0  Variação do coeficiente de sustentaçao em relação ao angulo de ataque para cada perfil com Mach igual a zero




%% CD_alpha

alpha.CD = 0; %Variação do coeficiente de arrasto em relação ao angulo de ataque



%% CL_alpha

%% Dados para o Calculo do Gradiente de downwash para velocidades baixas

KA_h = (1/h.A) - (1/(1+ h.A^1.7));

Klamb_h = (10 - 3*h.lambda)/ 7;

KH_h = (1- (h.h/h.b)) / ((2*h.l/h.b)^(1/3));














%% ASA


%Fatores de correção para CL_alpha


%Fator de correção do aerofólio

a.cl_alpha =   a.cl_alpha_M0 * c.B; %derivada do aerofolio considerando M

k_a  = a.cl_alpha/(2*pi);      %derivada do aerofolio
k_a_M0 = a.cl_alpha_M0/(2*pi); %derivada do aerofolio p M=0




%fator de correção devido diametro da fuselagem e envergadura da asa
K_WB = 1 + (0.025 * (b.D/a.b))- (0.25 *(b.D/a.b)^2) ;

%CL_alpha p/ M=0

q10= 2*pi*a.A;
q20= a.A^2 * k_a_M0^2;
q30= 1+( tan(a.enf_c2_rad).^2);

a.CL_alfa_M0 = q10/(2+sqrt(q20*q30 + 4));   %[rad-1]

a.CL_alfa_M0_deg = a.CL_alfa_M0^-1*(180/pi); %[deg]


%% EST HORIZONTAL


%Fator de correção do aerofólio


h.cl_alpha =   h.cl_alpha_M0 * c.B; %derivada do aerofolio considerando M

k_h  = h.cl_alpha/(2*pi); %derivada do aerofolio
k_h_M0 = h.cl_alpha_M0/(2*pi); %derivada do aerofolio p M=0



%CL_alpha p/ M=0

q10= 2*pi*h.A;
q20= h.A^2 * k_a_M0^2;
q30= 1+( tan(h.enf_c2_rad).^2);

h.CL_alfa_M0 = q10/(2+sqrt(q20*q30 + 4));   %[rad-1]
h.CL_alfa_M0_rad = h.CL_alfa_M0^-1*(180/pi); %[deg]








%% PARA M>0.6

if c.M > 0.6
    
%% ASA


%CL_alpha


q1= 2*pi*a.A;
q2= a.A^2 * c.B^2 /k_a^2;
q3= 1+ tan(a.enf_c2_rad).^2/c.B^2;

a.CL_alfa = q1/(2+sqrt(q2*q3 + 4)); %[rad-1]
a.CL_alfa_deg = a.CL_alfa^-1*(180/pi); %[deg]

%CL_alpha com a influencia do corpo

a.CL_alfa_WB = K_WB * a.CL_alfa;


    
    
    
    
    
%% EST HORIZONTAL



h.CL_alfa = (2*pi*h.A)/(2+((h.A^2 * c.B^2/k_h^2)*(1+ tan(h.enf_c2_rad)^2/c.B^2) +4)^(1/2)); %[rad-1]
h.CL_alfa_deg = h.CL_alfa^-1*(180/pi); %[deg]




%% Gradiente de downwash para velocidades baixas

alpha.diffezinalfa_M0 = 4.44 * (KA_h * Klamb_h * KH_h * (cos(h.enf_c4_rad))^(1/2))^1.19;


alpha.diffezinalfa_M = alpha.diffezinalfa_M0 * (a.CL_alfa/ a.CL_alfa_M0);



%% metodo build up

alpha.CL = a.CL_alfa_WB + h.CL_alfa * h.n * (h.S/a.S) *(1 - alpha.diffezinalfa_M);






%% EST VERTICAL

v.cl_alpha =   v.cl_alpha_M0 * c.B; %derivada do aerofolio considerando M

k_v  = v.cl_alpha/(2*pi); %derivada do aerofolio

v.CL_alfa = (2*pi*v.A)/(2+((v.A^2 * c.B^2/k_v^2)*(1+ tan(v.enf_c2_rad)^2/c.B^2) +4)^(1/2));
v.CL_alfa_rad = v.CL_alfa*(pi/180);






%% PARA M<0.6
else
    
    
    
    
    
%% CALULO DE CL_ALPHA ATRAVÉS DO GRAFICO


%% ASA
    
    %Simulando FIgura 3.3
    
x = a.A;
p = a.lambda;
q = a.enf_c4;

if p<0.20

if q<15
y = -0.0012*x^2 + 0.0199*x;

else
    
if q>=15 && q<35
y = -0.0012*x^2 + 0.0195*x;

else
    
if q>=35 && q<45
y = -0.0012*x^2 + 0.0187*x;

else
    
if q>=45 && q<55
y = -0.0011*x^2 + 0.017*x;

else
    
if q>=55
y = -0.001*x^2 + 0.0147*x;

end
end
end
end
end




else
    
    
    
if p>=0.2 && p<0.4
    
if q<15
y = -0.0011*x^2 + 0.0197*x;

else
if q>=15 && q<35
y = -0.0013*x^2 + 0.0201*x;

else
if q>=35 && q<45
y = -0.0012*x^2 + 0.0191*x;

else
if q>=45 && q<55
y = -0.0011*x^2 + 0.017*x;

else
if q>=55
y = -0.001*x^2 + 0.0145*x;

end
end
end
end
end
end



if p>= 0.4 && p <0.75
    
if q<15
y = -0.0008*x^2 + 0.0157*x + 0.0044 ;


else
if q>=15 && q<35
y = -0.0012*x^2 + 0.0194*x;

else
if q>=35 && q<45
y = -0.0012*x^2 + 0.0181*x;

else
if q>=45 && q<55
y = -0.0011*x^2 + 0.016*x;

else
if q>=55
y = -0.001*x^2 + 0.0138*x;

end
end
end
end
end    
end



if p>=0.75
if q<15
y = -0.0012*x^2 + 0.0198*x;

else
if q>=15 && q<35
y = -0.0012*x^2 + 0.0185*x;

else
if q>=35 && q<45
y = -0.0012*x^2 + 0.0174*x;
else
if q>=45 && q<55
y = -0.001*x^2 + 0.015*x;


else
if q>=55
y = -0.0009*x^2 + 0.0128*x;




end
end
end
end
end



end
end


%% 





% CL_alpha
a.CL_alfa = y*57.2958;           %conversao deg-1 to rad-1
a.CL_alfa_rad = a.CL_alfa*(pi/180);


a.CL_alfa_WB = K_WB*a.CL_alfa;   %[rad-1]



%% ESTABILIZADOR HORIZONTAL

       


%Simulando FIgura 3.3
    
yx = h.A;
yp = h.lambda;
yq = h.enf_c4;

if yp<0.20

if yq<15
yh = -0.0012*yx^2 + 0.0199*yx;

else
    
if yq>=15 && yq<35
yh = -0.0012*yx^2 + 0.0195*yx;

else
    
if yq>=35 && yq<45
yh = -0.0012*yx^2 + 0.0187*yx;

else
    
if yq>=45 && yq<55
yh = -0.0011*yx^2 + 0.017*yx;

else
    
if yq>=55
yh = -0.001*yx^2 + 0.0147*yx;

end
end
end
end
end




else
    
    
    
if yp>=0.2 && yp<0.4
    
if yq<15
yh = -0.0011*yx^2 + 0.0197*yx;

else
if yq>=15 && yq<35
yh = -0.0013*yx^2 + 0.0201*yx;

else
if yq>=35 && yq<45
yh = -0.0012*yx^2 + 0.0191*yx;

else
if yq>=45 && yq<55
yh = -0.0011*yx^2 + 0.017*yx;

else
if yq>=55
yh = -0.001*yx^2 + 0.0145*yx;

end
end
end
end
end
end



if yp>= 0.4 && yp <0.75
    
if yq<15

yh = -0.0008*yx^2 + 0.015*yx + 0.014 ;

else
if yq>=15 && yq<35
yh = -0.0012*yx^2 + 0.0194*yx;

else
if yq>=35 && yq<45
yh = -0.0012*yx^2 + 0.0181*yx;

else
if yq>=45 && yq<55
yh = -0.0011*yx^2 + 0.016*yx;

else
if yq>=55
yh = -0.001*yx^2 + 0.0138*yx;

end
end
end
end
end    
end



if yp>=0.75
if yq<15
yh = -0.0012*yx^2 + 0.0198*yx;

else
if yq>=15 && yq<35
yh = -0.0012*yx^2 + 0.0185*yx;

else
if yq>=35 && yq<45
yh = -0.0012*yx^2 + 0.0174*yx;
else
if yq>=45 && yq<55
yh = -0.001*yx^2 + 0.015*yx;


else
if yq>=55
yh = -0.0009*yx^2 + 0.0128*yx;




end
end
end
end
end



end
end


%CL_alpha

h.CL_alfa = yh*57.2958; %conversao deg-1 to rad-1
h.CL_alfa_deg = h.CL_alfa^-1*(180/pi);




%% Gradiente de downwash para velocidades baixas

alpha.diffezinalfa_M0 = 4.44 * (KA_h * Klamb_h * KH_h * (cos(h.enf_c4_rad))^(1/2))^1.19;


alpha.diffezinalfa_M = alpha.diffezinalfa_M0 * (a.CL_alfa/ a.CL_alfa_M0);


%% metodo build up

alpha.CL = a.CL_alfa_WB + h.CL_alfa * h.n * (h.S/a.S) *(1 - alpha.diffezinalfa_M);



















end



end