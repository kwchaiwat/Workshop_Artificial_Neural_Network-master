clear all;close all;clc;
x = [-1 -1; %X1
     -1 1;  %X2
     1 -1;  %X3
     1 1;]; %X4
t = [-1;-1;-1;1;];     %for AND Gate function
w0 = 0.3; w1 = 0.1; w2 = 0.6; 
mxX = max(x)+0.5;
mnX = min(x)-0.5;
[X,Y] = meshgrid(mnX(1):.2:mxX(1),mnX(2):.2:mxX(2));
W=[w0;w1;w2];
Z = [ones(numel(X),1) X(:) Y(:)]*W;
Z = reshape(Z,size(X));
eta_n = 0.5;

err = [];
i=1; maxEpoch = 1;
for i=1 : maxEpoch;
    fprintf('\n Round %d =================\n',i);
    %comput outputs
    u1 = w0*1 + w1*x(1,1)+ w2*x(1,2);
    u2 = w0*1 + w1*x(2,1)+ w2*x(2,2);
    u3 = w0*1 + w1*x(3,1)+ w2*x(3,2);
    u4 = w0*1 + w1*x(4,1)+ w2*x(4,2);

    % add activation function: cos(u)
    y1=cos(u1); % f(x) = cos(x)
    y2=cos(u2);
    y3=cos(u3);
    y4=cos(u4);
  
    e1 = t(1)-y1 ;% e = d-y
    e2 = t(2)-y2;
    e3 = t(3)-y3;
    e4 = t(4)-y4;
   
    MSE = (e1*e1+e2*e2+e3*e3+e4*e4)/4.0;
    
    delta_w0 = -sin(u1)*e1*1 + (-sin(u2))*e2*1 + -sin(u3)*e3*1 + (-sin(u4))*e4*1 ;
    delta_w1 = -sin(u1)*e1*x(1,1) + (-sin(u2))*e2*x(2,1) + (-sin(u3))*e3*x(3,1) + (-sin(u4))*e4*x(4,1);
    delta_w2 = -sin(u1)*e1*x(1,2) + (-sin(u2))*e2*x(2,2) + (-sin(u3))*e3*x(3,2) + (-sin(u4))*e4*x(4,2);
   
    w0 = w0 + eta_n*delta_w0 ;
    w1 = w1 + eta_n*delta_w1 ;
    w2 = w2 + eta_n*delta_w2 ;
   
    %end of each epoch
    W=[w0;w1;w2];
    Z = [ones(numel(X),1) X(:) Y(:)]*W;
    Z = (reshape(Z,size(X)));
end
W