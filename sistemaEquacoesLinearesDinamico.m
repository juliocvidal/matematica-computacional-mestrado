
%coeficientes = load(input('informe o nome do arquivo da matriz de coeficientes\n'))
coeficientes = load('/Users/juliocvidal/Documents/MATLAB/mat1.mat');

%constantes = load(input('informe o nome do arquivo do vetor de constantes\n'))
constantes = load('/Users/juliocvidal/Documents/MATLAB/constantes.mat');

%vetor de chutes iniciais 
x = input('informe um vetor de chutes iniciais de acordo com o tamanho da matriz. Ex. para uma matriz 4x4: [1 1 1 1]\n');

a = coeficientes.mat;
c = constantes.const;
solucao = 0;
tamanho = 0;

erro = 10^-4;

impossivel = 0;

 while(true)
    tamanhoMatriz = max(size(a));
    tamanhoVetorConstantes = max(size(c));
    diagonal = 0;
    
    % variavel i vai ser usada para caminhar linhas
    for i=1:tamanhoMatriz
        
        %sempra que inicia uma linha zera os valores
        linha = 0;
        
        %variavel j caminha nas colunas
        for j=1:tamanhoMatriz
            
            %se forem iguais significa que esse indice faz parte da
            %diagonal principal
            if (i==j)
                %ja armazenando os elemento da diagonal num vetor para usar
                %la adiante no outro for
                diagonal(i) = abs(a(i,j));
            %senao, faz parte da linha, obviamente, entao deve ser somado
            %aos outros itens da linha
            else
                linha = linha + abs(a(i,j));
            end
        end
        %quando termina o laco da variavel j, significa o fim de uma linha,
        %ou seja, j ja passou por todas colunas daquela linha.
        %verifica entao se a diagonal ? menor que a linha. se for ? pq nao
        %da pra resolver o sistema por esse metodo. seta a flag impossivel
        %pra false e for?a saida do la?o pra nao ficar processando a toda        
        if abs(diagonal(i)) < abs(linha)
            impossivel = 1; 
            break;
        end
    end    
    
    %se a flag impossivel estiver verdadeira, pode encerrar a execu??o do
    %la?o principal, que ? o while
    if (impossivel)
        break;
    end
    
    solucao = 1;
    
    %so me interessa aqui a quantidade de linhas, pois eh esse o numero que
    %vai aumentar conforme forem surgindo novos valores de x, o numero de
    %colunas eh sempre constante e igual a quantidade de variaveis
    [tamanho, lixo] = size(x);
    
    %zera o novoX a cada interacao so por precaucao
    novoX = 0;
    
    % variavel i vai ser usada para caminhar linhas
    for i=1:tamanhoMatriz
        
        %sempra que inicia uma linha zera os valores
        linha = 0;
        
        %variavel j caminha nas colunas
        for j=1:tamanhoMatriz
            
            %verifica a diagonal de novo, dessa vez para pegar somente os
            %elementos q nao fazem parte da diagonal e somar na linha
            if (i~=j)
                %vai adicionando os itens na linha ja com sinal negativo
                %x(tamanho, j) quer dizer que quero pegar a linha atual da
                %matriz de solucoes, ou seja o tamanho dela, ja que ela
                %cresce em linhas e eh constante em colunas.
                %e o j eh pra pegar a coluna certa, ou seja a11 deve
                %multiplicar x(tamanho, 1) e por a? vai
                linha = linha - a(i,j)*x(tamanho,j);
            end
        end
        %finalmente ao fim de cada linha, calcula o novox da forma que ja
        %se sabe: constante menos a soma das linhas dividido pelo elemento
        %da diagonal
        novoX(i) = (c(i) - linha)/diagonal(i);
    end
      
    %verifica se o novoX encontrado menos o anterior eh menor que o erro.
    % essa sintaxe bizarra x(tamanho,:) indica que quero pegar a ultima
    % linha inteira da matriz. como se fosse um vetor
    if (abs(abs(novoX) - abs(x(tamanho,:)))  < erro)
        break;
    end

    %caso nao tenha caido no if, quer dizer que a solucao ainda nao foi
    %encontrada, entao o novoX deve ser adicionada a matriz c e o algoritmo
    %continua.
    %esse eh o ponto em que a matriz cresce em linhas, mas continua
    %constante em colunas,
    x = [x; novoX];
 end
 
 if (solucao)         
   plot (x);
    
    disp('solucoes encontradas');
    x(tamanho,:)
    
 else
     disp('impossivel resolver esse sistema por esse metodo');
 end