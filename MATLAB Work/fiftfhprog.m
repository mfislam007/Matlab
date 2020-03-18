syms x
y = 3*sin(x)+7*cos(5*x); % defining the function
lhs = diff(y,2)+y; %evaluating the lhs of the equation
rhs = -5*cos(2*x); %rhs of the equation
if(isequal(lhs,rhs))
disp('Yes, the equation holds true');
else
disp('No, the equation does not hold true');
end
disp('Value of LHS is: '), disp(lhs);