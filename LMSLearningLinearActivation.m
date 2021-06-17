clc;close all;
N = 50;
x = linspace(0,12,N)';
t = x + rands(N,1);

w = rands(2,1);
n = 0.0001;
E = [];

for i = 1:50
    y = [ones(N,1) x] * w;
    e = t-y;
    w = w + n * (e' * [ones(N,1) x] )';
    
    E(i) = mse(e);
    
    subplot(2,1,1)
    plot(x,t,'.b',x,[ones(N,1) x] * w ,'r')
    title('Actual vs. Perdiction');
    xlabel('x'); ylabel('y'); legend('Actual','Perdiction');
    
    subplot(2,1,2)
    plot(E); title('Error vs. Iteration');
    xlabel('Iteration (n)'); ylabel('MSE');
    
    drawnow
    pause(0.1)
end