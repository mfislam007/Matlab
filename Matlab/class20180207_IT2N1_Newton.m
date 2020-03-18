function [] = class20180207_IT2N1_Newton ()

Xapprx=Newton(2.3,10);
format long;Xapprx',format;

end%class20180207_IT2N1_Newton

function [X] = Newton (x0,Nmax)
%Solving f(x)=0 for x by Newton's algorithm.
%x0: initial guess 
%Nmax: maximum number of iterations
err_lim=10^(-9);
err=err_lim+1;
N=0;

X(1)=x0;%storing the approximations
%Doing the first step...
[f,Df]=function_value_and_derivative(x0);
x1=x0-f/Df;
X(2)=x1;%storing again
while(err>err_lim & N<Nmax)
    %repeating...
    N=N+1;
    [f,Df]=function_value_and_derivative(X(N+1));
    X(N+2)=X(N+1)-f/Df;
    [f,Df]=function_value_and_derivative(X(N+2));
    err=abs(f);
    
    xmin=min(X);
    xmax=max(X);
    Dx=xmax-xmin;
    space=0.2*Dx;
    x=linspace(xmin-space,xmax+space,10^3);
    [fx,Dfx]=function_value_and_derivative(x);
    [fX,DfX]=function_value_and_derivative(X);
    %x,f%debugg
    visualization(x,fx,X,fX);
    
end

end%Newton

function [f,Df] = function_value_and_derivative (x)
%Computing the function value and its derivative value at x.

%f=x.^2-4;
%Df=2*x;

f=sin(x)-exp(-x);
Df=cos(x)+exp(-x);

end%function_value_and_derivative
    
function [] = visualization (x,fx,X,fX);

figure(1);
clf;
hold on;
plot(x,fx,'b-');
plot(X,zeros(size(X)),'ro')
plot(X,fX,'ro')
grid on;

end%visualization




