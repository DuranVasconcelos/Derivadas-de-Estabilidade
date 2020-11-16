function [a,h,v,b,c,alpha,f] = calculok2 (a,h,v,b,c,alpha,f)
%Funçao que calcula fatores de correção para o X_ac dos perfis, X_ac da
%aeronave e Cm_alpha
%
% DADOS DE SAIDA:
% X_ac          Posição do X_ac em relaçao a mgc do perfil
% X_ac_real     Posição do X_ac em relaçao ao naris
% alpha.Cm 
%
%% CALCULO DE K2 
% SIMULANDO FIG 3.10


%% ASA_____________________________________________________________/////


p1 = a.lambda;
x= a.enf_LE;
q1 = a.A;

if p1 <0.3
    
        if q1 >=0 && q1 < 1.5
        y = 0.0001*x^2 - 0.0042*x + 0.1202;

        
        else
        if q1 >=1.5 && q1 < 3.5
         y = 0.0003*x^2 - 0.0111*x + 0.13;
   
            
        else
        if q1 >=3.5 && q1 < 5.5
         y = 0.0003*x^2 - 0.0072*x + 0.1117;
   
            
        else
        if q1 >=5.5 && q1 < 7.5
         y = 0.0002*x^2 + 0.014*x + 0.0047;
   
            
        else
        if q1 >=7.5 && q1 < 8.5
         y = -0.00007*x^2 + 0.0321*x + 0.0126;
   
            
        else
        if q1 >=8.5 && q1 < 10.5
         y = -0.0002*x^2 + 0.0388*x + 0.0332;
   
            
        else
        if q1 >=10.5 
          y = -0.0002*x^2 + 0.0388*x + 0.0332;
  
            
        
        end
        end
        end
        end
        end
        end
        end
    
    
    
else
    
    if p1 > 0.3 && p1 <0.7
    
        if q1 >=0 && q1 < 1.5
        y = 0.0003*x^2 - 0.011*x + 0.1363;

        
        else
        if q1 >=1.5 && q1 < 3.5
         y = 0.0005*x^2 - 0.0182*x + 0.1;
   
            
        else
        if q1 >=3.5 && q1 < 5.5
         y = 0.0002*x^2 + 0.0081*x + 0.0721;
   
            
        else
        if q1 >=5.5 && q1 < 7.5
        y = -0.00005*x^2 + 0.0309*x + 0.0139;
    
            
        else
        if q1 >=7.5 && q1 < 8.5
        y = -0.0005*x^2 + 0.0574*x + 0.0546; %em uso
    
            
        else
        if q1 >=8.5 && q1 < 10.5
        y = -0.0005*x^2 + 0.0625*x + 0.0912;
    
            
        else
        if q1 >=10.5 
        y = -0.0005*x^2 + 0.0625*x + 0.0912;
    
            
        
        end
        end
        end
        end
        end
        end
        end
    
    
    else
        
        
        if p1 >0.7 
    
        if q1 >=0 && q1 < 1.5
        y = 0.0003*x^2 - 0.0117*x + 0.1382;

        
        else
        if q1 >=1.5 && q1 < 3.5
       y = 0.0004*x^2 - 0.0108*x + 0.14;
     
            
        else
        if q1 >=3.5 && q1 < 5.5
        y = -0.00000008*x^2 + 0.0247*x + 0.0614;
    
            
        else
        if q1 >=5.5 && q1 < 7.5
       y = -0.0003*x^2 + 0.0479*x + 0.0231;
     
            
        else
        if q1 >=7.5 && q1 < 8.5
        y = -0.0005*x^2 + 0.0625*x + 0.0912;
    
            
        else
        if q1 >=8.5 && q1 < 10.5
        y = -0.0005*x^2 + 0.0658*x + 0.1156;
    
            
        else
        if q1 >=10.5 
        y = -0.0005*x^2 + 0.0658*x + 0.1156;
    
            
        
        end
        end
        end
        end
        end
        end
        end
    
        
        
        
        end        
    end
end


% Para valores de enf_LE muito baixos, os resultados não são precisos.
if q1<5
    if x< 3
        y = 0.015;
    end
