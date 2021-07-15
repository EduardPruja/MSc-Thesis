% this function implements the optimization program
% and solves it for a given set of paramteres 

% input: parameters changing
% outputs: x_opt, y_opt , fval

function [ x_opt, y_opt,e_opt]=optimize_final(gamma,beta,a,m,tau,C,d) 


% set values of constants

t=1; % value of t(v) - constant 
i_m=0.4;  % value of i - constant 


N=100;  % value of N - constant 
I=35;  % value of I - constant 


% define cx and cy

c_x= beta*t + beta*a + m/C + gamma*d*i_m/C;
c_y= @(y) beta*t + m + gamma*d*i_m + tau*y/N;

% lower bound 
lb = [0,0];
% upper bound
ub = [N,N]; 

% environmental constraint (Ax <= b )
A =  [i_m/C, i_m];
b = I;

Aeq=[1,1];
beq=N;

% initial guess
x0=[N/2,N/2];

% function to optimize

cost = @(z) c_x*z(1) + c_y(z(2))*(z(2));



[z_opt,fval] = fmincon(cost,x0,A,b,Aeq,beq,lb,ub);
x_opt=z_opt(1)/N;
y_opt=z_opt(2)/N;
e_opt=((x_opt/C) * i_m + y_opt * i_m);
end