clear all;clc;trai_pairs=36;out_neurons=36;hid_neurons=17;in_nodes=6400;
eata=0.1;emax=0.1;q=1;e=0;lamda=1;  t=1;
tic
load backp.mat W V Z 

% step 2 training step starts here compute layer responses

for p=1:trai_pairs
    p
    z=transpose(Z(p,:));
    

   %calculate output of hidden and output layer

   y=(tansig(V*(z)));
   o=(tansig(W*(y)));
[t tt]= max(o)
pause
end