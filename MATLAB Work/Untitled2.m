%% 1-D FIR filter design %%%%%

wc=0.375*pi;
M=33;
j=(M-1)/2;
i=0:j;
h=sin(wc*(i))./(pi*(i));
h(1)=wc/pi; 
w=0.54+0.46*cos(pi*(0:j)'/j);
h=h.*w';
a(1)=h(1);
a(2:j+1)=2*h(2:j+1);

%%% Chebycheve Polynomial, McClellan Transformation & 2-D FIR filter Design %%%%

w1=linspace(-pi,pi,100);
w2=linspace(-pi,pi,100);
for t1=1:100;
 for t2=1:100;     
     f(t1,t2)=-0.5+0.5*cos(w1(t1))+0.5*cos(w2(t2))+0.25*cos(w1(t1)-w2(t2))+0.25*cos(w1(t1)+w2(t2));
    for n=0:j;
         n=n+1;
        if n==1;
           T(1)=1;
        elseif n==2
           T(2)=f(t1,t2);             
        else  
           T(n)=2*f(t1,t2)*T(n-1)-T(n-2);           
        end
     end
     H(t1,t2)=sum(a.*T);
 end
end

%%%% PLOT %%%%%%%

mesh(w1,w2,H)
grid
axis([-pi pi -pi pi 0 1])
xlabel('Radians')
ylabel('Radians')
zlabel('Magnitudes')
title('2-D zero phase digital FIR filter using Hamming Window')



