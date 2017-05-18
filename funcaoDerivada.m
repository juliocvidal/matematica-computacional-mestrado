function y = funcaoDerivada(x)
    y = cos(x) + 6 .* (exp(1) .^ (x.^3)) .* x.^2;
    %y = 3*x.^2;
    %y=exp(1).^x + 2*sin(x);   
end
