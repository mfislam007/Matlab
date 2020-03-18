function [] = class20180122_IT2N2_ControlStructures (pick)

if(pick==1)
    %
    DisplayMessage(pick);
    disp(['Lets do some repeating with "for".']);
    
    for(n=0:12)
        m(2*n+1)=2*n;
    end%for
    m   
elseif(pick==2)
    %
    DisplayMessage(pick);
    disp(['Lets do some repeating with "while".']);
    
    n=0;
    while(n<5)
        %
        m(n+1)=n;
        n=n+1;
    end%while
    m
elseif(pick==3)
    %
    DisplayMessage(pick);
    disp(['Lets do some 3D plotting.']);
    Nx=300;
    x=linspace(0,15,Nx);
    Ny=60;
    y=linspace(0,1,Ny);
    X=repmat(x',1,Ny);
    Y=repmat(y,Nx,1);
    Z=sin(X).*Y.^2;
    
    F=figure(1);
    clf;
    %get(F);
    S=surf(Z);
    %get(S);
    set(S,'EdgeColor','none');%[0 0 0]
    az=0;%-37.5;
    el=0;%30;
    view(az,el);
    
elseif(pick==4)
    %
    DisplayMessage(pick);
    disp(['Lets do some 3D plotting animated by view.']);
    Nx=100;
    x=linspace(0,15,Nx);
    Ny=150;
    y=linspace(0,20,Ny);
    X=repmat(x',1,Ny);
    Y=repmat(y,Nx,1);
    Z1=1*sin(X).*Y.^2;
    Z2=1*cos(Y).*X.^2;
    zmin=min( min(min(Z1)),min(min(Z2)) );
    zmax=max( max(max(Z1)),max(max(Z2)) );
    F=figure(1);
    
    N=100;
    for(n=0:N)
        t=n/N;
        S=surf((1-t)*Z1+t*Z2);
        set(S,'EdgeColor','none');%[0 0 0]
        az=-37.5;
        el=30;
        view(az+n,el);
        zlim([zmin,zmax]);
        pause(0.05);
    end
    
elseif(pick==5)
    %
    DisplayMessage(pick);
    disp(['Lets do some 3D plotting animated by view.']);
    Nx=100;
    x=linspace(0,15,Nx);
    Ny=150;
    y=linspace(0,20,Ny);
    X=repmat(x',1,Ny);
    Y=repmat(y,Nx,1);
    Z1=1*sin(X).*Y.^2;
    Z2=1*cos(Y).*X.^2;
    zmin=min( min(min(Z1)),min(min(Z2)) );
    zmax=max( max(max(Z1)),max(max(Z2)) );
    F=figure(1);
    
    N=1000;
    for(n=0:N)
        t=n/N;
        W=10;
        S=surf(cos(W*2*pi*t)*Z1+sin(W*2*pi*t)*Z2);
        set(S,'EdgeColor','none');%[0 0 0]
        az=-37.5;
        el=30;
        w=25;
        view(az+n,el*(1+sin(w*2*pi*t)));
        zlim([zmin,zmax]);
        axis off;
        title(['0<',num2str(t),'<1']);
        
        pause(0.05);
    end
    
else
    %
    disp(['Your choice for the input was illegal. Please choose again.']);
end

end%class20180122_IT2N2_ControlStructures

function [] = DisplayMessage (input)
disp(['You chose input ',num2str(input),'.']);
end%DisplayMessage