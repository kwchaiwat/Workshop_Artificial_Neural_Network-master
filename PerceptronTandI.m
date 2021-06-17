clear; clc;

x = [ 1,1, 1, 1,-1,1,-1,-1, 1,-1;  % T Normal
      1,-1,-1, 1, 1,1, 1,-1,-1, 1;  % T Right
      1,-1, 1,-1,-1,1,-1, 1, 1, 1;  % T Left
      1,1,-1,-1, 1,1, 1, 1,-1,-1;  % T UpSidedown
      1,1, 1, 1,-1,1,-1, 1, 1, 1;  % I Vertical
      1,1,-1, 1, 1,1, 1, 1,-1, 1]; % I Horizontal

w = [0;
     0;
     0;
     0;
     0;
     0;
     0;
     0;
     0;
     0];

t = [1,1,1,1,-1,-1];
u = x

if u >0
    y=1;
else
    y=0;
end
    


for i = 1:size(x, 1)
    for j = 1:size(w, 1)
        
        %หาค่า output value
        if u >0
            y=1;
        else
            y=0;
        end
        
        
        w(j) = w(j) + x(i,j) * y(i);
    end
end
w