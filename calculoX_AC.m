function [a,h,v,b,c,alpha] = calculoX_AC (a,h,v,b,c,alpha)
% Função que calcula X_ac/Cr sem os fatores de correção.
%
%
% Dados de saida:
% X_ac_p     X_ac/Cr sem os fatores de correção.

%DETERMINANDO X_ac/CR

%SIMULAÇÃO DA Fig. 3.9

%% ASA___________________________________________________________//////

p1 = abs(a.A*tan(a.enf_LE_rad));
x = c.B/tan(a.enf_LE_rad);
t = a.lambda;



if x<1

if t == 0 

    
        if p1 == 0
           y = 0.2*x^2 + 0.9*x; 
        else
            if p1 >0 && p1<1.5
                y= 0.2;
                        else
            if p1 >=1.5 && p1<2.5
                y= 0.34;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.475;
                        else
            if p1 >=3.5 && p1<4.5
                y =  - 0.1*x + 0.65;
                else
            if p1 >=4.5 && p1<5.5
                y = 0.2*x^2 - 0.34*x + 0.82;

                else
            if p1 >=5.5 && p1<6.5
                y = 0.28*x^2 - 0.5*x + 1;
                

                    
                    
            end
            end
            end
            end
            end
            end
        end
else
    
    
    if t >0 &&  t <=0.4
        

        if p1 == 0
           y = x; 
        else
            if p1 >0 && p1<1.5
                y = 2*10^(-15)*x^2 + 0.08*x + 0.22;

                        else
            if p1 >=1.5 && p1<2.5
                y= 0.34;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.475;
                        else
            if p1 >=3.5 && p1<4.5
                y = 0.12*x^2 - 0.22*x + 0.88;

                else
            if p1 >=4.5 && p1<5.5
                y = 0.18*x^2 - 0.35*x + 1.08;


                else
            if p1 >=5.5 && p1<6.5
                y = 0.26*x^2 - 0.43*x + 1.25;

            end
            end
            end
            end
            end
            end
        end
    
    else
        
         if t >0.4 &&  t <=0.75
        
        if p1 == 0
           y = 0.6*x^2 + 0.7*x;

        else
            if p1 >0 && p1<1.5
                y = -0.06*x^2 + 0.11*x + 0.26;

                        else
            if p1 >=1.5 && p1<2.5
                y= 0.34;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.475;
                        else
            if p1 >=3.5 && p1<4.5
               y = 0.2*x^2 - 0.3*x + 1;


                else
            if p1 >=4.5 && p1<5.5
                y = 0.22*x^2 - 0.37*x + 1.38;




                else
            if p1 >=5.5 && p1<6.5
                y = 0.26*x^2 - 0.43*x + 1.25;
        
                 end
            end
            end
            end
            end
            end
        end
        
         else
                    
             
                if t >0.75

        if p1 == 0
            y = -0.2*x^2 + 1.1*x; 


        else
            if p1 >0 && p1<1.5
                y = -0.1*x^2 + 0.23*x + 0.32;


                        else
            if p1 >=1.5 && p1<2.5
                y= 0.7;
                        else
            if p1 >=2.5 && p1<3.5
                y= 1;
                        else
            if p1 >=3.5 && p1<4.5
               y = 1.25;


                else
            if p1 >=4.5 && p1<5.5
                y = 1.5;




                else
            if p1 >=5.5 && p1<6.5
                y = 1.7;
        
                 end
            end
            end
            end
            end
            end
        end
               
    
    
    
    
         end
    end
end
end

a.X_ac_p = y;


else

x = tan(a.enf_LE_rad)/c.B;    
   


if t == 0 

    
        if p1 >0 && p1<=0.5
                y = 9*10^-16*x^2 - 0.06*x + 0.17; 
        else
            if p1 >0.5 && p1<=1.5
                y = -0.02*x^2 - 0.01*x + 0.25 ;
                        else
            if p1 >=1.5 && p1<2.5
                y= 0.33;
                        else
            if p1 >=2.5 && p1<3.5
                y = -0.02*x^2 + 0.07*x + 0.41;
                        else
            if p1 >=3.5 && p1<4.5
                y = -0.06*x^2 + 0.13*x + 0.5;
                else
            if p1 >=4.5 && p1<5.5
                y = -0.06*x^2 + 0.15*x + 0.59;

                else
            if p1 >=5.5 && p1<6.5
                y = 4*10^-15*x^2 + 0.1*x + 0.68;
                

                    
                    
            end
            end
            end
            end
            end
            end
        end
