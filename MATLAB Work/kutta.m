% MCE 372 Engineering Analysis Example Code
% First Order ODE Solution Using ode45 with Anonymous Function Method
% Example From Gilat 4th Ed. pp 303-307
clc;clear all;clf
% Use Anonymous Function
ode1=@(x,y)(-sin(x))
% Call Solver With Anonymous Function Name,
% Independent Variable Range and Initial Value of Dependent Variable
[x,y]=ode45(ode1,[0*pi:0.01*pi:4*pi],2);
% Plotting Segment
plot(x,y,'Linewidth',2)
xlabel('x'),ylabel('y'),grid on
title('Solution to ODE dy/dx = -sin(x)')