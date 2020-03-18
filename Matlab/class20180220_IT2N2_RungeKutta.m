function [] = class20180220_IT2N2_RungeKutta (fig,x0,y0,h,xend)
%Solving 1st order ordinary differential equation of type 
%y'(x)=f(x,y) with initial condition y(x0)=y0 
%using Euler's or Runge-Kutta algorithm 
%with uniform grid spacing h. 

analytic='y';%is analytic soln available?

[xE,yE]=Euler(x0,y0,h,xend);
Visualization(fig,xE,yE,analytic,x0,y0,'E');

[xRK,yRK]=RungeKutta(x0,y0,h,xend);
Visualization(fig+1,xRK,yRK,analytic,x0,y0,'R');

end%class20180216_IT2N2_Euler

function [x,y] = Euler (x0,y0,h,xend)
%
%initial condition
x(1)=x0;
y(1)=y0;

Nsteps=floor((xend-x0)/h);
n=0;%counter
for(n=1:Nsteps)
    x(n+1)=x(n)+h;
    k=ODE(x(n),y(n));
    y(n+1)=y(n)+k*h;
end%for
end%Euler

function [x,y] = RungeKutta (x0,y0,h,xend)
%initial condition
x(1)=x0;
y(1)=y0;
Nsteps=floor((xend-x0)/h);
n=0;%counter
for(n=1:Nsteps)
    x(n+1)=x(n)+h;
    x23=x(n)+0.5*h;
    k1=ODE(x(n),y(n));
    y2=y(n)+k1*(0.5*h);
    k2=ODE(x23,y2);
    y3=y(n)+k2*(0.5*h);
    k3=ODE(x23,y3);
    y4=y(n)+k3*h;
    k4=ODE(x(n+1),y4);
    k=(k1+2*k2+2*k3+k4)/6;
    y(n+1)=y(n)+k*h;
end%for
end%RungeKutta

function [Dy] = ODE (x,y)
Dy=cos(x);
end%ODE
function [y] = Analytic (x0,y0,x)
C=y0-sin(x0);
y=sin(x)+C;
end%ODE

function [] = Visualization (fig,x,y,analytic,x0,y0,algo)

figure(fig);
clf;

vert=2;
horz=2;

%the graph of the solution
subplot(vert,horz,[1 2]);
hold on;
plot(x,y,'b.-');
grid on;
xlabel('x');
ylabel('y');
if(analytic=='y')
    ya=Analytic(x0,y0,x);
    plot(x,ya,'ro');
end
if(algo=='E')
    if(analytic=='y')
        legend('Euler','Analytic');
    else
        legend('Euler');
    end
elseif(algo=='R')
    if(analytic=='y')
        legend('Runge-Kutta','Analytic');
    else
        legend('Runge-Kutta');
    end
end

%absolute error
subplot(vert,horz,[3]);
hold on;
AbsErr=y-ya;
plot(x,AbsErr,'b.-');
grid on;
xlabel('x');
ylabel('absolute error');

%relative error
subplot(vert,horz,[4]);
hold on;
RelErr=AbsErr./ya;
plot(x,RelErr,'b.-');
grid on;
xlabel('x');
ylabel('relative error');

end%Visualization