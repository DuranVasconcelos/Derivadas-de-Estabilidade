function [c,a] = calcCG(c,a)
%Fun��o que calcula posi��o real do C.G da aeronave
%Dados de entrada:
%
%c.X_cg_c_barra
%a.c_barra
%
%Dados de Saida:
%c.X_cg


%% Calculo CG

% Computa-se a localiza��o do C.G. em porcentagem da CAM como segue:
% (1) Encontra-se a diferen�a existente na dist�ncia entre o ponto de localiza��o do C.G. do
% peso vazio e o plano de refer�ncia, e a dist�ncia entre o bordo de ataque da CAM e o plano
% de refer�ncia;
% (2) Divide-se a diferen�a pelo comprimento da CAM;
% (3) Multiplica-se o resultado por 100;
% 15
% (4) O resultado final � ent�o expresso em porcentagem. 



p = ((c.X_cg_c_barra/100) * a.c_barra); %p � a diferen�a das dist�ncias

c.X_cg = p + a.X_LE;
                               %utilizando como referencia o nariz