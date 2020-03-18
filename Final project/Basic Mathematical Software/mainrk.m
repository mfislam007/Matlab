%Graphical representation of Runge-Kutta method for -sinx
[x,y] = rk(0,4*pi,2,100)
plot(-sin(x))
title('Graphical representation of 1st order runga-kutta method for -sinx')
xlabel('x')
ylabel('y')