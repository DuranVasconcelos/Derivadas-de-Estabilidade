function [h,c,a]=fCl_pH(h,c,a)
%Funçao que calcula a derivada da taxa de rolagem em relação a Cl p/ Est.
%Horizontal
%
%DADOS DE SAIDA:
%h.Cl_P    Derivada da taxa de rolagem em relação a Cl p/ Est. Horizontal




%BCLP/k
%parâmetro de amortecimento de rolagem

%Simulando Figura 8.1

k_h  = h.cl_alpha/(2*pi);

r= h.lambda;
x= atan(tan(h.enf_c4)/c.B);
p = c.B*h.A/k_h;

if r>= 0.5
    
    
if x<=0 

if p <= 2
y=-0.15;
else
if p>2 && p<=4
y=-0.3;
else
if p>4 && p<= 8
y= -0.45;
else
if p>8
y= -0.55;
end
end
end
end
        
        
else


if x>0 && x<45
            
if p <= 2
y=-0.15;
else
if p>2 && p<=4
y=-0.3;
else
if p>4 && p<= 8
y= -0.35;
else
if p>8
y= -0.4;
end
end
end
end

else
    
if x>45
                
if p <= 2
y=-0.15;
else
if p>2 && p<=4
y=-0.2;
else
if p>4 && p<= 8
y= -0.3;
else
if p>8
y= -0.3;
end
end
end
end

end
end
end



else
 
    
    
if x<=0 

if p <= 2
y=-0.15;
else
if p>2 && p<=4
y=-0.25;
else
if p>4 && p<= 8
y= -0.38;
else
if p>8
y= -0.45;
end
end
end
end


else


if x>0 && x<45

if p <= 2
y=-0.15;
else
if p>2 && p<=4
y=-0.3;
else
if p>4 && p<= 8
y= -0.3;
else
if p>8
y= -0.35;
end
end
end
end

else

if x>45

if p <= 2
y=-0.15;
else
if p>2 && p<=4
y=-0.2;
else
if p>4 && p<= 8
y= -0.25;
else
if p>8
y= -0.25;
end
end
end
end

end
end
end
end

p1 = y;     

Cl_p_h = p1 *k_h/c.B;

%% Calculando h.Cl_p_real

h.Cl_p = 0.5*Cl_p_h* (h.S/a.S)*(h.b/a.b);
