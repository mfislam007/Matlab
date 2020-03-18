%commenting can be done by typing sign %
a=2+7
b=3-9;%semicolon prevents printing on screen
b%printing afterwards
A=[3 7];%a table of numbers
A
B=[3;7]%semicolon is a row separator
C=[3,2.5;4 6;6,0]%column separator is a comma or blank space
operations=[2+4 4-9;...%addition
            2*4 4/4;...%multiplication
            2.*4 [2]*[4];...%tables can consist of tables if sizes agree
            4^2 4^0.5;...%power and root
            8^(1/3) 2^(-2);...
            sqrt(2) sqrt(-1)]%running into complex numbers
%NOTE complex valued sqrt(-1) changes 
%the type of ALL the elements 
%of the table to be complex

help sqrt%the manual

moreoperations=...
   [log(2) log(exp(1));...%logarithm
    exp(1) exp(2);...%natural exponential
    log(8)/log(2) log10(8)/log10(2);...%arbitrary base logarithm
    sin(90) sind(90);...%argument in rad by default
    sin(pi/2) pi;...%pi=3.141592654...
    asin(1) pi/2;...%inverse trigonometric
    atan(-1) atan2(1,-1);...
    atand(-1) atan(-1)+pi]

z1=3+4i;
z2=3+4*i;
complex1=[z1;z2;i*i;j*j;i*j]

complex2=[z1,real(z1),imag(z1),conj(z1),conj(z1)*z1,abs(z1)].'
%' stands for matrix (conjugate) TRANSPOSE (in case of complex valued elements)

%correct the error here according the message
E=[1,2;3]