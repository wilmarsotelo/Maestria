clear all 
close all
clc

syms x
N=5;
a=-1;
b=1;

y=[1];
for i=1:N
    y = [y,x^i];
end

P0 = y(1);
P = [P0];

c=0;

for i=1:N
    for j=1:i
        integrate = (int(y(i+1)*P(j),x,a,b)/int(P(j)*P(j),x,a,b))*P(j);
        c = c+integrate;         
    end
    Pi = y(i+1)- c;
    P = [P,Pi];
    c=0;
end

P;
% los polinomios de legendre serán

Poli_legendre1 = P.';

% los polinomios de legendre serán

Poli_legendre2 = [1];

for n=1:N
    Polinomios = legendreP(n,x);
    Poli_legendre2 = [Poli_legendre2,Polinomios];
end

Poli_legendre2;









