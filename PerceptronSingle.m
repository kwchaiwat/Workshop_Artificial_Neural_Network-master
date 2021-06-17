close all;clear all;clc;
N = 150;
x = [ones(N,1) rand(N,1) -rand(N,1); ones(N,1) -rand(N,1) rand(N,1)];
d = [ones(N,1); -ones(N,1)];
%d = [-1;1;1;1];
w = rand(3,1);
n = 0.05; % learning rate
a = 0; % Threshold value
for T = 1:10
    for i = 1:size(x,1)
        u = x(i,:)*w; 
        
        if u > a
            y = 1;
        else
            y = -1;
        end
        w(1,1) = w(1,1)+ (n*(d(i) - y ) * x(i,1));
        w(2,1) = w(2,1)+ (n*(d(i) - y ) * x(i,2));
        w(3,1) = w(3,1)+ (n*(d(i) - y ) * x(i,3));
         %plot
         [X1,X2] = meshgrid(-1.5:1.5); 
         Y = w(1) + X1*w(2) + X2*w(3);
         plot(x(1:N,2),x(1:N,3),'ro')
         hold on
         plot(x(N+1:end,2),x(N+1:end,3),'bo')
         contour(X1,X2,Y,[0,0],'k')
         title(['T : ',num2str(T),', i :',num2str(i)])
         
         drawnow;
         hold off
         pause(0.05);
    end
end