else
    
    
    if t >0 &&  t <=0.4
        

            if p1 >0 && p1<=0.5
             y = -0.04*x^2 - 0.04*x + 0.18;   
                
            else

            if p1 >0.5 && p1<=1.5
                y = 2*10^-15*x^2 - 0.02*x + 0.3;

                        else
            if p1 >=1.5 && p1<2.5
                y= 0.41;
                        else
            if p1 >=2.5 && p1<3.5
                y = -4*10^-15*x^2 + 0.04*x + 0.55;
                        else
            if p1 >=3.5 && p1<4.5
                y = 7*10^-15*x^2 + 0.04*x + 0.68;

                else
            if p1 >=4.5 && p1<5.5
                y = -0.02*x^2 + 0.07*x + 0.8;


                else
            if p1 >=5.5 && p1<6.5
                y = 0.02*x^2 + 0.05*x + 0.92;

            end
            end
            end
            end
            end
            end
        end
    
    else
        
         if t >0.4 &&  t <=0.75
        
                if p1 >0 && p1<=0.5
                y = -0.02*x^2 - 0.05*x + 0.25; 
        else
            if p1 >0 && p1<=1.5
                y = 2*10^-15*x^2 - 0.04*x + 0.35 ;
                        else
            if p1 >=1.5 && p1<2.5
                y= 0.52;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.7;
                        else
            if p1 >=3.5 && p1<4.5
                y =  0.9;
                else
            if p1 >=4.5 && p1<5.5
                y = 0.04*x + 1.02;

                else
            if p1 >=5.5 && p1<6.5
                y = 1.2;
                

                    
                    
            end
            end
            end
            end
            end
            end
            end
        
         else
                    
             
                if t >0.75

 
        
                if p1 >0 && p1<=0.5
                y = 0.02*x^2 - 0.05*x + 0.22; 
                else
            if p1 >0 && p1<=1.5
                y = -0.02*x^2 - 0.03*x + 0.5 ;
                else
            if p1 >=1.5 && p1<2.5
                y= 0.78;
                else
            if p1 >=2.5 && p1<3.5
                y= 1;
                else
            if p1 >=3.5 && p1<4.5
                y =  1.22;
                else
            if p1 >=4.5 && p1<5.5
                y = 1.5;

                else
            if p1 >=5.5 && p1<6.5
                y = 1.78;
                

                    
                    
            end
            end
            end
            end
            end
            end
        end               
    
    
    
    
         end
    end
end
end

a.X_ac_p = y;



end




































%% EST.HORI____________________________________________________//////

p1 = abs(h.A*tan(h.enf_LE_rad));
x = c.B/tan(h.enf_LE_rad);
t = h.lambda;




if x<1 
    
    
if t == 0 

    
        if p1 == 0
           y = 0.2*x^2 + 0.9*x; 
        else
            if p1 >0 && p1<1.5
                y= 0.2;
                        else
            if p1 >=1.5 && p1<2.5
                y= 0.34;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.475;
                        else
            if p1 >=3.5 && p1<4.5
                y =  - 0.1*x + 0.65;
                else
            if p1 >=4.5 && p1<5.5
                y = 0.2*x^2 - 0.34*x + 0.82;

                else
            if p1 >=5.5 && p1<6.5
                y = 0.28*x^2 - 0.5*x + 1;
                

                    
                    
            end
            end
            end
            end
            end
            end
        end
