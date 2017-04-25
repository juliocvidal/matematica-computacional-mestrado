a = input('informe o dividendo:');
b = input('informe o divisor:');

resto = b +1;
quociente = 0;

while (resto >= b) 
    resto = a - b;
    quociente = quociente + 1;
    a = resto;
end

fprintf('o resto eh: %d e o coeficiente eh: %d\n', resto, quociente);