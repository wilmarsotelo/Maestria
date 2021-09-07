
function [Poli_cheb] = chebyshev(x)

N=length(x)-1;
syms xle

Poli_cheb = 1;

    for n=1:N
        Polinomios = chebyshevT(n,xle);
        Poli_cheb = [Poli_cheb,Polinomios];
    end
    
end
