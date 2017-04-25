% Mestrado em Engenharia da Computacao e Sistemas - UEMA
% Disciplica de Matematica Computacional Aplicada
% Programa para calcular o zero de uma funcao real pelo metodo da Bissecao
% 
% Julio Cardoso Vidal de Figueiredo - 25/04/2017
% juliocvidal

x = input('Informe os valores de a e b. Ex: [1,10]\n');
erro = input('Informe o erro máximo aceitável. Ex: 10^-7\n');

% Inicializando os valores de m e f(m) para garantir que não caiam nas
% condições de parada em um momento errado.
fm = erro + 1;
m=0;

y=funcao(x);

% Testa logo de cara se as entradas propostas compreendem um zero entre si
while (sign(y(1)) == sign(y(2)))
    % Caso não compreendam o zero, o programa pede que o usuario informe
    % novos valores até que acerte
    x = input('Você informou dois pontos de mesmo sinal.\n Por favor tente novos pontos\n');
    y=funcao(x);
end

% Executa enquanto o intervalo ou o valor f(m) for maior que o erro
% Ou seja só para quando os dois cumprirem a condicao de ser menores que
% o erro
while(abs(x(1)-x(2)) > erro || fm >= erro)
    
    % Calcula o novo ponto m na metade dos intervalo
    m = (x(1) + x(2)) / 2;
    fm=funcao(m);
    
    % Determina se deve substituir b ou a por m
    if (sign(fm) == sign(y(1)))
        x = [m, x(2)];
    else
        x = [x(1), m];
    end
    
    % Calcula a funcao para o novo intervalo
    y =funcao(x);
    
end

fprintf('Zero da funcao foi encontrado em: %f\n', m);

