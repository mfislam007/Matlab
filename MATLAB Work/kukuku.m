% Script file: main1.m
% The RHS of the differential equation is defined as
% a handle function
% File prepared by David Houcque - Northwestern U. - 5/11/2005

% Calculate exact solution

% Call functions
[x,y] = rk(0,1,1,10);
[x,y] = f(1,1)
% Plot
plot(x0,y0,'k-',x1,y1,'k-.')
xlabel('x')
ylabel('y')
legend('Analytical','Forward','Modified','Backward')
axis([0 0.3 1 1.07])