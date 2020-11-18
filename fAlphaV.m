function [a,h,v,b,c,alpha] = fAlphaV(a,h,v,b,c,alpha)
% Função que calcula CLalpha para Est Vertical.
%
%
% Dados de saida:
% CL_alfa     Variação do coeficiente de sustentaçao em relação ao angulo de ataque para cada perfil

%% v.CLalphaeff        


%Simulando FIgura 3.3
    
vx = v.Aeff;  %[adm]
vp = v.lambda;%[adm]
vq = v.enf_c4;%[deg]

if vp<0.20

if vq<15
vh = -0.0012*vx^2 + 0.0199*vx;

else
    
if vq>=15 && vq<35
vh = -0.0012*vx^2 + 0.0195*vx;

else
    
if vq>=35 && vq<45
vh = -0.0012*vx^2 + 0.0187*vx;

else
    
if vq>=45 && vq<55
vh = -0.0011*vx^2 + 0.017*vx;

else
    
if vq>=55
vh = -0.001*vx^2 + 0.0147*vx;

end
end
end
end
end




else
    
    
    
if vp>=0.2 && vp<0.4
    
if vq<15
vh = -0.0011*vx^2 + 0.0197*vx;

else
if vq>=15 && vq<35
vh = -0.0013*vx^2 + 0.0201*vx;

else
if vq>=35 && vq<45
vh = -0.0012*vx^2 + 0.0191*vx;

else
if vq>=45 && vq<55
vh = -0.0011*vx^2 + 0.017*vx;

else
if vq>=55
vh = -0.001*vx^2 + 0.0145*vx;

end
end
end
end
end
end



if vp>= 0.4 && vp <0.75
    
if vq<15
%vh = -0.0008*vx^2 + 0.0157*vx + 0.0146 ;
vh = -0.0008*vx^2 + 0.015*vx + 0.014 ;

else
if vq>=15 && vq<35
vh = -0.0012*vx^2 + 0.0194*vx;

else
if vq>=35 && vq<45
vh = -0.0012*vx^2 + 0.0181*vx;

else
if vq>=45 && vq<55
vh = -0.0011*vx^2 + 0.016*vx;

else
if vq>=55
vh = -0.001*vx^2 + 0.0138*vx;

end
end
end
end
end    
end



if vp>=0.75
if vq<15
vh = -0.0012*vx^2 + 0.0198*vx;

else
if vq>=15 && vq<35
vh = -0.0012*vx^2 + 0.0185*vx;

else
if vq>=35 && vq<45
vh = -0.0012*vx^2 + 0.0174*vx;
else
if vq>=45 && vq<55
vh = -0.001*vx^2 + 0.015*vx;


else
if vq>=55
vh = -0.0009*vx^2 + 0.0128*vx;




end
end
end
end
end



end
end

v.CL_alfa = vh*57.2958; %conversao rad to deg
