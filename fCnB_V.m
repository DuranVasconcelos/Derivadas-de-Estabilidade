function [a,v,c] =  fCnB_V (a,v,c)



v.l = abs(c.X_cg - v.X_ac_real);

p = (v.zmgc*cos(c.alpha) + v.l*sin(c.alpha))/a.b;

v.Cn_B = -v.Cy_B* p ;