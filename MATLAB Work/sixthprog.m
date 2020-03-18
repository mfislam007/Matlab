syms x
y = 2*x^3 + 3*x^2 - 12*x + 17; % defining the function
ezplot(y,[1,-2])
g = diff(y)
s=solve(g)
subs(y,1)
subs(y,-2)