% Mestrado em Engenharia da Computacao e Sistemas - UEMA
% Disciplica de Matematica Computacional Aplicada
%
% Programa para calcular o zero de uma funcao real pelo metodo de
% Newton-Raphson
%
% Julio Cardoso Vidal de Figueiredo - 25/04/2017
% juliocvidal

clear;

x = input('Informe os valores de a e b. Ex: [1,10]\n');
erro = input('Informe o erro máximo aceitável. Ex: 10^-7\n');

% Inicializando os valores de m e f(m) para garantir que não caiam nas
% condições de parada em um momento errado.
fm = erro + 1;
xn = 2;%x(2) + erro + 1;

%Calculo da funcao de x e das derivadas
y=funcao(x);
y1=funcaoDerivada(x);
y2=funcaoDerivadaSegunda(x);

% Testa as condicoes de convergencia
if (y(1) * y(2) >= 0 || y1(1)*y1(2) <= 0 || y2(1)*y2(2) <= 0)
    % Caso não sejam satisfeitas as condicoes, o programa informa o usuario
    % e encerra a execucao
    disp('Os parâmetros informados não atendem às condições de convergência para o método Raphson-Newton');
    disp('Por favor tente novamente com novos parâmetros');
    %exit(1);
else
    
    iteracoes = 0;
    %Valida as condições de parada
    while(fm >= erro && abs(abs(xn) - abs(x(2))) > erro)
        iteracoes = iteracoes + 1;
        
       x(2) = xn;
        %Somente o ponto b se move
       fm = funcao(xn);
        
        if (fm == 0) break; end
       
        %Xn = Xn-1 - f(Xn-1)/f'(Xn-1)
        xn = x(2) - y(2)/y1(2);
       
        % Calcula a funcao e a derivada para o novo intervalo
        y(2) = funcao(xn);
        y1(2) = funcaoDerivada(xn);
        
    end
    
    fprintf('Zero da funcao foi encontrado em: %f\nApós %d iterações.\n', xn, iteracoes);
    
end


