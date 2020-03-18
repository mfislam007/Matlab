[x,y]= meshgrid(-3:0.1:3);
g = x .* cos(-x.^2 - y.^2);
surf(x,y,g)