else
    
    
    if t >0 &&  t <=0.4
        

        if p1 == 0
           y = x; 
        else
            if p1 >0 && p1<1.5
                y = 2*10^(-15)*x^2 + 0.08*x + 0.22;

                        else
            if p1 >=1.5 && p1<2.5
                y= 0.34;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.475;
                        else
            if p1 >=3.5 && p1<4.5
                y = 0.12*x^2 - 0.22*x + 0.88;

                else
            if p1 >=4.5 && p1<5.5
                y = 0.18*x^2 - 0.35*x + 1.08;


                else
            if p1 >=5.5 && p1<6.5
                y = 0.26*x^2 - 0.43*x + 1.25;

            end
            end
            end
            end
            end
            end
        end
    
    else
        
         if t >0.4 &&  t <=0.75
        
        if p1 == 0
           y = 0.6*x^2 + 0.7*x;

        else
            if p1 >0 && p1<1.5
                y = -0.06*x^2 + 0.11*x + 0.26;

                        else
            if p1 >=1.5 && p1<2.5
                y= 0.34;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.475;
                        else
            if p1 >=3.5 && p1<4.5
               y = 0.2*x^2 - 0.3*x + 1;


                else
            if p1 >=4.5 && p1<5.5
                y = 0.22*x^2 - 0.37*x + 1.38;




                else
            if p1 >=5.5 && p1<6.5
                y = 0.26*x^2 - 0.43*x + 1.25;
        
                 end
            end
            end
            end
            end
            end
        end
        
         else
                    
             
                if t >0.75

        if p1 == 0
            y = -0.2*x^2 + 1.1*x; 


        else
            if p1 >0 && p1<1.5
                y = -0.1*x^2 + 0.23*x + 0.32;


                        else
            if p1 >=1.5 && p1<2.5
                y= 0.7;
                        else
            if p1 >=2.5 && p1<3.5
                y= 1;
                        else
            if p1 >=3.5 && p1<4.5
               y = 1.25;


                else
            if p1 >=4.5 && p1<5.5
                y = 1.5;




                else
            if p1 >=5.5 && p1<6.5
                y = 1.7;
        
                 end
            end
            end
            end
            end
            end
        end
               
    
    
    
    
         end
    end
end
end


h.X_ac_p = y;








else        % Caso x>1 usar parte direita do grafico

x = tan(h.enf_LE_rad)/c.B;    
   


if t == 0 

    
        if p1 >0 && p1<=0.5
                y = 9*10^-16*x^2 - 0.06*x + 0.17; 
        else
            if p1 >0.5 && p1<=1.5
                y = -0.02*x^2 - 0.01*x + 0.25 ;
                        else
            if p1 >=1.5 && p1<2.5
                y= 0.33;
                        else
            if p1 >=2.5 && p1<3.5
                y = -0.02*x^2 + 0.07*x + 0.41;
                        else
            if p1 >=3.5 && p1<4.5
                y = -0.06*x^2 + 0.13*x + 0.5;
                else
            if p1 >=4.5 && p1<5.5
                y = -0.06*x^2 + 0.15*x + 0.59;

                else
            if p1 >=5.5 && p1<6.5
                y = 4*10^-15*x^2 + 0.1*x + 0.68;
                

                    
                    
            end
            end
            end
            end
            end
            end
        end
