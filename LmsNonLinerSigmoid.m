clc;close all;
N = 100;
x = linspace(0,1,N)';
t = x.^2 + unifrnd(-0.1,0.1,N,1);

w = rands(2,1);
n = 0.05;
E = [];

for i = 500
    
    y = logsig( [ones(N,1) x] * w );
    e = t-y;
    w = w + n * ((e.*(y.*(1-y)))' * [ones(N,1) x] )';
    
    E(i) = mse(e);
    
    subplot(2,1,1)
    plot(x,t,'.b',x , logsig( [ones(N,1) x] * w ) ,'r');
    title('Actual vs. Prediction');
    xlabel('x'); ylabel('y'); legend('Actual','Predicted');
    
    subplot(2,1,2)
    plot(E);title('Error vs. Iteration');
    xlabel('Iteration (n) '); ylabel('MSE');
    
    drawnow
end