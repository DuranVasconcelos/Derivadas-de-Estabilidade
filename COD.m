%% CODIGO GERAL
clc; close all; clear all

% clear all; %#ok<CLALL>


%% PARAMETROS DE ENTRADA DA AERONAVE

%% DADOS GEOMÉTRICOS

%% ESCALA

%Medida de referencia: Envergadura da asa

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
                                    %Ponto de referência: Nariz
                          
a.teta = 0;                         %[Torção da asa]
                          
a.diedro = 0;                       %[Diedro]


a.zw = -0.039*esc;                  %[m](distancia da linha de centro ...

%   até o quarto da corda da raiz da asa exposta (em y))

                                    %Obs: É positivo para asa baixa ...
%   e negativo para asa alta


%% Aerofólio da ASA [2412]

a.cl_alpha_M0 = 0.105 *180/pi; %[1/rad]


%% EST.HORIZONTAL

%% GEOMETRIA DO EST. HORIZONTAL


h.b = 0.2140*esc;                                   %[m]    (Envergvdura)

h.C_t = 0.0429*esc;                                 %[m]   (Corda na ponta)

h.C_r = 0.07978*esc;                                %[m]   (Corda na raiz)


h.enf_LE = 10.8;                                    %[deg] (Enflechamento)

h.enf_LE_rad = h.enf_LE* (pi/180);                  %[rad] (Enflechamento)


h.X_LE = 0.3917*esc;                  %[m] (Localização do bordo de ataque)
                                      %Ponto de referencia: Nariz
                 
 
                 
h.diedro = 0;                                       %[Diedro]
                 
                 
h.zw = 0;              %[m](distancia da linha de centro até o quarto da...

 %corda da raiz do EH exposta (em y))

                    %Obs: É positivo para EH baixo e negativo para EH alto

              
h.h = 0.0482*esc;       %[m]   Altura entre c_barra/4 do est. horizontal...
 
 %e do c_barra/4 da asa
                        
                             
%% Aerofólio do est horizontal [2412]

h.cl_alpha_M0 = 0.105 * (180/pi); %[1/rad]


%% RAZAO DE PRESSÃO DINAMICA EST.HORIZONTAL

h.n = 0.9;  %Razão da pressão dinamica no est.horizontal
            %Assume-se um valor entre 0.9 e 1
            %Utiliza-se 0.9 para power-off flights 
            

%% EST.VERTICAL 

%% GEOMETRIA DO EST. VERTICAL


v.b = 0.0913*esc;                                   %[m]    (Envergvdura)

v.C_r = 0.08586*esc;                                %[m]   (Corda na raiz)

v.C_t = 0.04428*esc;                                %[m]   (Cordv na ponta)
 

v.enf_LE = 42.28;                                   %[deg] (Enflechamento)

v.enf_LE_rad = v.enf_LE* (pi/180);                  %[rad] (Enflechamento)


v.X_LE = 0.3918*esc;                   %[m](Localização do bordo de ataque)
                                       %Ponto de referencia: Nariz

                 
%% Aerofólio do EV [2412]

v.cl_alpha_M0 = 0.105 * (180/pi); %[1/rad]


%% FUNÇÃO PARA CALCULO DAS PROPRIEDADES GEOMETRICAS

[a,h,v] = fGeometria(a,h,v);

%% CONDIÇÃO DE VOO [CRUZEIRO]

c.h = distdim(5000,'ft','m');  %[m]        (Altura de voo)

c.M = 0.201;                   %[adm]      (Numero de Mach)

c.U_1 = 67.08648;              %[m/ASA.S]  (Velocidade eixo x)

c.q_barra = 2374.861;          %[kg/ m^2]  (Pressão dinamica)

c.alpha = 0;                   %[rad]      (Inclinação da aeronave)

c.X_cg_c_barra = 26.4;         %[m]  (Localização do CG, fração de c_barra)

                                              
c.B = (1 - c.M^2)^(1/2);       %[adm](Beta)(Fator de correção de ...

 %compressibilidade)  

c.Rl= 16;                      %(Numero de Reynolds 10^-6)


%% CALCULO DA POSIÇÃO DO CENTRO GRAVITACIONAL DA AERONAVE 

[c,a] = calcCG(c,a);
                               
                               
%% COEFICIENTES DE SUSTENTAÇAO /ARRASTO/ MOMENTO DE ARFAGEM

CL = 0.307;
CD = 0.0270;
Cm = 0.04;

%% CORPO

%% GEOMETRIA DO CORPO


b.Lf = 0.4767*esc;            %[m] (Comprimento da fuselagem)


b.S = 0.1022*esc^2;           %[m^2] (area do corpo)

b.So = 0.00587352*esc^2;      %[m^2] (area transversal média do corpo)

b.Ss = 0.02402731*esc^2;      %[m^2] (area lateral apenas da fuselagem)

                            
b.D = 0.08590 * esc;             %[m] (Diametro da fuseselagem)  
                      
b.h = 0.08590 * esc;             %[m]diametro max do corpo


b.h1 = 0.08590*esc;              %[m]diametro no a.X_LE

b.h2 = 0.03*esc;                 %[m]diametro no v.X_LE


b.h1f = 0.07980*esc;      %[m] (diametro a 1/4 do Comprimento da fuselagem)

b.h2f = 0.04656*esc;      %[m] (diametro a 3/4 do Comprimento da fuselagem)

b.maxW = 0.0735*esc;      %[m] (Largura max da fuselagem)
 

b.hy = 0.1200*esc;        %[m]h_max_corpo na area de intercecao com...
 
    %a asa desde a roda

b.D1 = 0.03*esc;          %Profundidade da fuselagem na regiao...
    
    %do est vertical)
                             


%% ______________________DERIVADAS LONGITUDINAIS_____________________%%

[a,h,v,b,c,CL,alpha,u,q,dalpha] = fLongitudinais(a,h,v,b,c,CL,esc);

 
 %% ______________________DERIVADAS LATERO-DIRECI_____________________%%
 
[a,h,v,b,c,CL,alpha,B,p,r] = fLaterodirecionais(a,h,v,b,c,CL,alpha);
 

 


%% TEXTO

disp('Lista de resultados')


disp('Superficies de sustentação:')
disp('a = ASA')
disp(a)
disp('h = Est. Horizontal')
disp(h)
disp('v = Est. Vertical')
disp(v)
disp('b = Corpo da aeronave')
disp(b)


disp('c = Condição de voo:')
disp(c)

disp('Derivadas Longitudinais:')
disp('alpha = Derivadas em rel. alpha')
disp(alpha)
disp('u = Derivadas em rel. velocidade[u]')
disp(u)
disp('q = Derivadas em rel. pressão dinamica')
disp(q)
disp('dalpha = Derivadas em rel. derivada de alpha')
disp(dalpha) 


disp('Derivadas Latero-direcionais:')
disp('Derivadas em relação ao angulo de derrapagem')
disp(B)
disp('Derivadas em relação a taxa de rolagem') 
disp(p)
disp('Derivadas em relação a taxa de guinada')
disp(r)








