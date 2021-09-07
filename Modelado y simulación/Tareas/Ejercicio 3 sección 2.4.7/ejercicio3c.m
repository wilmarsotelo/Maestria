clear all 
close all
clc

syms x
N=5;

y=[1];
for i=1:N
    y = [y,x^i];
end

P0 = y(1);
P = [P0];
F = sqrt(1-x^2);
c=0;

for i=1:N
    for j=1:i
        integrate = (int(y(i+1)*P(j)*F,x,-1,1)/int(P(j)*P(j)*F,x,-1,1))*P(j);
        c = c+integrate;         
    end
    Pi = y(i+1)- c;
    P = [P,Pi];
    c=0;
end

P;
% los polinomios de legendre serán

Poli_Chebychev = P.'



