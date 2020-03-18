function [iter] = class20180209_IT2N2_Newton2D (fig,damping)

%damping=0.1;
x0=0;
y0=5;
r0=[x0;y0];
maxiter=100;
[R,iter]=Newton(r0,maxiter,damping,fig);
%format long;R',format;%display some output
[R(:,[1,end])]'%display some output

end%class20180207_IT2N2_Newton2D


function [R,n] = Newton (r0,nmax,damping,fig)
%Solving F([x;y])=[f1(x,y);f2(x,y)]=[0;0] for [x;y] 
%with initial guess r0 and 
%maximum number of iterations nmax.
err_lim=1.0*10^(-1);
err(1)=err_lim+1;

R(:,1)=r0;
n=0;%counter for iterations
while(err(n+1)>err_lim & n<nmax)
    %Newton's iteration
    n=n+1;
    [f,Df]=values_f_Df(R(:,n),'implicit');
    R(:,n+1)=R(:,n)-damping*(Df\f);%inv(Df)*f
    
    [f,Df]=values_f_Df(R(:,n+1),'implicit');
    err(n+1)=sqrt(sum([f].^2));%ERROR: use function values instead
    
    visualization(R,err,fig);
    
end%while

end%class20180207_IT2N2_Newton2D


function [f,Df] = values_f_Df (r,out)
%Defines the problem F(r)=0.

if(out=='implicit')
    x=r(1,:);
    y=r(2,:);
    %the functions whose zeros are to be solved...
    %"implicit"
    f1=x^2-y^2+3*x-5;
    f2=x^2+y^2-15;
    f=[f1;f2];
    %...and their derivatives
    f1x=2*x+3;
    f1y=-2*y;
    f2x=2*x;
    f2y=2*y;
    Df=[f1x,f1y;f2x,f2y];    
elseif(out=='explicit')
    x=r(1,:);
    %"explicit", if available
    y1=sqrt(x.^2+3*x-5);
    y2=sqrt(-x.^2+15);
    f=[y1;y2];
    Df=0;%dummy
elseif(out=='surface_')
    x=r(:,:,1);
    y=r(:,:,2);
    %the functions whose zeros are to be solved...
    %"implicit"
    f1=x.^2-y.^2+3*x-5;
    f2=x.^2+y.^2-15;
    f(:,:,1)=f1;
    f(:,:,2)=f2;
    Df=0;%dummy
else
    f=[0;0];
end

end%values_f_Df

function [] = visualization(R,err,fig)

%number of iterations
N=length(err);

figure(fig);
clf;

vert=2;
horz=3;

%the iterations in xy-plane...
subplot(vert,horz,1);
hold on;
plot(R(1,:),R(2,:),'ro-');
grid on;
xlabel('x');
ylabel('y');

%...and the corresponding error
subplot(vert,horz,4);
hold on;
plot(1:N,log10(err),'r.-');
grid on;
xlabel('iteration');
ylabel('log10(error)');

%explicit solutions!
Nx=10^2;
xmin=min(R(1,:));
xmax=max(R(1,:));
Dx=xmax-xmin;
spacePx=0.0*Dx;
spaceNx=1*Dx;
x=linspace(xmin-spaceNx,xmax+spacePx,Nx);
[f,Df]=values_f_Df(x,'explicit');
subplot(vert,horz,[2,3]);
hold on;
plot(x,f(1,:),'k-');
plot(x,-f(1,:),'k-');
plot(x,f(2,:),'k-');
plot(x,-f(2,:),'k-');
plot(R(1,:),R(2,:),'ro-');
grid on;
xlabel('x');
ylabel('y');

%heading for plotting the surface components f1 and f2
Nx=10^2;
xmin=-5;%min(R(1,:));
xmax=5;%max(R(1,:));
Dx=xmax-xmin;
spacePx=0.0*Dx;
spaceNx=0.0*Dx;
x=linspace(xmin-spaceNx,xmax+spacePx,Nx);
Ny=10^2;
ymin=-5;%min(R(2,:));
ymax=5%max(R(2,:));
Dy=ymax-ymin;
spacePy=0*Dy;
spaceNy=0*Dy;
y=linspace(ymin-spaceNy,ymax+spacePy,Ny);

XY(:,:,1)=repmat(x',[1,Ny]);
XY(:,:,2)=repmat(y,[Nx,1]);
[F,Df]=values_f_Df(XY,'surface_');

az=0;
el=90;

subplot(vert,horz,5);
hold on;
F1=surf(x,y,F(:,:,1));
%get(F1)
set(F1,'EdgeColor','none');
plot3(R(1,:),R(2,:),repmat(max(max(F(:,:,1))),[1 N]),'ro-')
grid on;
xlabel('x');
ylabel('y');
zlabel('f1(x,y)');
view(az,el);

subplot(vert,horz,6);
hold on;
F2=surf(x,y,F(:,:,2));
%get(F2)
set(F2,'EdgeColor','none');
plot3(R(1,:),R(2,:),repmat(max(max(F(:,:,2))),[1 N]),'ro-')
grid on;
xlabel('x');
ylabel('y');
zlabel('f2(x,y)');
view(az,el);

end%visualization


