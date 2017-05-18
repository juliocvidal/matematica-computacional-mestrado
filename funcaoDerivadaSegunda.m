function y = funcaoDerivadaSegunda(x)
    y = 12 .* (exp(1) .^ (x.^3)) .*x - sin(x) + 18 .* (exp(1).^(x.^3)) .* x .^ 4; 
    %y = 6*x;
    %y=exp(1).^x + 2*cos(x);
end