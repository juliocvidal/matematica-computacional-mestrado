% Mestrado em Engenharia da Computacao e Sistemas - UEMA
% Disciplica de Matematica Computacional Aplicada
%
% Programa para calcular o zero de uma funcao real pelo metodo da Bissecao
% 
% Julio Cardoso Vidal de Figueiredo - 25/04/2017
% juliocvidal
function result = calculaRaizPorMetodoBissecao(x, erro, funcao)

% x = input('Informe os valores de a e b. Ex: [1,10]\n');
% erro = input('Informe o erro máximo aceitável. Ex: 10^-7\n');

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

iteracoes = 0;

% Executa enquanto o intervalo ou o valor f(m) for maior que o erro
% Ou seja só para quando os dois cumprirem a condicao de ser menores que
% o erro
while(abs(x(1)-x(2)) > erro || fm >= erro)
    iteracoes = iteracoes + 1;
    
    % Calcula o novo ponto m na metade dos intervalo
    m(iteracoes) = (x(1) + x(2)) / 2;
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

% result = strcat('Zero da funcao foi encontrado em: ',  strM, '. Após: ' , strIteracoes , ' iterações.');
fprintf('Zero da funcao foi encontrado em: %f\nApós %d iterações.\n', m(iteracoes), iteracoes);
result = m;

