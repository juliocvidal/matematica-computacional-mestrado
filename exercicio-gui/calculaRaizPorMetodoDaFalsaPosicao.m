% Mestrado em Engenharia da Computacao e Sistemas - UEMA
% Disciplica de Matematica Computacional Aplicada
%
% Programa para calcular o zero de uma funcao real pelo metodo da Falsa
% Posição
% 
% Julio Cardoso Vidal de Figueiredo - 25/04/2017
% juliocvidal

function result = calculaRaizPorMetodoDaFalsaPosicao(x, erro, funcao)

% Inicializando os valores de m e f(m) para garantir que não caiam nas
% condições de parada em um momento errado.
fm = erro + 1;
m=0;

y=funcao(x);

% Testa logo de cara se as entradas propostas compreendem um zero entre si
if (sign(y(1)) == sign(y(2)))
    % Caso não compreendam o zero, o programa pede que o usuario informe
    % novos valores até que acerte
   result = 0;
   return
end

% Executa enquanto o intervalo ou o valor f(m) for maior que o erro
% Ou seja só para quando os dois cumprirem a condicao de ser menores que
% o erro

iteracoes = 0;
while(abs(x(1)-x(2)) > erro || fm >= erro)
    iteracoes = iteracoes + 1;
    
    % Calcula o novo ponto m segundo a formula:
    % Xn = (a*f(b) - b*f(a))/f(b) - f(a)
    m(iteracoes) = (x(1)*y(2) - x(2)*y(1)) / y(2) - y(1);    
    fm=funcao(m(iteracoes));
    
    if (fm == 0) break; end
    
    % Determina se deve substituir b ou a por m
    if (sign(fm) == sign(y(1)))
        x = [m(iteracoes), x(2)];
    else
        x = [x(1), m(iteracoes)];
    end
    
    % Calcula a funcao para o novo intervalo
    y =funcao(x);
    
end

fprintf('Zero da funcao foi encontrado em: %f\nApós %d iterações.\n', m(iteracoes), iteracoes);
result = m;

