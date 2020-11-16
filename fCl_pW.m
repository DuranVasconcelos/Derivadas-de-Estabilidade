function [a,c]=fCl_pW(a,c)
%Funçao que calcula a derivada da taxa de rolagem em relação a Cl p/ ASA
%
%DADOS DE SAIDA:
%a.Cl_P    Derivada da taxa de rolagem em relação a Cl p/ ASA






%BCLP/k
%parâmetro de amortecimento de rolagem

%Simulando Figura 8.1

k_a  = a.cl_alpha/(2*pi);

r= a.lambda;
x= atan(tan(a.enf_c4)/c.B);
p = c.B*a.A/k_a;

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

a.Cl_p = p1 *k_a/c.B;
