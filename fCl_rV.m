function [a,c,CL,v]= fCl_rV (a,c,CL,v)
%Fun��o que estima a contribui��o do estabilizador vertical para a derivada
%Cl_r

v.Cl_r = -2/a.b^2 *(v.l*cos(c.alpha)+v.zmgc*sin(c.alpha))*((v.zmgc*cos(c.alpha)- v.l*sin(c.alpha)) * v.Cy_B);

end