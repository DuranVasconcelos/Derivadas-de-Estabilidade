function [a,c]= fCl_rW (a,c)





%% Cl_r/CL para CL=0 e M =0


q1 = 0.4;


%% Cl_r/CL para CL=0 e M ~=0

e= cos(a.enf_c4);

B = sqrt(1-c.M^2*e.^2);

e1= 1+(a.A*(1-B^2)/(2*B*(a.A*B+ 2* e )));

e2=  (a.A*B+2*e)/(a.A*B+4*e);

e3= tan(a.enf_c4).^2/8;

e4= 1+((a.A+2*e)/(a.A+4*e));

e5= tan(a.enf_c4).^2/8;


q2= (e1+e2*e3)/(e4*e5)*q1;


%% DCl_r/diedro


%% diedro


%% DCl_r/teta


%% teta


%% DCl_r/alfa_Sigm_f


%% Sigm_f


%% alfa_Sigm_f*Sigm_F