%coeficientes = load(input('informe o nome do arquivo da matriz de coeficientes\n'))
%coeficientes = load('/Users/juliocvidal/Documents/MATLAB/mat1.mat');

%constantes = load(input('informe o nome do arquivo do vetor de constantes\n'))
%constantes = load('/Users/juliocvidal/Documents/MATLAB/constantes.mat');
clear;

a = input('Informe a Matriz de coeficientes. Ex. para uma matriz 3x3: [9 4 2; 1 3 2; 2 2 9]\n');%coeficientes.mat;
c = input('Informe o vetor de constantes. Ex. para uma matriz 3x3: [13 6 5]\n');%constantes.const;
x = input('Informe um vetor de chutes iniciais de acordo com o tamanho da matriz. Ex. para uma matriz 3x3: [0 0 0]\n');

solucao = 1;
tamanho = 0;

erro = 10^-7;

diagonais = abs(diag(a));
tamanhoDaMatriz = max(size(a));

%Primeiro criterio de convergencia (igual ao Jacobi)
for i = 1:tamanhoDaMatriz
    soma = 0;
    for j = 1:tamanhoDaMatriz
        if j ~= i
            %fprintf("i: %d; j: %d; aij: %d\n", i, j, abs(a(i,j)));
            soma = soma + abs(a(i,j));
        end
        if diagonais(i) < soma
            solucao = 0;
            break;
        end
    end
end

%verifica se a solucao falhou no primeiro criterio.
%caso tenha falhado, nem precisa testar o segundo
if (solucao)
    
    %Calculo dos betas para o segundo criterio de convergencia
    betas = zeros(1,tamanhoDaMatriz);
    
    for i=1:tamanhoDaMatriz
        somabeta = 0;
        for j=1:tamanhoDaMatriz
            if (j>i)
                somabeta = somabeta + abs(a(i,j));
            elseif (j<i)
                somabeta = somabeta + abs(a(i,j))*betas(j);
            end
        end
        betas(i) = (1/diagonais(i)) * somabeta;
        
        if (betas > 1)
            solucao = 0;
        end
    end
end


while(solucao)
    
    [tamanho, lixo] = size(x);
    novoX = zeros(1,tamanhoDaMatriz);
    
    for i=1:tamanhoDaMatriz
        linha = 0;
        
        for j=1:tamanhoDaMatriz
            if (j>i)
                linha = linha - a(i,j)*x(tamanho,j);
            elseif (j<i)
                linha = linha - a(i,j)*novoX(j);
            end
        end
        novoX(i) = (c(i) + linha)/diagonais(i);
    end
    
    if (abs(abs(novoX) - abs(x(tamanho,:)))  < erro)
        break;
    end
    
    x = [x; novoX];
    
end

if (solucao)
    plot (x);
    
    disp('Solucoes encontradas:');
    x(tamanho,:)
    fprintf('Iteracoes: %d\n', tamanho);
    
else
    disp('Impossivel resolver esse sistema por esse metodo');
end