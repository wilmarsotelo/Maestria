clear;close;clc;


masa = [1 ;2 ;1];

x = [1;-1; 1]; y = [1; -1; 1]; z = [-2 ;0 ;2];

Value = [x y z];
PROM = [mean(x) mean(y) mean(z)];

% a) tensor de inercia 

index = 3;
for b = 1 : index
    for a = 1 : index
        M(a,b) = sum(masa.*(Value(:,a) - PROM(a)).*(Value(:,b) - PROM(b)));
    end
end

% b) matriz diagonalizada y vectores propios

[Autovectores, Autovalores]=eig(M)





