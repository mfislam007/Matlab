syms x n
int(cos(x));
int(exp(x));
int(log(x));
int(x^-1);
int(x^5*cos(5*x));
pretty(int(x^5*cos(5*x)));
int(x, 4, 9);
p = [1 7 0 -5 9];
polyval(p,4);
r = roots(p);
p2 = poly(r);
x = [1 2 3 4 5 6]; y = [5.5 43.1 128 290.7 498.4 978.67]; %data
p = polyfit(x,y,4);
x2 = 1:.1:6;
y2 = polyval(p,x2);
%plot(x,y,'o',x2,y2);
%grid on;
syms s t a b w
laplace(a)
laplace(t^2)
laplace(t^9)
laplace(exp(-b*t))
laplace(sin(w*t))
laplace(cos(w*t))
ilaplace(1/s^3)
syms s t a b w
ilaplace(1/s^7)
ilaplace(2/(w+s))
ilaplace(s/(s^2+4))
ilaplace(exp(-b*t))
ilaplace(w/(s^2 + w^2))
ilaplace(s/(s^2 + w^2))




















