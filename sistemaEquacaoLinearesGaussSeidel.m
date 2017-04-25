x1 = 1;
x2 = 1;
x3 = 1;
x4 = 1;

erro = 10^-4;
%coeficientes = load(input('informe o nome do arquivo da matriz de coeficientes\n'))
coeficientes = load('/Users/juliocvidal/Documents/MATLAB/mat1.mat');

%constantes = load(input('informe o nome do arquivo do vetor de constantes\n'))
constantes = load('/Users/juliocvidal/Documents/MATLAB/constantes.mat');

a = coeficientes.mat;
c = constantes.const;
solucao = 1;
tamanho = 0;

%Primeiro criterio de convergencia (igual ao Jacobi)
if ( abs(a(1,1)) < (abs(a(1,2)) + abs(a(1,3)) + abs(a(1,4)) ) || abs(a(2,2)) < (abs(a(2,1)) + abs(a(2,3)) + abs(a(2,4)) ) || abs(a(3,3)) < (abs(a(3,1)) + abs(a(3,2)) + abs(a(3,4)) ) || abs(a(4,4)) < (abs(a(4,1)) + abs(a(4,2)) + abs(a(4,3)) ))
    solucao = 0;
end  

%Calculo dos betas para o segundo criterio de convergencia
beta1=(1/abs(a(1,1))) * ( abs(a(1,2)) + abs(a(1,3)) + abs(a(1,4)));
beta2=(1/abs(a(2,2))) * ( abs(a(2,1))*beta1 + abs(a(2,3)) + abs(a(2,4)));
beta3=(1/abs(a(3,3))) * ( abs(a(3,1))*beta1 + abs(a(3,2))*beta2 + abs(a(3,4)));
beta4=(1/abs(a(4,4))) * ( abs(a(4,1))*beta1 +abs(a(4,2))*beta2 + abs(a(4,3))*beta3 );

%Verificacao do segundo criterio de convergencia
if(beta1 >= 1 || beta2 >= 1 || beta3 >= 1 || beta4 >= 1)
    solucao = 0;
end

 while(solucao)
     
    tamanho = max(size(x1));
    
    novox1 = (c(1) - a(1,2).*x2(tamanho) - a(1,3).*x3(tamanho) - a(1,4).*x4(tamanho))/a(1,1);
    novox2 = (c(2) - a(2,1).*novox1 - a(2,3).*x3(tamanho) - a(2,4).*x4(tamanho))/a(2,2);
    novox3 = (c(3) - a(3,1).*novox1 - a(3,2).*novox2 - a(3,4).*x4(tamanho))/a(3,3);
    novox4 = (c(4) - a(4,1).*novox1 - a(4,2).*novox2 - a(4,3).*novox3)/a(4,4);
    
    if( (abs(abs(novox1) - abs(x1(tamanho))) < erro) & (abs(abs(novox2) - abs(x2(tamanho))) < erro) & (abs(abs(novox3) - abs(x3(tamanho))) < erro) & (abs(abs(novox4) - abs(x4(tamanho))) < erro))
        break;
    end
    
    x1(tamanho+1) = novox1;
    x2(tamanho+1) = novox2;
    x3(tamanho+1) = novox3;
    x4(tamanho+1) = novox4;
 end
 
 if (solucao)
    plot (x1, x2, x3, x4);
    
    disp('solucoes encontradas');
    
    fprintf('x1: %f x2: %f x3: %f x4: %f \ntamanho: %d\n', x1(tamanho), x2(tamanho), x3(tamanho), x4(tamanho), tamanho);
    
 else
     disp('impossivel resolver esse sistema por esse metodo');
 end