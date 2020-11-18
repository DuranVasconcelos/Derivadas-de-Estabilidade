function [a,c,CL,v] = fCn_rV (a,c,CL,v)
%Função que estima a contribuição do estabilizador vertical para a derivada
%Cn_r

v.Cn_r = 2/a.b^2 *(v.l*cos(c.alpha)+ v.zmgc*sin(c.alpha))^2 *v.Cy_B;

end