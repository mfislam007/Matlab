function [ ] = class20180110_IT2N2_visual (fig)
%Whatever you write here as comments 
%will show in the manual ("help class20180110_IT2N2_visual").

x=[-1 3 2];
y=[3 4 0];
x(end+1)=x(1);%copying the first element to last (added) element
y(end+1)=y(1);

%drawing a circle
N=700;%no of points
R=2;%the radius
dx=2*R/(N-1);%following step size assuming constant wrt x
X=[-R:dx:R];%choosing x-coordinates in Cartesian system
Y=sqrt(R^2-X.^2);%y-coordinates from Pythagoras

figure(fig);%open frame
clf;%clear figure
hold on;%allow consecutive plots without erasing the previous
plot(x,y,'bo-');%'xxx' is a string, see "help plot"
plot(y,x,'rs--');
plot(X,Y,'go-');%circle, upper half
plot(X,-Y,'go-');%circle, lower half

figure(fig+1);
clf;
hold on;
xSL=[-10^25:10^24:10^26];
plot(xSL,straightline(xSL,2,10^26),'bo-');%calling self made function within a function...
plot(xSL,parabola(xSL),'rs-');

end%class20180110_IT2N2_visual

%...and defining them
function [y] = straightline (x,a,b)
y=a+b*x;
end%straightline

function [y] = parabola (x)
y=1*x.^2+5+x+2;
end%straightline