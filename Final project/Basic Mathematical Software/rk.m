% Runge-Kutta method implementation
function [x,y] = rk(x0,xf,y0,n)
h = (xf - x0)/n; % step size h and sample size n
x = x0; % initial x
y = y0; % initial y
for i = 1:n 
 k1 = ODE(x0,y0); % left-hand slope
 k2 = ODE(x0+h/2,y0+h*k1/2); % 1st midpoint slope
 k3 = ODE(x0+h/2,y0+h*k2/2); % 2nd midpoint slope
 k4 = ODE(x0+h,y0+h*k3); % right-hand slope
 k = (k1+2*k2+2*k3+k4)/6; % average slope
 y0 = y0 + h*k; % Runge-Kutta step
 x0 = x0 + h; % new x
 x = [x;x0]; % update x-column
 y = [y;y0]; % update y-column
 end 
end
