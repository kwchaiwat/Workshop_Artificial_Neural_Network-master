clear;clc;
w = [0; 0; 0;]
x = [1 1 1;
     1 1 -1;
     1 -1 1;
     1 -1 -1];
 a=0;
 n=1;
 d = [1;1;1;-1];
 
 for t = 1:2
     for i = 1:size(x, 1)
         u = x(i, :)*w ;
         
         if u > a
             y = 1;
         else
             y = -1;
         end
         
        w(1) = w(1) + n*(d(i) - y ) * x(i,1);
        w(2) = w(2) + n*(d(i) - y ) * x(i,2);
        w(3) = w(3) + n*(d(i) - y ) * x(i,3);
        
     end
 end
 
 plot(x(:, 2), x(:, 3), 'o')
 [X1,X2] = meshgrid(-1.5:.5:1.5);
 Y = w(1) + X1*w(2) + X2*w(3)
 hold on
 contour(X1, X2, Y, [0 0], 'k')
 drawnow;
 hold off
 pause(0.5);

 
 