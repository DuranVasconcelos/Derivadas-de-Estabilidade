function [h]= fClB_HB (CL,h,c,b)
%Função que calcula as derivadas do angulo de derrapagem em relação a CL.
%
% DADOS DE SAIDA:
% Cl_WB     é o coeficiente da curva de sustentação no estado estavel
% b.lf      Distancia do nariz a ponta de asa seguindo a linha de c2
% h.Cl_B_b  Derivada do angulo de derrapagem do Est. Horizontal
% h.Cl_B    Derivada do angulo de derrapagem da Est. Horizontal com Fatores
% de correção


% A Eq. de ClBW é muito extensa, e depende de varios parametros que serao
% calculados um a um daqui em diante


%% CL_WB
%é o coeficiente da curva de sustentação no estado estavel

CL_WB = CL; %adm


q1 = CL_WB;

%%  Cl_B_CL_enf_c2
%contribuição do escoamento da asa 

%Simulando a Figura 7.11

x = h.enf_c2;
p1 = h.A;
t1 = h.lambda;



if t1 >= 0.75
    
    
    
if p1 <= 1.5
      y = -1*10^-08*x^3 + 1*10^-06*x^2 - 7*10^-05*x + 6*10^-05;
else
    
    if p1 > 1.5 && p1 <= 3
        
      y = -2*10^-08*x^3 + 8*10^-07*x^2 - 7*10^-05*x + 5*10^-05;
    else
        
        if p1 > 3 && p1 <= 5
      y = -2*10^-08*x^3 + 6*10^-07*x^2 - 8*10^-05*x - 7*10^-05;

        else         
           if p1 > 5 && p1 <= 7
           y = -3*10^-08*x^3 + 6*10^-07*x^2 - 9*10^-05*x - 0.0001;

           else  
            
              if p1 > 8
                y = -3*10^-08*x^3 + 5*10^-07*x^2 - 8*10^-05*x - 0.0001;
                
                
              end
           end
        end
    end
end



else
            
                    
if t1 >= 0.25 && q1 < 0.75
    
    
    
if p1 <= 1.5
     y = -1*10^-08*x^3 + 8*10^-07*x^2 - 7*10^-05*x - 1*10^-05;
else
    
    if p1 > 1.5 && p1 <= 3
      y = -2*10^-08*x^3 + 6*10^-07*x^2 - 7*10^-05*x + 2*10^-05;
    else
        
        if p1 > 3 && p1 <= 5
      y = -2*10^-08*x^3 + 4*10^-07*x^2 - 7*10^-05*x ;

        else         
           if p1 > 5 && p1 <= 7
           y = -3*10^-08*x^3 + 5*10^-07*x^2 - 8*10^-05*x - 0.0001;

           else  
            
              if p1 > 7
                y = -3*10^-08*x^3 + 5*10^-07*x^2 - 7*10^-05*x + 0.00002;
                
                
              end
           end
        end
    end
end                    
                    
                    
     


else                  
                    
                    
                    
                    
if t1 < 0.25
    
    
    
if p1 <= 1.5
     y = -8*10^-09*x^3 + 4*10^-07*x^2 - 7*10^-05*x + 2*10^-05;
else
    
    if p1 > 1.5 && p1 <= 3
      y = -2*10^-08*x^3 + 4*10^-07*x^2 - 6*10^-05*x + 2*10^-05;
    else
        
        if p1 > 3 && p1 <= 5
      y = -2*10^-08*x^3 + 5*10^-07*x^2 - 7*10^-05*x - 5*10^-05;

        else         
           if p1 > 5 && p1 <= 7
           y = -2*10^-08*x^3 + 3*10^-07*x^2 - 7*10^-05*x - 6*10^-05;

           else  
            
              if p1 > 8
                y = -2*10^-08*x^3 + 3*10^-07*x^2 - 7*10^-05*x - 6*10^-05 ;
                
                
              end
           end
        end
    end
end                    
                    
                    

end
end
end


