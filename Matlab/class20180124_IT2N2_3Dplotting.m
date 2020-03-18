function [] = class20180124_IT2N2_3Dplotting (whichplot,fig)

N=1000;
a=linspace(0,2*pi,2*N);
d=linspace(0,pi,N);
r=1;
X=r*sin(d')*cos(a);
Y=r*sin(d')*sin(a);
Z=r*cos(d')*ones(size(a));

figure(fig);
clf;
if(whichplot=='surface')
    %
    P=surf(X,Y,Z);
    get(P);
    set(P,'EdgeColor','none');
elseif(whichplot=='contour')
    %
    V=linspace(-r,r,111);
    P=contour(X,Y,Z,V);
elseif(whichplot=='3D line')
    %
    rounds=5;
    t=linspace(0,rounds*2*pi,N);
    r=(t-min(t)).*(t-max(t));
    x=r.*cos(t);
    y=r.*sin(t);
    z=1*t;
    plot3(x,y,z);    
else
    disp(['Your input "',whichplot,'" was illegal.']);
end
xlabel('x');
ylabel('y');

end%class20180124_IT2N2_3Dplotting