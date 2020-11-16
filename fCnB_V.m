function [v] =  fCnB_V (v,c)



v.l = abs(c.X_cg - v.X_ac_real);

p = (v.zmgc*cos(c.alpha) + v.l*sin(c.alpha))/v.b;

v.Cn_B = -v.Cy_B* p ;