Cl_B_CL_enf_c2 = y;

q2= Cl_B_CL_enf_c2;
%0

 




%%  K_M_enf
% fator de corrção da compressibilidade do escoamento

%Simulando figura 7.12

p= h.A/cos(h.enf_c2_rad);
x = c.M*cos(h.enf_c2_rad);                    
                    
                    
 if p <= 3
     y = -9*10^-13*x^4 - 0.0926*x^3 + 0.0764*x^2 + 0.036*x + 1.0001;

 else
     if p>3 && p <=4.5
         y = -1.1719*x^4 + 2.0544*x^3 - 0.9566*x^2 + 0.1745*x + 0.9998;

     else
         if p>4.5 && p<= 5.5
             y = -2.7344*x^4 + 5.3646*x^3 - 2.9219*x^2 + 0.4952*x + 0.9982;

         else
             if p>5.5 && p<=7
             y = -0.7812*x^4 + 1.5625*x^3 - 0.4687*x^2 + 0.0875*x + 1;

             else
                 if p>7 && p<= 9 
                 y = -1.0417*x^4 + 2.5*x^3 - 0.9583*x^2 + 0.2*x + 1;
    
                 else
                     if p>9
                      y = 1.8125*x^2 - 0.7125*x + 1.045;
   
                     end
                 end
             end
         end
     end
 end

K_M_enf= y;   
q3=K_M_enf;

%1.algumacoisa


 %%  K_f

%Fator de correção da fuselagem

%Simulando figura 7.13

x2 = (h.b/2)/cos(h.enf_c2_rad); %Comprimento da asa seguindo a linha de c2

b.lf = h.X_LE + (1/2)* h.c_barra + sin(h.enf_c2_rad)*x2; % Distancia do nariz a ponta de asa seguindo a linha de c2 


x = b.lf/h.b;
p = h.A/cos(h.enf_c2_rad);


                    
 if p <= 4
     y = -0.0382*x^4 + 0.0856*x^3 - 0.058*x^2 + 0.0117*x + 1.1948;

 else
     if p>4 && p <=4.75
         y = 0.0473*x^4 - 0.1915*x^3 + 0.1831*x^2 - 0.0475*x + 1.001;

     else
         if p>4.75 && p<= 5.25
y = 0.122*x^4 - 0.4273*x^3 + 0.3596*x^2 - 0.0833*x + 1.0015;

         else
             if p>5.25 && p<=5.75
y = 0.0874*x^4 - 0.2734*x^3 + 0.1243*x^2 - 0.0134*x + 1;

             else
                 if p>5.75 && p<= 6.5 
y = 0.061*x^4 - 0.1495*x^3 - 0.0491*x^2 + 0.0239*x + 0.9996;
    
                 else
                   if p>6.5 && p<= 7.5 
y = -0.1088*x^2 - 0.0526*x + 1.0074;
    
                   else
                     if p>7.5
y = -0.1161*x^2 - 0.0751*x + 1.002;
   
                     end
                 end
             end
         end
         end
   end
 end
 
 K_f=y;

q4=K_f;


%% Cl_B_CL_A [per deg]
%Contribuição do Aspect ratio da asa

%Simulando Figura 7.14

x = h.A;
p2 = h.lambda;

if p2 < 0.25
    y = 1*10^-06*x^4 - 1*10^-06*x^3 - 0.0003*x^2 + 0.0023*x - 0.0058;
else
    if p2>= 0.25 && p2<0.75
        y = 5*10^-06*x^4 - 7*10^-05*x^3 + 9*10^-05*x^2 + 0.0021*x - 0.008 ;
    else
        if p2>= 0.75
            y = 9*10^-06*x^4 - 0.0001*x^3 + 0.0003*x^2 + 0.0023*x - 0.011;
        end
    end
end

Cl_B_CL_A = y;


q5=Cl_B_CL_A;

%%  Cl_B_diedro [per deg^2]
%efeito do diedro na asa