else
    
    
    if t >0 &&  t <=0.4
        

            if p1 >0 && p1<=0.5
             y = -0.04*x^2 - 0.04*x + 0.18;   
                
            else

            if p1 >0.5 && p1<=1.5
                y = 2*10^-15*x^2 - 0.02*x + 0.3;

                        else
            if p1 >=1.5 && p1<2.5
                y= 0.41;
                        else
            if p1 >=2.5 && p1<3.5
                y = -4*10^-15*x^2 + 0.04*x + 0.55;
                        else
            if p1 >=3.5 && p1<4.5
                y = 7*10^-15*x^2 + 0.04*x + 0.68;

                else
            if p1 >=4.5 && p1<5.5
                y = -0.02*x^2 + 0.07*x + 0.8;


                else
            if p1 >=5.5 && p1<6.5
                y = 0.02*x^2 + 0.05*x + 0.92;

            end
            end
            end
            end
            end
            end
        end
    
    else
        
         if t >0.4 &&  t <=0.75
        
                if p1 >0 && p1<=0.5
                y = -0.02*x^2 - 0.05*x + 0.19; 
                else
                            if p1 >0.5 && p1<=1
                y = 0.28; 
                            else
            
            if p1 >1 && p1<=1.5
                y = 2*10^-15*x^2 - 0.04*x + 0.35 ;
                        else
            if p1 >=1.5 && p1<2.5
                y= 0.52;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.7;
                        else
            if p1 >=3.5 && p1<4.5
                y =  0.9;
                else
            if p1 >=4.5 && p1<5.5
                y = 0.04*x + 1.02;

                else
            if p1 >=5.5 && p1<6.5
                y = 1.2;
                

                    
                    
            end
            end
            end
            end
            end
            end
            end
                end
                
         else
                    
             
                if t >0.75

 
        
                if p1 >0 && p1<=0.5
                y = 0.02*x^2 - 0.05*x + 0.22; 
                else
            if p1 >0 && p1<=1.5
                y = -0.02*x^2 - 0.03*x + 0.5 ;
                else
            if p1 >=1.5 && p1<2.5
                y= 0.78;
                else
            if p1 >=2.5 && p1<3.5
                y= 1;
                else
            if p1 >=3.5 && p1<4.5
                y =  1.22;
                else
            if p1 >=4.5 && p1<5.5
                y = 1.5;

                else
            if p1 >=5.5 && p1<6.5
                y = 1.78;
                

                    
                    
            end
            end
            end
            end
            end
            end
        end               
    
    
    
    
         end
    end
end
end

h.X_ac_p = y;



end




















%% EST.VERTICAL____________________________________________________//////




p1 = abs(v.A*tan(v.enf_LE_rad));
x = c.B/tan(v.enf_LE_rad);
t = v.lambda;




if x<1
    
if t == 0 

    
        if p1 == 0
           y = 0.2*x^2 + 0.9*x; 
        else
            if p1 >0 && p1<1.5
                y= 0.2;
                        else
            if p1 >=1.5 && p1<2.5
                y= 0.34;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.475;
                        else
            if p1 >=3.5 && p1<4.5
                y =  - 0.1*x + 0.65;
                else
            if p1 >=4.5 && p1<5.5
                y = 0.2*x^2 - 0.34*x + 0.82;

                else
            if p1 >=5.5 && p1<6.5
                y = 0.28*x^2 - 0.5*x + 1;
                

                    
                    
            end
            end
            end
            end
            end
            end
        end
else
    
    
    if t >0 &&  t <=0.4
        

        if p1 == 0
           y = x; 
        else
            if p1 >0 && p1<1.5
                y = 2*10^(-15)*x^2 + 0.08*x + 0.22;

                        else
            if p1 >=1.5 && p1<2.5
                y= 0.34;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.475;
                        else
            if p1 >=3.5 && p1<4.5
                y = 0.12*x^2 - 0.22*x + 0.88;

                else
            if p1 >=4.5 && p1<5.5
                y = 0.18*x^2 - 0.35*x + 1.08;


                else
            if p1 >=5.5 && p1<6.5
                y = 0.26*x^2 - 0.43*x + 1.25;

            end
            end
            end
            end
            end
            end
        end
    
    else
        
         if t >0.4 &&  t <=0.75
        
        if p1 == 0
           y = 0.6*x^2 + 0.7*x;

        else
            if p1 >0 && p1<1.5
                y = -0.06*x^2 + 0.11*x + 0.26;

                        else
            if p1 >=1.5 && p1<2.5
                y= 0.34;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.475;
                        else
            if p1 >=3.5 && p1<4.5
               y = 0.2*x^2 - 0.3*x + 1;


                else
            if p1 >=4.5 && p1<5.5
                y = 0.22*x^2 - 0.37*x + 1.38;




                else
            if p1 >=5.5 && p1<6.5
                y = 0.26*x^2 - 0.43*x + 1.25;
        
                 end
            end
            end
            end
            end
            end
        end
        
         else
                    
             
                if t >0.75

        if p1 == 0
            y = -0.2*x^2 + 1.1*x; 


        else
            if p1 >0 && p1<1.5
                y = -0.1*x^2 + 0.23*x + 0.32;


                        else
            if p1 >=1.5 && p1<2.5
                y= 0.7;
                        else
            if p1 >=2.5 && p1<3.5
                y= 1;
                        else
            if p1 >=3.5 && p1<4.5
               y = 1.25;


                else
            if p1 >=4.5 && p1<5.5
                y = 1.5;




                else
            if p1 >=5.5 && p1<6.5
                y = 1.7;
        
                 end
            end
            end
            end
            end
            end
        end
               
    
    
    
    
         end
    end
