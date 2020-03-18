function [] = class20180207_IT2NX_NewtonDim ()

%initial guess
x0=5;
y0=1;

Rapprx=Newton([x0,y0],100);
format long;Rapprx,format;

[yRes,fRes,DfRes]=function_value_and_derivative(Rapprx(end,:));
format long;fRes,format;


end%class20180207_IT2N1_Newton

function [R] = Newton (r0,Nmax)
%Solving [f1(x,y) f2(x,y)]=[0 0] for x,y by Newton's algorithm.
%r0=[x0 y0]: initial guess 
%Nmax: maximum number of iterations
err_lim=10^(-6);
err=err_lim+1;
N=1;%counter for iteration

R(N,:)=r0;%storing the approximations
while(err>err_lim & N<Nmax)
    %iterating...
    [y,f,Df]=function_value_and_derivative(R(N,:));
    R(N+1,:)=[[R(N,:)]'-Df(:,:,1)\f(:,1)]';%computing and storing the approximations
    [y,f,Df]=function_value_and_derivative(R(N+1,:));
    err=sum(abs(f));%should be zero vector
    N=N+1;
    
    visualization(R);
    
end

end%Newton

function [Y,f,Df] = function_value_and_derivative (r)
%Computing the function value and its derivative value at r.
x=r(:,1);
y=r(:,2);

y1=sqrt(x.^2+3*x-5);
y2=sqrt(-x.^2+15);
Y=[y1,y2];

f1=x.^2-y.^2+3*x-5;
f2=x.^2+y.^2-15;
f=[f1';f2'];

f1x=2*x+3;
f1y=-2*y;
f2x=2*x;
f2y=2*y;
for(k=1:length(x))
    Df(:,:,k)=[f1x(k),f1y(k);f2x(k),f2y(k)];
end

end%function_value_and_derivative
    
function [] = visualization (R);

xmin=min(R(:,1));
xmax=max(R(:,1));
Dx=xmax-xmin;
spacex=0.2*Dx;
x=linspace(xmin-spacex,xmax+spacex,10^3);

ymin=min(R(:,2));
ymax=max(R(:,2));
Dy=ymax-ymin;
spacey=0.2*Dy;
y=linspace(ymin-spacey,ymax+spacey,10^3);

[Y,f,Df] = function_value_and_derivative ([x',y']);

figure(1);
clf;
hold on;
plot(R(:,1),R(:,2),'ro-');
linetype1='b-';
linetype2='k-';
plot(x,Y(:,1),linetype1);
plot(x,-Y(:,1),linetype1);
plot(x,Y(:,2),linetype2);
plot(x,-Y(:,2),linetype2);
grid on;

end%visualization




