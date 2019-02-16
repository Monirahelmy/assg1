clc
clear all
clear all
data=xlsread('D:\GUC\Machine Learning\assign1\house_prices_data_training_data.csv');
size(data);
Alpha=.01;

m=length(data(:,1));
m60=ceil(m*0.6);
m20=ceil(m*0.2);




U1=data(1:m60, 12:13 );
U2=data(1:m60,4:5);
U3=data(1:m60, 8);
U= U1.^2 


X=[ones(m60,1) U1 U1.^2];

n=length(X(1,:));
for w=2:n
    if max(abs(X(:,w)))~=0
    X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
    end
end
Y=data(1:m60,3)/mean(data(1:m60,3));
Theta=zeros(n,1);
k=1;
E(k)=(1/(2*m60))*sum((X*Theta-Y).^2);
R=1; 

% 60%
while R==1
Alpha=Alpha*1;
Theta=Theta-(Alpha/m60)*X'*(X*Theta-Y);
k=k+1
E(k)=(1/(2*m60))*sum((X*Theta-Y).^2);
if E(k-1)-E(k)<0
    break
end 
q=(E(k-1)-E(k))./E(k-1);
if q <.001;
    R=0;
end
end
plot(E)

% 20%
U1_20=data(m60+1:m60+m20,8);

U2_20=data(m60+1:m60+m20,4:19);
U3_20=data(m60+1:m60+m20,20:21);

X_20=[ones(m20,1) U1_20  U1_20 .^ 2 ];

Theta_20=Theta;
Y_20=data(m60+1:m60+m20,3)/mean(data(m60+1:m60+m20,3));
n_20=length(X_20(1,:));

for w=2:n_20
    if max(abs(X_20(:,w)))~=0
    X_20(:,w)=(X_20(:,w)-mean((X_20(:,w))))./std(X_20(:,w));
    end
end
k_20=1;
E_20(k_20)=(1/(2*m20))*sum((X_20*Theta1-Y_20).^2);



%20%
m40=m60+m20+1;
p40=m-(m60+m20);
u1_40=data(m40:end,4);
u2_40=data(m40:end,5:19);
u3_40=data(m40:end,20:21);


x_40=[ones(p40,1) u1_40 u1_40.^2];

Theta_40=Theta_20;
y_40=data{m40:end,3}/mean(data{m40:end,3});
n_40=length(x_40(1,:));
for w40=2:n_40
    if max(abs(x_40(:,w40)))~=0
    x_40(:,w40)=(x_40(:,w40)-mean((x_40(:,w40))))./std(x_40(:,w40));
    end
end
k_40=1;
E_40(k_40)=(1/(2*m20))*sum((x_40*Theta_40-y_40).^2);


plot(E)