end
end


v.X_ac_p = y;








else        % Caso x>1 usar parte direita do grafico

x = tan(h.enf_LE_rad)/c.B;    
   


if t == 0 

    
        if p1 >0 && p1<=0.5
                y = 9*10^-16*x^2 - 0.06*x + 0.17; 
        else
            if p1 >0.5 && p1<=1.5
                y = -0.02*x^2 - 0.01*x + 0.25 ;
                        else
            if p1 >=1.5 && p1<2.5
                y= 0.33;
                        else
            if p1 >=2.5 && p1<3.5
                y = -0.02*x^2 + 0.07*x + 0.41;
                        else
            if p1 >=3.5 && p1<4.5
                y = -0.06*x^2 + 0.13*x + 0.5;
                else
            if p1 >=4.5 && p1<5.5
                y = -0.06*x^2 + 0.15*x + 0.59;

                else
            if p1 >=5.5 && p1<6.5
                y = 4*10^-15*x^2 + 0.1*x + 0.68;
                

                    
                    
            end
            end
            end
            end
            end
            end
        end
else
    
    
    if t >0 &&  t <=0.4
        

            if p1 >0 && p1<=0.5
             y = -0.04*x^2 - 0.04*x + 0.18;   
                
            else

            
            if p1 >0.5 && p1<=1.5
                y = 2*10^-15*x^2 - 0.02*x + 0.3;

                        else
            if p1 >=1.5 && p1<2.5
                y= 0.41;
                        else
            if p1 >=2.5 && p1<3.5
                y = -4*10^-15*x^2 + 0.04*x + 0.55;
                        else
            if p1 >=3.5 && p1<4.5
                y = 7*10^-15*x^2 + 0.04*x + 0.68;

                else
            if p1 >=4.5 && p1<5.5
                y = -0.02*x^2 + 0.07*x + 0.8;


                else
            if p1 >=5.5 && p1<6.5
                y = 0.02*x^2 + 0.05*x + 0.92;

            end
            end
            end
            end
            end
            end
                            
            end
            
    
    else
        
         if t >0.4 &&  t <=0.75
        
                if p1 >0 && p1<=0.5
                y = -0.02*x^2 - 0.05*x + 0.19; 
                else
                                        if p1 >0.5 && p1<=1
                y = 0.28; 
                                        else
                                
            if p1 >1 && p1<=1.5
                y = 2*10^-15*x^2 - 0.04*x + 0.35 ;
                        else
            if p1 >=1.5 && p1<2.5
                y= 0.52;
                        else
            if p1 >=2.5 && p1<3.5
                y= 0.7;
                        else
            if p1 >=3.5 && p1<4.5
                y =  0.9;
                else
            if p1 >=4.5 && p1<5.5
                y = 0.04*x + 1.02;

                else
            if p1 >=5.5 && p1<6.5
                y = 1.2;
                

                    
                    
            end
            end
            end
            end
            end
            end
            end
                end
         else
                    
             
                if t >0.75

 
        
                if p1 >0 && p1<=0.5
                y = 0.02*x^2 - 0.05*x + 0.22; 
                else
            if p1 >0 && p1<=1.5
                y = -0.02*x^2 - 0.03*x + 0.5 ;
                else
            if p1 >=1.5 && p1<2.5
                y= 0.78;
                else
            if p1 >=2.5 && p1<3.5
                y= 1;
                else
            if p1 >=3.5 && p1<4.5
                y =  1.22;
                else
            if p1 >=4.5 && p1<5.5
                y = 1.5;

                else
            if p1 >=5.5 && p1<6.5
                y = 1.78;
                

                    
                    
            end
            end
            end
            end
            end
            end
        end               
    
    
    
    
         end
    end
end
end

v.X_ac_p = y;



end























end
        
        

                
