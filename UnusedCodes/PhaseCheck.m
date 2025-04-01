clear all
close all
clc


cd ..
cd HM0NSAR2/
fort_control=load('fort.55554');
A_control=reshape(fort_control(:,2),319,191400/319);
hold on
plot(A_control(270,:))

cd ..
cd SL50N4/
fort=load('fort.55554');
A=reshape(fort(:,2),319,191400/319);
hold on
plot(A(270,:))