else
        if x< 3
        y = 0.025;
        end
end

ak2 = y;





%% EST HORIZONTAL_________________________________________________//////


p1 = h.lambda;
x = h.enf_LE;
q1 = h.A;

if p1 <0.3
    
        if q1 >=0 && q1 < 1.5
        y = 0.0001*x^2 - 0.0042*x + 0.1202;

        
        else
        if q1 >=1.5 && q1 < 3.5
         y = 0.0003*x^2 - 0.0111*x + 0.13;
   
            
        else
        if q1 >=3.5 && q1 < 5.5
         y = 0.0003*x^2 - 0.0072*x + 0.1117;
   
            
        else
        if q1 >=5.5 && q1 < 7.5
         y = 0.0002*x^2 + 0.014*x + 0.0047;
   
            
        else
        if q1 >=7.5 && q1 < 8.5
         y = -0.00007*x^2 + 0.0321*x + 0.0126;
   
            
        else
        if q1 >=8.5 && q1 < 10.5
         y = -0.0002*x^2 + 0.0388*x + 0.0332;
   
            
        else
        if q1 >=10.5 
          y = -0.0002*x^2 + 0.0388*x + 0.0332;
  
            
        
        end
        end
        end
        end
        end
        end
        end
    
    
    
else
    
    if p1 > 0.3 && p1 <0.7
    
        if q1 >=0 && q1 < 1.5
        y = 0.0003*x^2 - 0.011*x + 0.1363;

        
        else
        if q1 >=1.5 && q1 < 3.5
         y = 0.0005*x^2 - 0.0182*x +0.1853;%em uso
   
            
        else
        if q1 >=3.5 && q1 < 5.5
         y = 0.0002*x^2 + 0.0081*x + 0.0721;
   
            
        else
        if q1 >=5.5 && q1 < 7.5
        y = -0.00005*x^2 + 0.0309*x + 0.0139;
    
            
        else
        if q1 >=7.5 && q1 < 8.5
        y = -0.0004*x^2 + 0.0574*x + 0.0546;
    
            
        else
        if q1 >=8.5 && q1 < 10.5
        y = -0.0005*x^2 + 0.0625*x + 0.0912;
    
            
        else
        if q1 >=10.5 
        y = -0.0005*x^2 + 0.0625*x + 0.0912;
    
            
        
        end
        end
        end
        end
        end
        end
        end
    
    
    else
        
        
        if p1 >0.7 
    
        if q1 >=0 && q1 < 1.5
        y = 0.0003*x^2 - 0.0117*x + 0.1382;

        
        else
        if q1 >=1.5 && q1 < 3.5
       y = 0.0004*x^2 - 0.0108*x + 0.14;
     
            
        else
        if q1 >=3.5 && q1 < 5.5
        y = -0.00000008*x^2 + 0.0247*x + 0.0614;
    
            
        else
        if q1 >=5.5 && q1 < 7.5
       y = -0.0003*x^2 + 0.0479*x + 0.0231;
     
            
        else
        if q1 >=7.5 && q1 < 8.5
        y = -0.0005*x^2 + 0.0625*x + 0.0912;
    
            
        else
        if q1 >=8.5 && q1 < 10.5
        y = -0.0005*x^2 + 0.0658*x + 0.1156;
    
            
        else
        if q1 >=10.5 
        y = -0.0005*x^2 + 0.0658*x + 0.1156;
    
            
        
        end
        end
        end
        end
        end
        end
        end
    
        
        
        
        end        
    end
end


% Para valores de enf_LE muito baixos, os resultados não são precisos.
if q1<5
    if x< 3
        y = 0.02;
    end
else
        if x< 3
        y = 0.04;
        end
end

hk2 = y;



%% EST VERTICAL_________________________________________________//////

p1 = v.lambda;
x= v.enf_LE;
q1 = v.A;

