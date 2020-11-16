%% CODIGO GERAL
clc; close all; clear all

% clear all; %#ok<CLALL>



%% RESULTADOS IDEAIS


%[ok]
i.alphaCL = 4.41;
i.alphaCD = 0;
i.alphaCm = -0.613;

%[ok]
i.uCL= 0;
i.uCD= 0;
i.uCm= 0;

%[ok]
i.qCL= 3.9;
i.qCD= 0;
i.qCm= -12.4;

%[ok]
i.dalphaCL= 1.7;
i.dalphaCD= 0;
i.dalphaCm= -7.27;

%[ok]
i.Cy_B = -0.404;
i.Cl_B = -0.0895;
i.Cn_B = 0.0907;  

%[ok]
i.Cy_P= -0.145;   
i.Cl_p= -0.487;   
i.Cn_P= -0.0278; 

%[]
i.Cy_r= 0.214;
i.Cl_r= 0.0798;
i.Cn_r= -0.00937;





%% DADOS DA AERONAVE

%% Dados de massa

m.W = 1202.02;      %[kg] (Peso da aeronave)

m.I_xx = 1285.3154; %[kg*m^2]
m.I_yy = 1824.9309; %[kg*m^2]
m.I_zz = 2666.8939; %[kg*m^2]
m.I_xz = 0;         %[kg*m^2]


%% DADOS GEOMÉTRICOS

%% ESCALA
%tomando como base a medida da envergadura da asa

%desenho livro //   36 ft = 10.9728 m

%desenho cad   //   10.9728 m  = 0.66 m
                                  
%escala do cad para real

esc = 10.9728/0.66;






%% ASA

%% GEOMETRIA DA ASA


a.b = 0.6600*esc;                           %[m]     (Envergadura da asa)

a.C_t = 0.0685*esc;                         %[m]     (Corda na ponta)

a.C_r = 0.10274*esc;                        %[m]     (Corda na raiz)


a.enf_LE = 1.85;                            %[deg] (Enflechamento)

a.enf_LE_rad = a.enf_LE *pi/180;            %[rad] (Enflechamento) 



a.X_LE = 0.13631*esc;               %[m] (Localização do bordo de ataque)
                                    %Nariz como ponto de referência
                          
                          
a.diedro = 0;                       %[Diedro]


a.zw = -0.039*esc;                  %[m](distancia da linha de centro ...

%   até o quarto da corda da raiz da asa exposta (em y))

                                    %Obs: É positivo para asa baixa ...
%   e negativo para asa alta








%% Aerofólio da ASA [2412]

a.cl_alpha_M0 = 0.105 *180/pi; %[1/rad]




%% EST.HORIZONTAL

%% GEOMETRIA DO EST. HORIZONTAL


h.b = 0.2140*esc;    %[m]    (Envergvdura)
h.C_t = 0.0429*esc;  %[m]   (Corda na ponta)
h.C_r = 0.07978*esc; %[m]   (Corda na raiz)


h.enf_LE = 10.8;                   %[deg] (Enflechamento)
h.enf_LE_rad = h.enf_LE* (pi/180);  %[rad] (Enflechamento)


h.X_LE = 0.3917*esc; %[m] (Localização do bordo de ataque)
                 %ponto de referencia é o nariz
                 
 
                 
h.diedro = 0;                 
                 
                 
h.zw = 0; %[m](distancia da linha de centro até o quarto da corda da raiz do EH exposta (em y))

%Obs: É positivo para EH baixo e negativo para EH alto
                 





h.h = 0.0482*esc;       %[m]   Altura entre c_barra/4 do est. horizontal e do c_barra/4 da asa
                        
                                




%% Aerofólio do est horizontal [2412]

h.cl_alpha_M0 = 0.105 * (180/pi); %1/rad


%% RAZAO DE PRESSÃO DINAMICA EST.HORIZONTAL

h.n = 0.9; %Razão da pressão dinamica no est.horizontal
            %Assume-se um valor entre 0.9 e 1
            %Utiliza-se 0.9 para power-off flights 
            %h.n = h.q/q p/ h.q= 1.482*v.sig*v.M (pag 109 pdf/eq3.15)
            

%% EST.VERTICAL 

%% GEOMETRIA DO EST. VERTICAL



v.b = 0.0913*esc;            %[m]    (Envergvdura)

v.C_r = 0.08586*esc;         %[m]   (Corda na raiz)
v.C_t = 0.04428*esc;         %[m]   (Cordv na ponta)
 


