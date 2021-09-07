function [T] = Cheby(n)

syms xle;
T = [1,xle];
for a = 3 : n
    T(a) = 2*xle*T(a-1)-T(a-2);
end
T = T';