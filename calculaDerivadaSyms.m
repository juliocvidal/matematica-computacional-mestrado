syms x
f(x) = sin(x) + 2 .* (exp(1) .^ (x.^3));
df = diff(f,x)