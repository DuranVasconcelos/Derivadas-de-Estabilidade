function [v,p,a] =  fCy_p (v,c,a)
%Funçao que calcula a derivada da taxa de rolagem em relação a Cy
%
%DADOS DE SAIDA:
%Cy_P    Derivada da taxa de rolagem em relação a Cy


%Metodo 1: Pela Figura 6.63 do livro Airplane Flight Dynamisc... (Roskam)

%Para aeronave pequena, single piston-engine, such as the Cessna 182

%P/ CL = 0.37

p.Cy_P = -0.145;



% %Metodo 2: Através da eq 8.1  da referencia 1
% 
% v.l = abs(c.X_cg - v.X_ac_real);
% 
% p = (v.zmgc*cos(c.alpha) - v.l*sin(c.alpha))/a.b;
% 
% 
% p.Cy_P = 2* p * v.Cy_B;
% 
% 
% %Metodo 3: Definindo como nula (negligenciavel)
% 
% p.Cy_P= 0;



end