if p1 <0.3
    
        if q1 >=0 && q1 < 1.5
        y = 0.0001*x^2 - 0.0042*x + 0.1202;

        
        else
        if q1 >=1.5 && q1 < 3.5
         y = 0.0003*x^2 - 0.0111*x + 0.13;
   
            
        else
        if q1 >=3.5 && q1 < 5.5
         y = 0.0003*x^2 - 0.0072*x + 0.1117;
   
            
        else
        if q1 >=5.5 && q1 < 7.5
         y = 0.0002*x^2 + 0.014*x + 0.0047;
   
            
        else
        if q1 >=7.5 && q1 < 8.5
         y = -0.00007*x^2 + 0.0321*x + 0.0126;
   
            
        else
        if q1 >=8.5 && q1 < 10.5
         y = -0.0002*x^2 + 0.0388*x + 0.0332;
   
            
        else
        if q1 >=10.5 
          y = -0.0002*x^2 + 0.0388*x + 0.0332;
  
            
        
        end
        end
        end
        end
        end
        end
        end
    
    
    
else
    
    if p1 > 0.3 && p1 <0.7
    
        if q1 >=0 && q1 < 1.5
        y = 0.0003*x^2 - 0.011*x + 0.0663;%%

        
        else
        if q1 >=1.5 && q1 < 3.5
         y = 0.0005*x^2 - 0.0182*x + 0.1494;
   
            
        else
        if q1 >=3.5 && q1 < 5.5
         y = 0.0002*x^2 + 0.0081*x + 0.0721;
   
            
        else
        if q1 >=5.5 && q1 < 7.5
        y = -0.00005*x^2 + 0.0309*x + 0.0139;
    
            
        else
        if q1 >=7.5 && q1 < 8.5
        y = -0.0004*x^2 + 0.0574*x + 0.0546;
    
            
        else
        if q1 >=8.5 && q1 < 10.5
        y = -0.0005*x^2 + 0.0625*x + 0.0912;
    
            
        else
        if q1 >=10.5 
        y = -0.0005*x^2 + 0.0625*x + 0.0912;
    
            
        
        end
        end
        end
        end
        end
        end
        end
    
    
    else
        
        
        if p1 >0.7 
    
        if q1 >=0 && q1 < 1.5
        y = 0.0003*x^2 - 0.0117*x + 0.1382;

        
        else
        if q1 >=1.5 && q1 < 3.5
       y = 0.0004*x^2 - 0.0108*x + 0.14;
     
            
        else
        if q1 >=3.5 && q1 < 5.5
        y = -0.00000008*x^2 + 0.0247*x + 0.0614;
    
            
        else
        if q1 >=5.5 && q1 < 7.5
        y = -0.0003*x^2 + 0.0479*x + 0.0231;
     
            
        else
        if q1 >=7.5 && q1 < 8.5
        y = -0.0005*x^2 + 0.0625*x + 0.0912;
    
            
        else
        if q1 >=8.5 && q1 < 10.5
        y = -0.0005*x^2 + 0.0658*x + 0.1156;
    
            
        else
        if q1 >=10.5 
        y = -0.0005*x^2 + 0.0658*x + 0.1156;
    
            
        
        end
        end
        end
        end
        end
        end
        end
    
        
        
        
        end        
    end
end

% Para valores de enf_LE muito baixos, os resultados não são precisos.
if q1<5
    if x< 3
        y = 0.02;
    end
else
        if x< 3
        y = 0.04;
        end
end


vk2 = y;





















%% __________________________X_ac dos perfis__________________________%%
%Fig. 3.9

%% ASA____________________________________________________________/////

ap= a.X_ac_p; %xac/cr

%CALCULO DE k1

x= a.lambda;


ak1 = 0.544*x^3 - 0.9633*x^2 - 0.0803*x + 1.5002;

%a.X_ac

a.X_ac = ak1*(ap-ak2);




%% EST HOR________________________________________________________/////



hp= h.X_ac_p; %xac/cr

%CALCULO DE k1

x= h.lambda;


hk1 = 0.544*x^3 - 0.9633*x^2 - 0.0803*x + 1.5002;

%h.X_ac


h.X_ac = hk1*(hp-hk2);


%% EST.VER________________________________________________________/////

vp= v.X_ac_p; %xac/cr

%CALCULO DE k1

