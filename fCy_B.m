function [a,h,v,B]= fCy_B(a,h,v,b,c)
%Função que calcula as derivadas do angulo de derrapagem em relação a Cy.
%
% DADOS DE SAIDA:
% Cy_B Derivadas do angulo de derrapagem
%



%Cy_B_W [rad-1]

a.Cy_B = -0.0001 * a.diedro * 57.3; %[rad-1]


%Cy_B_BE [rad-1]

x = a.zw/(b.hy/2); %[adm]

if a.zw > 0
    y = 1.5 * abs(x);
else
    y = 1.85* abs(x);
end

Ki = y; %[adm]

%h.Cy_B [rad-1]


b.Cy_B = - 2* Ki* (b.So/b.S); %[rad-1]










%% v.Cy_B [rad-1]

%k [adm]
p4 = v.b/b.D1;

if p4< 2
    k = 0.76;
else
    if p4>=2 && p4 <3.5
    k = 0.925;
    else
        if p4 >=3.5
            k= 1;
        end
    end
end


% (1 + diff(sigma,B) *n_V

p5 = 0.724 + 3.06 * ((v.S/a.S)/(1+cos(a.enf_c4_rad))) + 0.4 *(a.zw/b.hy) + 0.009*v.A;


% v.Cy_B [rad-1]

v.Cy_B = -k * v.CL_alfa * p5 * (v.S/a.S); %[rad-1]




%% Cy_B [rad-1]

B.Cy_B = a.Cy_B+ b.Cy_B + v.Cy_B; %[rad-1]

%Obs: o calculo de Cy_B não é valido para twin tails

%Obs: b.Cy_B conta a influencia do corpo da aeronave [C_Y_B_BE]


end