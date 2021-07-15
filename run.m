
close all
clear all

% values of parameters if they are not chosen to vary
gamma=exp(-0.03*50);
beta=exp(-0.07);
m=0.5;
a=0.7;
tau=0.24;
d=1;
% set values of constants

t=1; % value of t(v) - constant 
 % value of delta - constant 
i_m=0.4;  % value of i - constant 


N=100;  % value of N - constant 
I=35;  % value of I - constant 



%% FIGURE 1

% choose number of values to try
k=100;
% choose minimum value 
mn=0;
% choose maximum value
mx=1;
% make vector with values
values=linspace(mn,mx,k);

% create vectors to store results
x_opts=zeros(1,k);
y_opts=zeros(1,k);
e_opts=zeros(1,k);



% C=2
for j=1:k
% choose parameter to change (e.g. beta)
tau=values(j);
C=2;
% find optimal values and store
[x,y,en]=optimize_final(gamma,beta,a,m,tau,C,d);
x_opts(j)=x;
y_opts(j)=y;    
e_opts(j)=en;
end


figure(1)
plot(values,x_opts,'b-','LineWidth',2);
hold on
plot(values,y_opts,'r-','LineWidth',2);
hold on
plot(values,e_opts,'g-','LineWidth',2);
legend('Fraction of carpoolers','Fraction of solo drivers','Environmental Impact');
xlabel('\tau')
ylim([0,1])
title('Fraction of Carpoolers varying \tau')


print(gcf,'fig1.png','-dpng','-r500');


%% FIGURE 2

% choose number of values to try
k=100;
% choose minimum value 
mn=0;
% choose maximum value
mx=1;
% make vector with values
values=linspace(mn,mx,k);

% create vectors to store results
x_opts2=zeros(1,k);
y_opts2=zeros(1,k);
e_opts2=zeros(1,k);

x_opts3=zeros(1,k);
y_opts3=zeros(1,k);
e_opts3=zeros(1,k);

x_opts4=zeros(1,k);
y_opts4=zeros(1,k);
e_opts4=zeros(1,k);

x_opts5=zeros(1,k);
y_opts5=zeros(1,k);
e_opts5=zeros(1,k);





% C=2
for j=1:k
% choose parameter to change (e.g. beta)
tau=values(j);
C=2;
% find optimal values and store
[x,y,en]=optimize_final(gamma,beta,a,m,tau,C,d);
x_opts2(j)=x;
y_opts2(j)=y;    
e_opts2(j)=en;

C=3;
% find optimal values and store
[x,y,en]=optimize_final(gamma,beta,a,m,tau,C,d);
x_opts3(j)=x;
y_opts3(j)=y;    
e_opts3(j)=en;


C=4;
% find optimal values and store
[x,y,en]=optimize_final(gamma,beta,a,m,tau,C,d);
x_opts4(j)=x;
y_opts4(j)=y;    
e_opts4(j)=en;


C=5;
% find optimal values and store
[x,y,en]=optimize_final(gamma,beta,a,m,tau,C,d);
x_opts5(j)=x;
y_opts5(j)=y;    
e_opts5(j)=en;
end


figure(2)
t = tiledlayout(2,2);
nexttile
plot(values,x_opts2,'b-','LineWidth',2);
hold on
plot(values,y_opts2,'r-','LineWidth',2);
hold on
plot(values,e_opts2,'g-','LineWidth',2);
legend('Fraction of carpoolers','Fraction of solo drivers','Environmental Impact');
xlabel('\tau')
ylim([0,1])
title('Occupancy level = 2')


nexttile
plot(values,x_opts3,'b-','LineWidth',2);
hold on
plot(values,y_opts3,'r-','LineWidth',2);
hold on
plot(values,e_opts3,'g-','LineWidth',2);
legend('Fraction of carpoolers','Fraction of solo drivers','Environmental Impact');
xlabel('\tau')
ylim([0,1])
title('Occupancy level = 3')


nexttile
plot(values,x_opts4,'b-','LineWidth',2);
hold on
plot(values,y_opts4,'r-','LineWidth',2);
hold on
plot(values,e_opts4,'g-','LineWidth',2);
legend('Fraction of carpoolers','Fraction of solo drivers','Environmental Impact');
xlabel('\tau')
ylim([0,1])
title('Occupancy level = 4')


nexttile
plot(values,x_opts5,'b-','LineWidth',2);
hold on
plot(values,y_opts5,'r-','LineWidth',2);
hold on
plot(values,e_opts5,'g-','LineWidth',2);
legend('Fraction of carpoolers','Fraction of solo drivers','Environmental Impact');
xlabel('\tau')
ylim([0,1])
title('Occupancy level = 5')





print(gcf,'fig2.png','-dpng','-r1000');


%% FIGURE 3
close all
% choose number of values to try
k=100;
% choose minimum value 
mn=0;
% choose maximum value
mx=1;
% make vector with values
values=linspace(mn,mx,k);

% create vectors to store results
x_opts2=zeros(1,k);
y_opts2=zeros(1,k);
e_opts2=zeros(1,k);

x_opts3=zeros(1,k);
y_opts3=zeros(1,k);
e_opts3=zeros(1,k);


x_opts4=zeros(1,k);
y_opts4=zeros(1,k);
e_opts4=zeros(1,k);



