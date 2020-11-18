function [CL,a,c,v,p] = fRoll (CL,a,c,v,h)

%% Cy_p [rad-1]

[v,p,a] =  fCy_p (v,c,a);

%% Cl_p [rad-1]

[h,c,a,v,p]=fCl_p(h,c,a,v,p);


%% Cn_p [rad-1]

[CL,a,c,v,p] = fCn_p (CL,a,c,p,v);

end