entrada = input('informe o numero: ');

saida = valor_absoluto(entrada);

fprintf('valor absoluto: %d\n', saida);

function y = valor_absoluto(x)
    %y =  abs(x);
    y = x;
    if (y < 0)
        y = x * -1;
    end
end
