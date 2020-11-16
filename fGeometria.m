function [a,h,v] = fGeometria(a,h,v)
%Função que calcula propriedades geométricas básicas dos perfis da
%aeronave.
%
%Dados de entrada: 
%b
%S
%C_t
%C_r
%X_LE
%c_barra
%
%Dados de saida:
% A           Razao de aspecto
% lambda      Afilamento
% c_barra     Corda média
% X_c4        Posição do quarto de corda
% X_LE_cb     Posição do c_barra
% ymgc        Posição lateral mgc
% xmgc        Posição longitudinal mgc
% zmgc
% X_LE_cb       Posição do c_barra em rel x
% Y_LE_cb       Posição do c_barra em rel y
% Z_LE_cb P     osição do c_barra em rel z
% enf_c4
% enf_c2



%% GEOMETRIA DA ASA

a.lambda = a.C_t/a.C_r;                                                   %Afilamento
a.A = (2* a.b)/(a.C_r*(1+ a.lambda));                                     %Razao de aspecto
a.S = (a.b/2)*a.C_r*(1+ a.lambda);                                        %Area
a.c_barra = ((2/3)*a.C_r)*((1+ a.lambda+ a.lambda^2)/(1+a.lambda));       %Corda média

a.ymgc = (a.b*(1+2*a.lambda))/(6*(1+a.lambda));                           %Posição lateral mgc
a.xmgc = (a.b*(1+2*a.lambda))/(6*(1+a.lambda))*tan(a.enf_LE_rad);         %Posição longitudinal mgc


a.X_LE_cb = a.X_LE + a.xmgc;                                              %Posição do c_barra em rel x
a.Y_LE_cb = a.ymgc;                                                       %Posição do c_barra em rel y
a.X_c4= a.X_LE_cb + (a.c_barra/4);                                        %Posição do quarto de corda








tan_enf_c4 = abs(tan(a.enf_LE_rad)- (4*(a.c_barra/4)*(1-a.lambda))/(a.A*(1+a.lambda)));
a.enf_c4_rad = atan(tan_enf_c4) ;                                   %[rad] (Enflechamento)                    
a.enf_c4 = a.enf_c4_rad* (180/pi);                                  %[deg] (Enflechamento)



tan_enf_c2 = abs( tan(a.enf_LE_rad)- ((4*(a.c_barra/2)*(1-a.lambda))/(a.A* (1+a.lambda) )) );

a.enf_c2_rad = atan(tan_enf_c2) ;                                   %[rad] (Enflechamento)                    
a.enf_c2 = a.enf_c2_rad* (180/pi);                                  %[deg] (Enflechamento)



%% GEOMETRIA DO EST. HORIZONTAL


h.lambda = h.C_t/h.C_r;                                                   %Afilamento
h.A = (2* h.b)/(h.C_r*(1+ h.lambda));                                     %Razao de aspecto
h.S = (h.b/2)*h.C_r*(1+ h.lambda);                                        %Area
h.c_barra = ((2/3)*h.C_r)*((1+ h.lambda+ h.lambda^2)/(1+h.lambda));       %Corda média

h.ymgc = (h.b*(1+2*h.lambda))/(6*(1+h.lambda));                           %Posição lateral mgc
h.xmgc = (h.b*(1+2*h.lambda))/(6*(1+h.lambda))*tan(h.enf_LE_rad);         %Posição longitudinal mgc


h.X_LE_cb = h.X_LE + h.xmgc;                                              %Posição do c_barra em rel x
h.Y_LE_cb = h.ymgc;                                                       %Posição do c_barra em rel y
h.X_c4= h.X_LE_cb + (h.c_barra/4);                                        %Posição do quarto de corda








tan_enf_c4 = abs(tan(h.enf_LE_rad)- (4*(h.c_barra/4)*(1-h.lambda))/(h.A*(1+h.lambda)));
h.enf_c4_rad = atan(tan_enf_c4) ;                                   %[rad] (Enflechamento)                    
h.enf_c4 = h.enf_c4_rad* (180/pi);                                  %[deg] (Enflechamento)



tan_enf_c2 = abs( tan(h.enf_LE_rad)- ((4*(h.c_barra/2)*(1-h.lambda))/(h.A* (1+h.lambda) )) );

h.enf_c2_rad = atan(tan_enf_c2) ;                                   %[rad] (Enflechamento)                    
h.enf_c2 = h.enf_c2_rad* (180/pi);                                  %[deg] (Enflechamento)






h.l = abs(h.X_c4 - a.X_c4); % l_H é a distancia entre c_barra/4 do est. horizontal e do c_barra/4 da asa









%% GEOMETRIA DO EST. VERTICAL

v.lambda = v.C_t/v.C_r;                                                   %Afilamento
v.A = (2* v.b)/(v.C_r*(1+ v.lambda));                                     %Razao de aspecto
v.S = (v.b/2)*v.C_r*(1+ v.lambda);                                        %Area
v.c_barra = ((2/3)*v.C_r)*((1+ v.lambda+ v.lambda^2)/(1+v.lambda));       %Corda média

v.zmgc = (v.b*(1+2*v.lambda))/(6*(1+v.lambda));                           %Posição lateral mgc
v.xmgc = (v.b*(1+2*v.lambda))/(6*(1+v.lambda))*tan(v.enf_LE_rad);         %Posição longitudinal mgc


v.X_LE_cb = v.X_LE + v.xmgc;                                              %Posição do c_barra em rel x
v.Z_LE_cb = v.zmgc;                                                       %Posição do c_barra em rel y
v.X_c4= v.X_LE_cb + (v.c_barra/4);                                        %Posição do quarto de corda








tan_enf_c4 = abs(tan(v.enf_LE_rad)- (4*(v.c_barra/4)*(1-v.lambda))/(v.A*(1+v.lambda)));

v.enf_c4_rad = atan(tan_enf_c4) ;                                   %[rad] (Enflechamento)                    
v.enf_c4 = v.enf_c4_rad* (180/pi);                                  %[deg] (Enflechamento)



tan_enf_c2 = abs( tan(v.enf_LE_rad)- ((4*(v.c_barra/2)*(1-v.lambda))/(v.A* (1+v.lambda) )) );

v.enf_c2_rad = atan(tan_enf_c2) ;                                   %[rad] (Enflechamento)                    
v.enf_c2 = v.enf_c2_rad* (180/pi);                                  %[deg] (Enflechamento)




end