v.enf_LE = 42.28;                   %[deg] (Enflechamento)
v.enf_LE_rad = v.enf_LE* (pi/180);  %[rad] (Enflechamento)


v.X_LE = 0.3918*esc; %[m] (Localização do bordo de ataque)
                     %ponto de referencia é o nariz


 


                 
%% Aerofólio do EV [2412]

v.cl_alpha_M0 = 0.105 * (180/pi); %[1/rad]











%% FUNÇÃO PARA CALCULO DAS PROPRIEDADES GEOMETRICAS

[a,h,v] = fGeometria(a,h,v);




%% CONDIÇÃO DE VOO [CRUZEIRO]

c.h = distdim(5000,'ft','m');  %[m]        (Altura de voo)
c.M = 0.201;                   %[adm]      (Numero de Mach)
c.U_1 = 67.08648;              %[m/ASA.S]  (Velocidade eixo x)
c.q_barra = 2374.861;          %[kg/ m^2]  (Pressão dinamica)

c.alpha = 0;                   %[deg]      (Inclinação da aeronave)

c.X_cg_c_barra = 26.4;         %[m]    (Localização do CG, fração de c_barra)

                                              
c.B = (1 - c.M^2)^(1/2);       %[adm]   (Beta)(Fator de correção de compressibilidade)  

c.Rl= 16;                      %(Numero de Reynolds 10^-6)(Precisa ser calculado)







%% Calculo CG

[c,a] = calcCG(c,a);
                               
                               
%% DERIVADAS PRINCIPAIS



CL = 0.307;





%% CORPO
%% GEOMETRIA DO CORPO


b.Lf = 0.4767*esc;            %[m] (Comprimento da fuselagem)


b.S = 0.1022*esc^2;           %[m^2] (area do corpo) (bem mal calculada)
b.So = 0.00587352*esc^2;      %[m^2] (area transversal média do corpo)
b.Ss = 0.02402731*esc^2;      %[m^2] (area lateral apenas da fuselagem)



                            
b.D = 0.08590 * esc;             %[m] (Diametro da fuseselagem)                        
b.h = 0.08590 * esc;             %[m]diametro max do corpo




b.h1 = 0.08590*esc;              %[m]diametro no a.X_LE

b.h2 = 0.03*esc;                 %[m]diametro no v.X_LE



b.h1f = 0.07980*esc;             %[m] (diametro a 1/4 do Comprimento da fuselagem)

b.h2f = 0.04656*esc;             %[m] (diametro a 3/4 do Comprimento da fuselagem)

b.maxW = 0.0735*esc;             %[m] (Largura max da fuselagem)
 

b.hy = 0.1200*esc;               %[m]h_max_corpo na area de intercecao com a asa desde a roda

b.D1 = 0.03*esc;                 %Profundidade da fuselagem na regiao do est vertical)
                                 %Coloquei o diametro em LE do vt


%% ______________________DERIVADAS LONGITUDINAIS_____________________%%


%%  DERIVADAS DO ANGULO DE ATAQUE


%CL_alpha [rad-1]

[a,h,v,b,c,alpha] = fAlpha(a,h,v,b,c);   





%__________________CalculoX_AC dos perfis [xac/cr]____________________//
[a,h,v,b,c,alpha] = calculoX_AC (a,h,v,b,c,alpha);

%FIG 3.12 
%DADOS DE ENTRADA NECESSARIOS P/ calculo de X_ac:

%I) Divida a distancia do nariz ao x_LE em 5 partes.
%II) Divida a distancia do x_c4 do est.Horizontal ao trailling edge em 5
%partes.

f.c = 0.10274*esc;      %distancia entre LE e TE

f.dxi1 = 0.02726*esc;   %comprimento das partes da div.I
f.dxi2 = 0.05951*esc;   %comprimento das partes da div.II

f.lh = 0.17854*esc;     %distancia do x_c4 do est.Horizontal ao trailling edge

f.xi1 = 0.06815*esc;    %distancia entre o centro da terceira parte da div. I e x_LE
f.xi2 = 0.08927*esc;    %distancia entre o centro da segunda parte da div. II e trailling edge.

f.w1 = 0.06062*esc;     %largura da fuselagem em f.xi1
f.w2 = 0.04606*esc;     %largura da fuselagem em f.xi2

%CalculoX_AC real da aeronave e dos perfis [k1,k2,diff]

