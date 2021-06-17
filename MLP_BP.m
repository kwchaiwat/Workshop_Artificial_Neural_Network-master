%Chaiwat Kaewmukdasawan 593020413-8 sec1
close all;clear all;clc;
dataset = load('iris.txt');
x = dataset(:,1:4);
xmax = max(x);
xmin = min(x);
Xnorm = (x-xmin)./(xmax-xmin);
T = dataset(:,5:end);
sz = size(dataset,1);
I = randperm(sz);
xTrain = Xnorm(I(1:100),:);
xTest = Xnorm(I(101:end),:);
tTrain = T(I(1:100),:);
tTest = T(I(101:end),:);
clear X T

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear X T
%Model MLP-BP Learning : 1 hidden layer
tic;
 n = 0.01;
 L = 50; %Hidden node
 wi = rands(size(xTrain,2),L);
 bi = rands(1,L);
 wo = rands(L,size(tTrain,2));
 bo = rands(1,size(tTrain,2));
 E = [];
 for k = 1:500
     for i = 1:size(xTrain,1)
         H = logsig(xTrain(i,:)*wi + bi);
         Y = logsig(H*wo + bo);
         
         e = tTrain(i,:) - Y;
         
         dy = e .* Y .* (1-Y);
         dH = H .* (1-H) .* (dy*wo');
         
         wo = wo + n * H'*dy;
         bo = bo + n * dy;
         wi = wi + n * xTrain(i,:)'*dH;
         bi = bi + n * dH;
     end
     H = logsig(xTrain*wi + repmat(bi,size(xTrain,1),1));
     Y = logsig(H*wo + repmat(bo,size(xTrain,1),1));
     E(k) = mse(tTrain - Y);
     plot(E); title('MLP-BP');
     xlabel('Iteration (n) '); ylabel('MSE');
     
     drawnow;
 end
 error_of_MLP_BP = E(10)
 %Train Pedic
 H = logsig(xTrain*wi + repmat(bi,size(xTrain,1),1));
 Y = logsig(H*wo + repmat(bo,size(xTrain,1),1));

 %Performance of Traning
 [tmp,Index1] = max(Y,[],2);
 [tmp,Index2] = max(tTrain,[],2);
 fprintf('Training acc.: %f \n',mean(mean(Index1 == Index2))*100);
 
 %Testing  Pedic
 H = logsig(xTest*wi + repmat(bi,size(xTest,1),1));
 Y = logsig(H*wo + repmat(bo,size(xTest,1),1));
 
 % Performance of Testing
 [tmp,Index1] = max(Y,[],2);
 [tmp,Index2] = max(tTest,[],2);
 fprintf('Testing acc.: %f \n',mean(mean(Index1 == Index2))*100);
toc;