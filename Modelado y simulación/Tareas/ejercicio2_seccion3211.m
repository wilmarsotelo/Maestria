clear;close;clc;

%% tensores de entrada
R_sup_i_inf_j = [0.5   1   1.5;
                  2   2.5   3;
                 3.5   4   4.5]
             
T_sup_i = [1/3; 2/3; 1]

g_sup_ij = [1  0  0;
            0 -1  0;
            0  0  1]

%% a) parte simetrica y antisimetrica de R

R_ij = g_sup_ij*R_sup_i_inf_j;   %para dejar indices de R como subindices 

S_ij = (1/2)*(R_ij+R_ij');  %quedan con subindices

A_ij = (1/2)*(R_ij-R_ij');

S_sup_i_inf_j = g_sup_ij*S_ij % con la metrica "g" se recupera superindice y subindice
A_sup_i_inf_j = g_sup_ij*A_ij

disp('------------------------------------------------')
%% b) calculo de los 3 productos --> R_kj,  R^ki,  T_j

T_j = g_sup_ij*T_sup_i

R_inf_kj = g_sup_ij*R_sup_i_inf_j

R_sup_ki = g_sup_ij*R_sup_i_inf_j



disp('------------------------------------------------')
%% c) calculo de los 3 productos C1 --> R^i_j*T_i, 
% C2 --> R^i_j*T^j, C3 --> R^i_j*T_i*T^j

T_i = g_sup_ij*T_sup_i
% T_i = T_j.';
T_sup_j = g_sup_ij*T_i
% T_sup_j =  T_sup_i.';

C1 =  T_i.'*R_sup_i_inf_j
C2 =  R_sup_i_inf_j*T_sup_j
C3 =  C1*T_sup_j

disp('------------------------------------------------')
%% d) calculo de los productos d1 --> R^i_j*S_sup_j_inf_i, d2 --> R^i_j*A_sup_j_inf_i
% d3) --> A_sup_j_inf_i*T^i, d4) --> A_sup_j_inf_i*T^i*T_j

d1 =  R_sup_i_inf_j*g_sup_ij*S_sup_i_inf_j*g_sup_ij;
valor_d1 = sum(diag(d1))
% d2 =  R_sup_i_inf_j*g_sup_ij*A_sup_i_inf_j*g_sup_ij;
d2 =  R_sup_i_inf_j*A_sup_i_inf_j.';
valor_d2 = sum(diag(d2))
d3 =  A_sup_i_inf_j.'*T_sup_i
d4 =  T_j.'*A_sup_i_inf_j.'*T_sup_i

disp('------------------------------------------------')
%% e) e1 --> R^i_j-2*delta_sup_j_inf_i*Rll 


I = [1 0 0; 0 1 0; 0 0 1];
e1 = R_sup_i_inf_j-2*I*g_sup_ij*R_sup_i_inf_j*g_sup_ij
% e1 = R_sup_i_inf_j-2*I*sum(diag(R_sup_i_inf_j))
e2 = e1*T_i
e3 = T_j.'*e1*T_sup_i

        
        
        
        
        
        
        
        
        
        
        
        
        
        
  