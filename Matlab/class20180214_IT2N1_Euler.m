function [] = class20180214_IT2N1_Euler (fig,x0,y0,h,xend)
%Solving ordinary differential eqn 
%y'=f(x,y) with initial condition y(x0)=y0. 
%Lets use Euler's algorithm with step size h 
%and finishing condition xend.

[xE,yE]=Euler(x0,y0,h,xend);
DoesExactExist='y';
Visualize(fig,xE,yE,DoesExactExist,x0,y0);

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

function [Dy] = ODE (x,y)
Dy=cos(x);
end%ODE
function [y] = ExactSolution (x,x0,y0)
y=sin(x)+(y0-sin(x0));
end%ExactSolution

function [] = Visualize (fig,x,y,exact,x0,y0)

figure(fig);
clf;
plot(x,y,'k.-');
grid on;
xlabel('x');
ylabel('y');
legend('Euler');
if(exact=='y')
    hold on;
    yexact=ExactSolution(x,x0,y0);
    plot(x,yexact,'r.-');
    legend('Euler','exact');
end%if

end%Visualize