
%Let's draw a line in a plane such that 
%it  is not easily a function type of a relation 
%for any change of the variables. 

%Often one can, however, present the coordinates by 
%a suitable choice of a common parameter t, e.g. directly {x(t),y(t)}. 

%Here, the shape of the desired line ("a loop") suggested 
%polynomial type functions x(t) and y(t): 
%x(t)=ax+bx*t+cx*t^2+dx*t^3 (four model parameters for x) and 
%y(t)=ay+by*t+cy*t^2 (three model parameters for y). 
%Thus four values for x and three values for y may be required.

clear;%clear for posssible existing variables in the workspace

%choosing some (reference) values for parameter t
t0=0;%x,y
t1=0.2;%dummy
t2=0.4;%x
t3=0.5;%y
t4=0.6;%x
t5=0.8;%dummy
t6=1;%x,y

T=[t0 t1 t2 t3 t4 t5 t6];

x0=2;
x1=7;
x2=9;%dummy
x3=10;%dummy
x4=12;
x5=15;

y0=0;%y
y1=1;%y
y2=2;%dummy
y3=3;%dummy
y4=4;%dummy
y5=5;%y

Ax=[1 t0 t0^2 t0^3;...
    1 t2 t2^2 t2^3;...
    1 t4 t4^2 t4^3;...
    1 t6 t6^2 t6^3 ...
   ];
ux=[x0 x4 x1 x5]';
px=Ax\ux;

Ay=[1 t0 t0^2;...
    1 t3 t3^2;...
    1 t6 t6^2 ...
   ];
uy=[y0 y5 y1]';
py=Ay\uy;


N=10^3;
t=linspace(0,1,N);
x=px(1)+px(2)*t+px(3)*t.^2+px(4)*t.^3;
y=py(1)+py(2)*t+py(3)*t.^2;

X=px(1)+px(2)*T+px(3)*T.^2+px(4)*T.^3;
Y=py(1)+py(2)*T+py(3)*T.^2;

figure(1);
clf;
hold on;
plot(x,y,'b.-');
plot(X,Y,'ro');
grid on;