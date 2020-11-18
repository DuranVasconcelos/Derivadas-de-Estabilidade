function [a,c,CL,v] = fCn_rV (a,c,CL,v)
%Fun��o que estima a contribui��o do estabilizador vertical para a derivada
%Cn_r

v.Cn_r = 2/a.b^2 *(v.l*cos(c.alpha)+ v.zmgc*sin(c.alpha))^2 *v.Cy_B;

end