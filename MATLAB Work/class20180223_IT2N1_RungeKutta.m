function [] = class20180223_IT2N1_RungeKutta (fig,x0,y0,h,xend)
%Solving ordinary differential eqn 
%y'=f(x,y) with initial condition y(x0)=y0. 
%Lets use Euler's algorithm with step size h 
%and finishing condition xend.

DoesExactExist='y';

[xE,yE]=Euler(x0,y0,h,xend);
Visualize(fig,xE,yE,DoesExactExist,x0,y0,'E');

[xRK,yRK]=RungeKutta(x0,y0,h,xend);
Visualize(fig+1,xRK,yRK,DoesExactExist,x0,y0,'R');

end%class20180214_IT2N1_Euler

function [x,y] = Euler (x0,y0,h,xend)
x(1)=x0;
y(1)=y0;
n=0;
while(x(n+1)<=xend)
    n=n+1;
    x(n+1)=x(n)+h;
    k=ODE(x(n),y(n));
    y(n+1)=y(n)+k*h;
end%while
end%Euler

function [x,y] = RungeKutta (x0,y0,h,xend)
x(1)=x0;
y(1)=y0;
n=0;
while(x(n+1)<=xend)
    n=n+1;
    x(n+1)=x(n)+h;
    x23=x(n)+0.5*h;
    k1=ODE(x(n),y(n));
    y2=y(n)+k1*(0.5*h);
    k2=ODE(x23,y2);
    y3=y(n)+k2*(0.5*h);
    k3=ODE(x23,y3);
    y4=y(n)+k3*(1.0*h);
    k4=ODE(x(n+1),y4);
    k=(k1+2*(k2+k3)+k4)/6;
    y(n+1)=y(n)+k*h;
end%while
end%RungeKutta

function [Dy] = ODE (x,y)
Dy=cos(x);
end%ODE
function [y] = ExactSolution (x,x0,y0)
y=sin(x)+(y0-sin(x0));
end%ExactSolution

function [] = Visualize (fig,x,y,exact,x0,y0,apprx)

vert=3;
horz=2;

figure(fig);
clf;

if(exact=='y')
    subplot(vert,horz,[1:4]);
else
    subplot(vert,horz,[1:6]);
end
hold on;
plot(x,y,'k.-');
grid on;
xlabel('x');
ylabel('y');
if(apprx=='E')
    legend('Euler','Location','best');
elseif(apprx=='R')
    legend('Runge-Kutta','Location','best');
end

if(exact=='y')
    hold on;
    yexact=ExactSolution(x,x0,y0);
    plot(x,yexact,'ro-');
    if(apprx=='E')
        legend('Euler','exact','Location','best');
    elseif(apprx=='R')
        legend('Runge-Kutta','exact','Location','best');
    end
    
    %ERRORS
    yErrAbs=y-yexact;
    yErrRel=yErrAbs./yexact;

    subplot(vert,horz,[5]);
    hold on;
    plot(x,yErrAbs,'b.-');
    grid on;
    xlabel('x');
    ylabel('absolute error of y');

    subplot(vert,horz,[6]);
    hold on;
    plot(x,yErrRel,'r.-');
    grid on;
    xlabel('x');
    ylabel('relative error of y');
end%if

end%Visualize