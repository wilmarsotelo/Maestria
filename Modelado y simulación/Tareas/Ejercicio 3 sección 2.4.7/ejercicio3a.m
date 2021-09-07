clear all 
close all
clc

syms x
N=10;

y=[1];
for i=1:N
    y = [y,x^i];
end

%para comprobar que esta base no es ortogonal basta con hacer la prueba con
%varios vectores

%por ejemplo el vector P0=1 y P2=x^2, el resultado es 2/3

P0_P2 = int(y(1)*y(3),x,-1,1);

%por ejemplo el vector P0=1 y P4=x^4, el resultado es 2/5

P0_P4 = int(y(1)*y(5),x,-1,1);

%por ejemplo el vector P1=x y P7=x^7, el resultado es 2/9

P1_P7 = int(y(2)*y(8),x,-1,1);

%%% Por lo tanto, esta base no es ortogonal





