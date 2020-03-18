% absolute error and relative error calculation
f=@(x)cos(x)
x0=pi/4;
f_exact=-sin(x0)

for i=1:21;
    h(i)=10^(1-i);
    f_approx=(f(x0+h(i))-f(x0-h(i)))./(2*h(i));
    abserr(i)=abs(f_approx-f_exact);
    relerr(i)=abs(f_approx-f_exact)/f_exact;   
end
figure(1)
subplot(211)
plot(h,abserr,'ro-');
xlabel('x')
ylabel('y')
title('absolute error calculation in normal scale')
subplot(212)
loglog(h,abserr,'ro-');
xlabel('x')
ylabel('y')
title('absolute error calculation in log scale')
figure(2)
subplot(211)
plot(h,relerr,'o--');
xlabel('x')
ylabel('y')
title('relative error calculation in normal scale')
subplot(212)
loglog(h,relerr,'o--');
xlabel('x')
ylabel('y')
title('relative error calculation in log scale')