% Script file: main1.m
% The RHS of the differential equation is defined as
% a handle function
% File prepared by David Houcque - Northwestern U. - 5/11/2005
f=@(x,y) x./y;
% Calculate exact solution
g=@(x) sqrt(x.^2+1);
xe=[0:0.01:0.3];
ye=g(xe);
% Call functions
[x1,y1]=euler_forward(f,0,1,0.3,6);
[x2,y2]=euler_modified(f,0,1,0.3,6);
[x3,y3]=euler_backward(f,0,1,0.3,6);
% Plot
plot(xe,ye,'k-',x1,y1,'k-.',x2,y2,'k:',x3,y3,'k--')
xlabel('x')
ylabel('y')
legend('Analytical','Forward','Modified','Backward')
axis([0 0.3 1 1.07])
% Estimate errors
error1=['Forward error: ' num2str(-100*(ye(end)-y1(end))/ye(end)) '%'];
error2=['Modified error: ' num2str(-100*(ye(end)-y2(end))/ye(end)) '%'];
error3=['Backward error: ' num2str(-100*(ye(end)-y3(end))/ye(end)) '%'];
error={error1;error2;error3};
text(0.04,1.06,error)
