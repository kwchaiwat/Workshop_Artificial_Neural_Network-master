clear;clc;
x = [ 1  1  1;
      1  1 -1;
      1 -1  1;
      1 -1 -1;];
 
w = [0;0;0];

t = [1;
     1;
     1;
    -1];

for i = 1:size(x, 1)
    y = t;
    for j = 1:size(w, 1)
        w(j) = w(j) + x(i,j) * y(i);
    end
end
w