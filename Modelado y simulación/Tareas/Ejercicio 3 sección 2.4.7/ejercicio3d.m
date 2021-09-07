clear;close;clc;
tic
%% Ingreso de funciones y grado de polinomio
syms xle
h = sin(3*xle)*(1-xle^2);
% h = xle^4;
% h = xle*(1-xle^2)*sin(3*xle);
N = 7;

%% Procesamiento de datos
Mono = 1;
Lege = 1;
Cheb = 1;

if Lege ==1
    xm = 1:N;
    [Poli_legendre2] = Legendre(xm);
end
if Mono == 1
    y=1;
    for a=1:N-1
        y = [y,xle^a];
    end
end
if Cheb ==1
    [Poli_Chebychev] = Cheby(N);
end

%% Proyección en monomios
if Mono ==1
    for a=1:N
       ConstMono(a) = int(h*y(a),xle,-1,1)/int(y(a)*y(a),xle,-1,1);       
    end
end
%% Proyección en Legendre
if Lege == 1
    for a=1:N
        ConstLege(a) = int(h*Poli_legendre2(a),xle,-1,1)/int(Poli_legendre2(a)*Poli_legendre2(a),xle,-1,1);       
    end
end

%% Proyección en Chebyshev
if Cheb ==1
    for a=1:N
       ConstCheb(a) = int(h*Poli_Chebychev(a),xle,-1,1)/int(Poli_Chebychev(a)*Poli_Chebychev(a),xle,-1,1);       
    end
end

%% Gráficas

xle = -1:.01:1;
Original = eval(h);
plot(xle,Original,'DisplayName','Original')
% legend('Original')
hold

if Mono == 1
    PolMono = sum(ConstMono.*y);
    fMono = eval(PolMono);
end
if Lege == 1
    PolLege = sum(ConstLege.*Poli_legendre2);
    fLege = eval(PolLege);
end
if Cheb == 1
    PolCheb = sum(ConstCheb.*Poli_Chebychev');
    fCheb = eval(PolCheb);
end

if Mono ==1
    plot(xle,fMono,'DisplayName','Monomios')
end
if Lege == 1
    plot(xle,fLege,'DisplayName','Legendre')
end
if Cheb == 1
    plot(xle,fCheb,'DisplayName','Chebyshev')
end
legend;grid
toc