%Simulando Figura 7.15

x = h.A;
p3 = h.enf_c2;
p4 = h.lambda;



if p4>0.75
    if p3<20
        y = 2*10^-07*x^4 - 3*10^-06*x^3 + 2*10^-05*x^2 - 8*10^-05*x + 8*10^-16;

    else
        if p3>=20 && p3<50
            y = 2*10^-07*x^4 - 3*10^-06*x^3 + 2*10^-05*x^2 - 8*10^-05*x + 7*10^-16;

        else
            if p3>50
                y = 1*10^-08*x^4 - 4*10^-07*x^3 + 6*10^-06*x^2 - 5*10^-05*x + 6*10^-16;

            end
        end
    end
else
        if p3<20
        y = 1*10^-07*x^4 - 2*10^-06*x^3 + 1*10^-05*x^2 - 7*10^-05*x + 8*10^-16 + 5*10^-5 ;

        else
        if p3>=20 && p3<50
            y = 3*10^-19*x^4 - 6*10^-07*x^3 + 1*10^-05*x^2 - 7*10^-05*x + 7*10^-16;

        else
            if p3>50
                y = 3*10^-06*x^2 - 4*10^-05*x - 2*10^-06;

            end
        end
        end
    
end

Cl_B_diedro = y;


q6=Cl_B_diedro;





%% K_M_diedro
%Fator de correção de compressibilidade para o diedro da asa

%Simulando a Figura 7.16


p= h.A/cos(h.enf_c2_rad);
x = c.M*cos(h.enf_c2_rad);

if p <= 3
     y = 0.3906*x^4 - 0.7002*x^3 + 0.3628*x^2 - 0.0036*x + 1.0002;

 else
     if p>3 && p <=5
         y = -0.651*x^4 + 1.4294*x^3 - 0.7274*x^2 + 0.1495*x + 0.99975;

     else
         if p>5 && p<= 7
             y = 0.9115*x^4 - 1.2789*x^3 + 0.8351*x^2 - 0.0672*x + 0.9998;
             
         else
             if p>7 && p<=9
             y = 0.3906*x^4 + 0.272*x^3 - 0.158*x^2 + 0.0974*x + 0.999;

             else
                 if p>9  
                 y = 2.6042*x^4 - 3.4259*x^3 + 1.7847*x^2 - 0.1646*x + 1.0008;
    

                     
                 end
             end
         end
     end
end

 K_M_diedro=y;
 
q7 = K_M_diedro;

%% DCl_B_diedro [deg^-2] depende de b.So,A,b
 d = sqrt(b.So/0.7854);
 
DCl_B_diedro = -0.0005*sqrt(h.A)*(d/h.b)^2;

q8= DCl_B_diedro;

%% DCl_B_zw [deg^-1] depende de A,zw,b,d

DCl_B_zw = -(1.2*sqrt(h.A)/57.3) * (h.zw/h.b) * (2*d/h.b);

q9 = DCl_B_zw;

%% DCl_B_tt_c4
%Fator de correção para wing twist

%Simulando Figura 7.17

DCl_B_tt_c4 = -0.000023;

%Obs: Não foi simulada a curva (Valores muito pequenos e proximos)

q10=DCl_B_tt_c4;

%% teta
% wing twist entre a raiz e ponta 
% Obs: Negativo para washouts


%Simulando Figura 7.17

teta = 0; %torção

%% Calculo de Cl_B_WB [contribuição da asa para Cl)

Cl_B_WB1 = 57.3*(q1*(q2*q3*q4)+q5);
Cl_B_WB2 = h.diedro*(q6*q7+q8);
Cl_B_WB3 = q9+ teta*tan(h.enf_c4_rad)*q10;
h.Cl_B_b = Cl_B_WB1+Cl_B_WB2+Cl_B_WB3;



%% Calculo de Cl_B_H [contribuição da Est. Horizontal para ClB)


h.Cl_B = h.Cl_B_b*(h.S*h.b/b.S);

end