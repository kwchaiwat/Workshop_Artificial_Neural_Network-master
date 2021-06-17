close all;clear all;clc;
% รับข้อมูลเข้ามา
dataset = load('LoneMATLAB.txt');
order = dataset(:,1:1);
x = dataset(:,2:12);
xmax = max(x); %ค่าสูงสุด
xmin = min(x); %ค่าต่ำสุด
% normalize ปรับให้ data ตั้งแต่คอลัม 1-4 อยู่ในช่วง 0-1
% Xnorm = (x-xmin)./(xmax-xmin);
% T คือ target 0 1
T = dataset(:,13:end);
% sz คือ size ของ data ทั้งหมด เท่ากับ 554
sz = size(dataset,1);
% I คือ Random permutation สุ่มค่าจำนวน 554 เป็นการสลับค่าไปมาจนถึง 554
I = randperm(sz);
%แบ่ง data สำหรับ xTrain ตั้งแต่ 1-388
xTrain = x(I(1:388),:);
% แบ่ง data สำหรับ xTest ตั้งแต่ 389-554
xTest = x(I(389:end),:);
% แบ่ง data สำหรับ tTrain ตั้งแต่ 1-388
tTrain = T(I(1:388),:);
% แบ่ง data สำหรับ tTest ตั้งแต่ 389-554
tTest = T(I(389:end),:);