[a,h,v,b,c,alpha,f] = calculok2 (a,h,v,b,c,alpha,f);

%_____________________________________________________________________//


% Cm_alfa [rad-1]
[a,h,v,b,c,alpha,f] = fAlphaCm (a,h,v,b,c,alpha,f);





%% DERIVADAS DE VELOCIDADE (colocar formulação)

[c,CL,u]=fuCL(c,CL);






%% DERIVADAS DA TAXA DE ARFAGEM
 
[a,h,c,q,b] = fqCLt (a,h,c,b);






%% DERIVADAS DA TAXA DO ANGULO DE ATAQUE
 
[a,h,alpha,c,dalpha]= fdAlpha (a,h,alpha,c);


 
 
 
 
 
 
 

 
 
 
 
 
 
 %% ______________________DERIVADAS LATERO-DIRECI_____________________%%
 
 
 
%Calculo da area efetiva do Est. Vertical

[v]= fAreaV(h,v,b);
 

%Calculo de CL_alfa do Est. Vertical

[a,h,v,b,c,alpha] = fAlphaV(a,h,v,b,c,alpha);
 
 
%% DERIVADAS DO ANGULO DE DERRAPAGEM


%% Cy_B [ok]

[a,h,v,Cy_B]= fCyB(a,h,v,b,c);






%% Cl_B [ok] 

%Por ser uma figura complexa, recomenda-se a analise individual, por
%padrão,K_N está definido como -0.000035 (alterar linha 396) Figura 7.17 -
%REFERENCIA 1

[a]= fClB_WB (CL,a,c,b); %não sei lidar com alpha



%Por ser uma figura complexa, recomenda-se a analise individual, por
%padrão,K_N está definido como -0.000023 (alterar linha 388) Figura 7.17
%REFERENCIA 1

[h]= fClB_HB (CL,h,c,b);

[v] = fClB_V (v,c); %alpha

Cl_B = a.Cl_B + h.Cl_B + v.Cl_B;








%% Cn_B 

%a.Cn_B
a.Cn_B = 0; %[Negligenciavel]


%b.Cn_B

%Por ser uma figura complexa, recomenda-se a analise individual, por
%padrão,K_N está definido como -.0012 (alterar LINHA 21) Figura 7.19
%REFERENCIA 1

[c,b,a] = fCnB_b (c,b,a);


%v.Cn_B
[v] =  fCnB_V (v,c);


Cn_B = a.Cn_B + b.Cn_B +v.Cn_B;













%% DERIVADAS DA TAXA DE ROLAGEM

%% Cy_p [rad-1]

[v,Cy_P,a] =  fCyp (v,c,a); %conversar com machini(assumido do livro)

%% Cl_p [rad-1]

%a.Cl_P [rad-1]
[a,c]=fCl_pW(a,c);

%h.Cl_P [rad-1]
[h,c,a]=fCl_pH(h,c,a);

%v.Cl_P [rad-1]
[v] =  fCl_pV(v,c);


Cl_P = a.Cl_p + h.Cl_p +v.Cl_p; %[rad-1]


%% Cn_p [ok]


[CL,a,c,Cl_P,v,Cn_P] = fCn_p (CL,a,c,Cl_P,v);
 
 
 
 %% DERIVADAS DA TAXA DE GUINADA

%Cy_r [x]

[v,Cy_r] = fCy_r (v);



%Cl_r


%a.Cl_r

[a,c]= fCl_rW (a,c);
 
 
 
 
 
 
 
 
 
 


% %% TEXTO
% 
% disp('simbologia')
% disp('a = ASA')
% disp(a)
% disp('h = Est. Horizontal')
% disp(h)
% disp('v = Est. Vertical')
% disp(v)
% disp('b = Corpo da aeronave')
% disp(b)
% disp('c = Condição de voo')
% disp(c)
% disp('alpha = Derivadas em rel. alpha')
% disp(alpha)
% disp('u = Derivadas em rel. velocidade[u]')
% disp(u)
% disp('q = Derivadas em rel. pressão dinamica')
% disp(q)
% disp('dalpha = Derivadas em rel. derivada de alpha')
% disp(dalpha)
% 

% disp(Cy_B)
% disp(Cl_B)
% disp(Cn_B)
% 
% disp(Cy_P)
% disp(Cl_P)
% disp(Cn_P)
% 
% disp(Cy_r)
%disp(Cl_r)
%disp(Cn_r)










% 
% disp('i= resultados ideais Roskam')
% disp(i)










