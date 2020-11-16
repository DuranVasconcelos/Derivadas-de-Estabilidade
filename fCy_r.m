function [v,Cy_r] = fCy_r (v)

%Cy_r tem pouca importancia

c.alpha = 0;
c.alpha_rad = c.alpha * (pi/180);  %[rad]

p1 =(v.l * cos(c.alpha_rad) + v.zmgc * sin(c.alpha_rad));

Cy_r = -(2/v.b)* p1 * v.Cy_B;