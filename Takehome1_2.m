
input = [-1 -1;
        -1 1;
        1 -1;
        1 1];
% Desired output of XOR
output = [-1;1;1;-1];
% Initialize the bias
bias = [1 1 1 1];
% Learning coefficient
coeff = 0.1;
% Number of learning iterations
iterations = 10000;
% Calculate weights randomly using seed.
rand('state',sum(100*clock));
weights = [0.5;0.3;0.5;0.9;1.2;1.2;0.5;0.3;0.2;0.1;0.4];

for i = 1:iterations
   out = zeros(4,1);
   numIn = length (input(:,1));
   for j = 1:numIn
      % Hidden layer
      H1 = bias(1,1)*weights(1,1) + input(j,1)*weights(2,1) + input(j,2)*weights(4,1);

      % Send data through sigmoid function 1/1+e^-x
      % Note that sigma is a different m file 
      % that I created to run this operation
      x2(1) = 1./(1+exp(-H1));
      H2 = bias(1,2)*weights(6,1)+ input(j,1)*weights(3,1)+ input(j,2)*weights(5,1);
      x2(2) = 1./(1+exp(-H2));

      % Output layer
      H3 = bias(1,3)*weights(9,1) + x2(1)*weights(7,1) + x2(2)*weights(8,1);
      x2(3) = 1./(1+exp(-H3));
      
      H4 = bias(1,4)*weights(11,1)+ x2(3)*weights(10,1) ;
      out(j) = tanh(H4);
      % Adjust delta values of weights
      % For output layer:
      % delta(wi) = xi*delta,
      % delta = (1-actual output)*(desired output - actual output) 
      delta3_1 = (1-out(j))*(output(j)-out(j));
      
      % Propagate the delta backwards into hidden layers
      delta2_1 = x2(1)*(1-x2(1))*weights(7,1)*delta3_1;
      delta2_2 = x2(2)*(1-x2(2))*weights(8,1)*delta3_1;
      delta2_3 = x2(3)*(1-x2(3))*weights(10,1)*delta3_1;
      
      % Add weight changes to original weights 
      % And use the new weights to repeat process.
      % delta weight = coeff*x*delta
            % Bias cases
            weights(1,1) = weights(1,1) + coeff*bias(1,1)*delta2_1;
            weights(6,1) = weights(6,1) + coeff*bias(1,2)*delta2_2;
            weights(9,1) = weights(9,1) + coeff*bias(1,3)*delta2_3;
            weights(11,1) = weights(11,1) + coeff*bias(1,4)*delta3_1;
      
            weights(2,1) = weights(2,1) + coeff*input(j,1)*delta2_1;
            weights(3,1) = weights(3,1) + coeff*input(j,2)*delta2_2;
            weights(4,1) = weights(4,1) + coeff*input(j,1)*delta2_1;
            weights(5,1) = weights(5,1) + coeff*input(j,2)*delta2_2;
            weights(7,1) = weights(7,1) + coeff*x2(1)*delta2_3;
            weights(8,1) = weights(8,1) + coeff*x2(2)*delta2_3;
            weights(10,1) = weights(10,1) + coeff*x2(3)*delta3_1;
      
      
   end   
end
