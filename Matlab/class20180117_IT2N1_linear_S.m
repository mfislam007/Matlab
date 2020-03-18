%Let's draw a S-shaped line in a plane. 
%It too is such a line that 
%it  is not easily a function type of a relation 
%for any change of the variables. 

%Often one can, however, present the coordinates by 
%a suitable choice of a common parameter t, 
%e.g. directly {x(t),y(t)}. 

%Here, the shape of the desired line suggested 
%polynomial type functions x(t) and y(t): 
%x(t)=ax+bx*t+cx*t^2+dx*t^3 (four model parameters for x) and 
%y(t)=ay+by*t+cy*t^2+dy*t^3 (four model parameters for y). 
%Thus four values for x and also four values for y may be required.

clear;%clear for posssible existing variables in the workspace

%choice of restrictions
restr=1;
%0: local extreme conditions for some x and y
%1: all coordinate values

%choosing some (reference) values for parameter t
t0=0;
t1=0.125;
t2=0.25;
t3=0.75;
t4=0.875;
t5=1;

T=[t0 t1 t2 t3 t4 t5];

%choosing some values for variable x
x0=-1;%t2
x1=-2;%t5
x2=2;%t0
x3=1;%t3

%choosing some values for variable y
y0=-2;%t4
y1=-1;%t5
y2=1;%t0
y3=2;%t1

%solving for model parameter values for x and y
if(restr==0)
    
    Ax=[1 t0   t0^2   t0^3;...
        0  1 2*t2   3*t2^2;...
        0  1 2*t3   3*t3^2;...
        1 t5   t5^2   t5^3 ...
       ];
    bx=[x2 0 0 x1]';
       
    Ay=[1 t0   t0^2   t0^3;...
        0  1 2*t1   3*t1^2;...
        0  1 2*t4   3*t4^2;...
        1 t5   t5^2   t5^3 ...
       ];
    by=[y2 0 0 y1]';

elseif(restr==1)
    AxTMP=vander([t0 t2 t3 t5]);%Vandermonde matrix
    Ax=AxTMP(:,end:-1:1);%reversing due to the definition of vander wrt our chosen representation 
    bx=[x2 x0 x3 x1]';
    
    AyTMP=vander([t0 t1 t4 t5]);%Vandermonde matrix
    Ay=AyTMP(:,end:-1:1);%reversing due to the definition of vander wrt our chosen representation 
    by=[y2 y3 y0 y1]';
end
px=Ax\bx;
py=Ay\by;

%PLOTTING
N=10^3;%number of points to be evaluated
t=linspace(T(1),T(end),N);%the paramerter values
x=px(1)+px(2)*t+px(3)*t.^2+px(4)*t.^3;%x-coordinates
y=py(1)+py(2)*t+py(3)*t.^2+py(4)*t.^3;%y-coordinates

X=px(1)+px(2)*T+px(3)*T.^2+px(4)*T.^3;%x at the chosen references
Y=py(1)+py(2)*T+py(3)*T.^2+py(4)*T.^3;%y at the chosen references


figure(12);
clf;
hold on;
plot(x,y,'b.-');
plot(X,Y,'ro');
grid on;
