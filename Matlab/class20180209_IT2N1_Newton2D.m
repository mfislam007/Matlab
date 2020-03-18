function [] = class20180209_IT2N1_Newton2D ()

x0=0.1;
y0=0.1;
r0=[x0;y0];
maxiter=100;
Rapprx=Newton(r0,maxiter);
format long;Rapprx',format;

end%class20180207_IT2N1_Newton

function [R] = Newton (r0,Nmax)
%Solving [f1(x,y) f2(x,y)]'=[0 0]' for [x y]' by Newton's algorithm.
%r0: initial guess 
%Nmax: maximum number of iterations
err_lim=10^(-3);
err=err_lim+1;
N=1;

R(:,1)=r0;%storing the approximations
%Doing the first step...
while(err>err_lim & N<Nmax)
    %repeating...
    [f,Df]=function_value_and_derivative(R(:,N));
    R(:,N+1)=R(:,N)-Df\f;%inv(Df)*f
    [f,Df]=function_value_and_derivative(R(:,N+1));
    err=sqrt(sum(f.^2));%hmmm... orthogonal [f1 f2], why on earth... well, why not =)
    
    N=N+1;

    visualization(R);
    
end

end%Newton

function [f,Df] = function_value_and_derivative (r)
%Computing the function value and its derivative value at r=[xn;yn].
x=r(1,:);%stupid to tear vectorization apart...
y=r(2,:);%...but let's do it anyway, leaving it for you to correct...

f1=x^2-y^2+3*x-5;
f2=x^2+y^2-15;
f=[f1;f2];

f1x=2*x+3;
f1y=-2*y;
f2x=2*x;
f2y=2*y;
Df=[f1x,f1y;f2x,f2y];

end%function_value_and_derivative
    
function [] = visualization (R);

%xmin=min(R(1,:));
%xmax=max(R(1,:));
%Dx=xmax-xmin;
%space=0.2*Dx;
%x=linspace(xmin-space,xmax+space,10^3);
%[fx,Dfx]=function_value_and_derivative(x);
%[fX,DfX]=function_value_and_derivative(X);

figure(1);
clf;
hold on;
plot(R(1,:),R(2,:),'ro-');
grid on;
xlabel('x');
ylabel('y');
title('Consecutive approximations [xn;yn] for F:[x;y]-->[f1(x,y);f2(x,y)], F=[0;0]');
end%visualization