x= v.lambda;


vk1 = 0.544*x^3 - 0.9633*x^2 - 0.0803*x + 1.5002;

%v.X_ac


v.X_ac = vk1*(vp-vk2);



















%% ___________________CALCULO POSIÇÃO DO X_AC_________________________%%

%if a.A>5 && a.enf_LE <35
 
 %a.X_ac = 0.25;
%end



a.X_ac_real = a.X_ac*a.c_barra+a.X_LE_cb;
h.X_ac_real = h.X_ac*h.c_barra+h.X_LE_cb;
v.X_ac_real = v.X_ac*v.c_barra+v.X_LE_cb;




%CALCULANDO FATOR DE CORREÇÃO DA FUSELAGEM PARA A ASA
%Multihopp strip-integration Method 

%FIG 3.12 



% Simulando FIgura 3.13

if a.CL_alfa_rad >= 0.0777 && a.CL_alfa_rad <=0.0833
    
x = f.dxi1/f.c;
y = 0.241*x^2 - 0.8316*x + 1.7491;

diffealpha1 = y ;

diffealpha2 = (1 - alpha.diffezinalfa_M)*f.xi2/f.lh;



diffMalpha = (c.q_barra/36.5)* (f.w1^2*diffealpha1*f.dxi1+f.w2^2*diffealpha2*f.dxi2);

xb = -diffMalpha/(c.q_barra*a.S*a.c_barra*a.CL_alfa);


else
    
    
%% Dados para o Calculo do Gradiente de downwash para velocidades baixas

KA_h = (1/h.A) - (1/(1+ h.A^1.7));

Klamb_h = (10 - 3*h.lambda)/ 7;

KH_h = (1- (h.h/h.b)) / ((2*h.l/h.b)^(1/3));

%DEFININDO    CL_alfa = 0.8 deg-1;
CL_alfa_rad = 0.08;
    
%% Gradiente de downwash para velocidades baixas

alpha.diffezinalfa_M0 = 4.44 * (KA_h * Klamb_h * KH_h * (cos(a.enf_c4_rad))^(1/2))^1.19;


alpha.diffezinalfa_M = alpha.diffezinalfa_M0 * (CL_alfa_rad/ a.CL_alfa_M0_rad);



x = f.xi1/f.c;
y = 0.241*x^2 - 0.8316*x + 1.7491;

diffealpha1q = y ;

diffealpha2q = (1-alpha.diffezinalfa_M)*f.xi2/f.lh;


diffealpha1 = diffealpha1q* (a.CL_alfa/0.08);
diffealpha2 = diffealpha2q* (a.CL_alfa/0.08);

diffMalpha = (c.q_barra/36.5)* (f.w1^2*diffealpha1*f.dxi1+f.w2^2*diffealpha2*f.dxi2);

xb = -diffMalpha/(c.q_barra*a.S*a.c_barra*a.CL_alfa);    %FATOR DE CORREÇÃO DA FUSELAGEM PARA A ASA




end

a.X_ac_wb = a.X_ac+xb;


%% ____________________________X_ac AERONAVE_________________________%%


h.X_ac_cb =  (h.X_ac_real - a.X_LE)/a.c_barra;

p1=(h.CL_alfa/a.CL_alfa_WB);
p2= h.n*(h.S/a.S)*h.X_ac_cb;
p3=(1-alpha.diffezinalfa_M);
p4 = 1+ p1* h.n * (h.S/a.S) *p3;



b.X_ac = (a.X_ac_wb + p1*p2*p3)/(p4); %b.x_ac tem q dar -0.3888

b.X_ac2 = (a.X_ac_wb + (h.CL_alfa/a.CL_alfa_WB)*h.n*(h.S/a.S)*h.X_ac*(1-alpha.diffezinalfa_M))/(1+(h.CL_alfa/a.CL_alfa_WB)*h.n*(h.S/a.S)*(1-alpha.diffezinalfa_M));

p = (b.X_ac * a.c_barra);           %p é a diferença das distâncias

b.X_ac_real =  p + a.X_LE;
                               %utilizando como referencia o nariz










end
    
        