function [c,a] = calcCG(c,a)
%Função que calcula posição real do C.G da aeronave
%Dados de entrada:
%
%c.X_cg_c_barra
%a.c_barra
%
%Dados de Saida:
%c.X_cg


%% Calculo CG

% Computa-se a localização do C.G. em porcentagem da CAM como segue:
% (1) Encontra-se a diferença existente na distância entre o ponto de localização do C.G. do
% peso vazio e o plano de referência, e a distância entre o bordo de ataque da CAM e o plano
% de referência;
% (2) Divide-se a diferença pelo comprimento da CAM;
% (3) Multiplica-se o resultado por 100;
% 15
% (4) O resultado final é então expresso em porcentagem. 



p = ((c.X_cg_c_barra/100) * a.c_barra); %p é a diferença das distâncias

c.X_cg = p + a.X_LE;
                               %utilizando como referencia o nariz