C=2;
for j=1:k
% choose parameter to change (e.g. beta)
tau=values(j);
d=1;
% find optimal values and store
[x,y,en]=optimize_final(gamma,beta,a,m,tau,C,d);
x_opts2(j)=x;
y_opts2(j)=y;    
e_opts2(j)=en;

d=(0.8);
% find optimal values and store
[x,y,en]=optimize_final(gamma,beta,a,m,tau,C,d);
x_opts3(j)=x;
y_opts3(j)=y;    
e_opts3(j)=en;



d=(0.1);
% find optimal values and store
[x,y,en]=optimize_final(gamma,beta,a,m,tau,C,d);
x_opts4(j)=x;
y_opts4(j)=y;    
e_opts4(j)=en;


end


figure(3)
plot(values,x_opts2,'b-','LineWidth',2);
hold on
plot(values,e_opts2,'g-','LineWidth',2);
hold on
plot(values,x_opts3,'b--','LineWidth',2);
hold on
plot(values,e_opts3,'g--','LineWidth',2);
hold on 
plot(values,x_opts4,'b.','LineWidth',2);
hold on
plot(values,e_opts4,'g.','LineWidth',2);
hold on 



legend('Fraction of carpoolers, \delta_1','Environmental Impact,\delta_1','Fraction of carpoolers, \delta_2','Environmental Impact,\delta_2','Fraction of carpoolers, \delta_3','Environmental Impact,\delta_3');
xlabel('\tau')
ylim([0,1])
title('Fraction of carpoolers for different \delta')

print(gcf,'fig3.png','-dpng','-r1000');



%% figure 4


close all
clear all

% values of parameters if they are not chosen to vary
gamma=exp(-0.03*50);
beta=exp(-0.07);
m=0.5;
a=0.7;
tau=0.24;
d=1;
C=2;
% set values of constants

t=1; % value of t(v) - constant 
 % value of delta - constant 
i_m=0.4;  % value of i - constant 


N=100;  % value of N - constant 
I=35;  % value of I - constant 



% choose to vary tau

k=20;
% choose minimum value of 1st parameter
mn1=0;
% choose maximum value
mx1=1;
% make vector with values
values1=linspace(mn1,mx1,k);



% choose to vary beta

% choose minimum value of 2ndparameter
mn2=0.5;
% choose maximum value
mx2=1;
% make vector with values
values2=linspace(mn2,mx2,k);



% choose minimum value of 3rdparameter
mn3=0.1;
% choose maximum value
mx3=0.6;
% make vector with values
values3=linspace(mn3,mx3,k);


% create matrices to store results
x_opts1=zeros(k,k);
x_opts2=zeros(k,k);



for j=1:k
    % choose 1st parameter to change
    tau=values1(j);
    
    for l=1:k
    % choose 2nd parameter to change
    beta=values2(l);
    % find optimal values and store
    [x,y,f]=optimize_final(gamma,beta,a,m,tau,C,d);
    x_opts1(l,j)=x;
      gamma=values3(l);
    [x,y,f]=optimize_final(gamma,beta,a,m,tau,C,d);
       x_opts2(l,j)=x;
    
    end

end

% Plot results as a Heatmap (fraction of carpoolers)
figure(4)

T = tiledlayout(1,2);
nexttile
heatmap(x_opts1)
colormap parula
xlabel('\tau');
ylabel('\beta');
title('Fraction of carpoolers varyin \tau and \beta')
grid off

nexttile

heatmap(x_opts2)
colormap parula
xlabel('\tau');
ylabel('\gamma');
title('Fraction of carpoolers varyin \tau and \gamma')
grid off


%% figure 5


close all
clear all

% values of parameters if they are not chosen to vary
gamma=exp(-0.03*50);
beta=exp(-0.07);
m=0.5;
a=0.7;
tau=0.24;
d=1;
C=2;
% set values of constants

t=1; % value of t(v) - constant 
 % value of delta - constant 
i_m=0.4;  % value of i - constant 


N=100;  % value of N - constant 
I=35;  % value of I - constant 



% choose to vary tau

k=20;
% choose minimum value of 1st parameter
mn1=0;
% choose maximum value
mx1=1;
% make vector with values
values1=linspace(mn1,mx1,k);



% choose to vary a

% choose minimum value of 2ndparameter
mn2=0.4;
% choose maximum value
mx2=0.9;
% make vector with values
values2=linspace(mn2,mx2,k);




% choose to vary m

mn3=0.2;
% choose maximum value
mx3=0.7;
% make vector with values
values3=linspace(mn3,mx3,k);


% create matrices to store results
x_opts1=zeros(k,k);
x_opts2=zeros(k,k);



for j=1:k
    % choose 1st parameter to change
    tau=values1(j);
    
    for l=1:k
    % choose 2nd parameter to change
    a=values2(l);
    % find optimal values and store
    [x,y,f]=optimize_final(gamma,beta,a,m,tau,C,d);
    x_opts1(l,j)=x;
      m=values3(l);
    [x,y,f]=optimize_final(gamma,beta,a,m,tau,C,d);
       x_opts2(l,j)=x;
    
    end

end

% Plot results as a Heatmap (fraction of carpoolers)
figure(5)

T = tiledlayout(1,2);
nexttile
heatmap(x_opts1)
colormap parula
xlabel('\tau');
ylabel('a');
title('Fraction of carpoolers varying \tau and a')
grid off

nexttile

heatmap(x_opts2)
colormap parula
xlabel('\tau');
ylabel('m');
title('Fraction of carpoolers varying \tau and m')
grid off