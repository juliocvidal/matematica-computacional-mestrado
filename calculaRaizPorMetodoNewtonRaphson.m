% Mestrado em Engenharia da Computacao e Sistemas - UEMA
% Disciplica de Matematica Computacional Aplicada
%
% Programa para calcular o zero de uma funcao real pelo metodo de
% Newton-Raphson
% 
% Julio Cardoso Vidal de Figueiredo - 25/04/2017
% juliocvidal

x = input('Informe os valores de a e b. Ex: [1,10]\n');
erro = input('Informe o erro máximo aceitável. Ex: 10^-7\n');

% Inicializando os valores de m e f(m) para garantir que não caiam nas
% condições de parada em um momento errado.
fm = erro + 1;
m=0;

y=funcao(k)
y1=diff(y, erro, 2)
y2=diff(y1)

fy = y(x)

% Testa as condicoes de convergencia
if (y(1) * y(2) >= 0 || y1(1)*y1(2) <= 0 || y2(1)*y2(2) <= 0)
    % Caso não sejam satisfeitas as condicoes, o programa informa o usuario
    % e encerra a execucao
    disp('Os parâmetros informados não atendem às condições de convergência para o método Raphson-Newton');
    disp('Por favor tente novamente com novos parâmetros');
    exit(0);
   
end

% Executa enquanto o intervalo ou o valor f(m) for maior que o erro
% Ou seja só para quando os dois cumprirem a condicao de ser menores que
% o erro
while(abs(x(1)-x(2)) > erro || fm >= erro)
    
    % Calcula o novo ponto m segundo a formula:
    % Xn = (a*f(b) - b*f(a))/f(b) - f(a)
    m = (x(1)*y(2) - x(2)*y(1)) / y(2) - y(1);    
    fm=funcao(m);
    
    if (fm == 0) break; end
    
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

