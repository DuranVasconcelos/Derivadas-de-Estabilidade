function [h,c,a,v,p] = fCl_p(h,c,a,v,p)


%a.Cl_P [rad-1]
[a,c]=fCl_pW(a,c);

%h.Cl_P [rad-1]
[h,c,a]=fCl_pH(h,c,a);

%v.Cl_P [rad-1]
[v] =  fCl_pV(v,c);


%% DEFINIÇÃO DA DERIVADA Cl_P

p.Cl_p = a.Cl_p + h.Cl_p +v.Cl_p; %[rad-1]
