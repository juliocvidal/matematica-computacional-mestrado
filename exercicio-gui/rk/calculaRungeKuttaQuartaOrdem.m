% Mestrado em Engenharia da Computacao e Sistemas - UEMA
% Disciplica de Matematica Computacional Aplicada
%
% Programa para executar um passo do método de Runge-Kutta de 4ª ordem 
% 
% Julio Cardoso Vidal de Figueiredo - 14/06/2017
% juliocvidal
function result = calculaRungeKuttaQuartaOrdem(x, y, h, n)

vetorY = zeros(n);

if (n <= 0)
    fprintf('Informe um valor para h maior que 0.\n');
    return
end

for i=1:n
    k1 = h * funcao(x,y);
    k2 = h * funcao(x + h/2, y + k1/2);
    k3 = h * funcao(x + h/2, y + k2/2);
    k4 = h * funcao(x + h, y + k3);
    
    y = y + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    x = x + h;
    
    vetorY(i) = y;
end

fprintf('O valor da funcao no ponto desejado eh %d.\n Veja no grafico a evolucao da solucao.\n', y);
plot(vetorY);

result = y;

