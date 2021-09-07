function [Poli_legendre2] = Legendre(x)


%% Polinomios de Legendre
% xle es la variable x de legendre

N=length(x)-1;
syms xle
% 
% yle=1;
% for i=1:N
%     yle = [yle,xle^i];
% end
% 
% P0 = yle(1);
% P = P0;
% 
% c=0;
% for i=1:N
%     for j=1:i
%         integrate = (int(yle(i+1)*P(j),xle,-1,1)/int(P(j)*P(j),xle,-1,1))*P(j);
%         c = c + integrate;         
%     end
%     Pi = yle(i+1)- c;
%     P = [P,Pi];
%     c=0;
% end

% los polinomios de legendre serán

Poli_legendre2 = 1;
for n=1:N
    Polinomios = legendreP(n,xle);
    Poli_legendre2 = [Poli_legendre2,Polinomios];
end