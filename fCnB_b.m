function [c,b,a,fig719] = fCnB_b(c,b,a)

%KN

%fator empirico do efeito ASA+ CORPO


%Por ser uma figura complexa, recomenda-se a analise individual, por
%padrão,K_N está definido como -.0012


%Simulando Figura 7.19

fig719.x1 = c.X_cg/b.Lf;
fig719.p1 = b.Lf^2/b.Ss;

fig719.p2 = sqrt(b.h1f/b.h2f);

fig719.p3 = b.h/b.maxW;

K_N = -0.0012;








%KRl

%Fator do numero de Reynold's para a fuselagem


K_Rl =(1.2/2.5)*c.Rl;










b.Cn_B = -57.3 *K_N * K_Rl * (b.Ss/b.S)*(b.Lf/a.b);

