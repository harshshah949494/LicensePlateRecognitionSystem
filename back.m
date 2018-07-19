clear all;clc;trai_pairs=5;out_neurons=5;hid_neurons=03;in_nodes=04;
eata=0.3;emax=0.001;q=1;e=0;lamda=1;  t=1;
tic
%load feature.mat result
zzz=[1 3 8 1;4 6 3 2; 5 3 5 3;1 6 8 7; 5 7 3 8];
tt=max(max(zzz));Z=zzz/tt;
d1=[1 -1 -1 -1 -1 ];
d2=[-1 1 -1 -1 -1];
d3=[-1 -1 1 -1 -1 ];
d4=[-1 -1 -1 1 -1 ];
d5=[-1 -1 -1 -1 1 ];
% d6=[-1 -1 -1 -1 -1 1 -1 -1 -1 -1 ];
% d7=[-1 -1 -1 -1 -1 -1 1 -1 -1 -1 ];
% d8=[-1 -1 -1 -1 -1 -1 -1 1 -1 -1 ];
% d9=[-1 -1 -1 -1 -1 -1 -1 -1 1 -1 ];
% d10=[-1 -1 -1 -1 -1 -1 -1 -1 -1 1 ];
% d11=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
% d12=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1];
% d13=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1];
% d14=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1];
% d15=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1];
% d16=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1];
% d17=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1];
% d18=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1];
% d19=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1];
% d20=[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1];
 Dm=[d1;d2;d3;d4;d5];
% ;d11;d12;d13;d14;d15;d16;d17;d18;d19;d20];
D=Dm;

%step 1 initialisation of weight matrices

W=randn(out_neurons,hid_neurons);
V=randn(hid_neurons,in_nodes);
for main_loop=1:30000

% step 2 training step starts here compute layer responses

for p=1:trai_pairs
    z=transpose(Z(p,:));
    
  d=transpose(D(p,:));

   %calculate output of hidden and output layer

   y=(tansig(V*(z)));
   o=(tansig(W*(y))); 

% step 3 Error value is computed

        e=0.5*norm(d-o)^2+e;

% step 4 error signal vectors of both layers are computed
                 
                 % error signal vector for output layer
              
                 for k=1:out_neurons
                       delta_ok(k,:)=0.5*(d(k)-o(k))*(1-o(k)^2);
          end

                 %error signal vector for hidden layer

                 for j=1:hid_neurons
                        sum=0;
                 for k=1:out_neurons
                 sum=sum+delta_ok(k)*W(k,j);
                 end
                 delta_yj(j,:)=0.5*(1-y(j)^2)*sum;
          end

% step 5 Adjust weights of output and hidden layer

     W=W+eata*delta_ok*transpose(y);
     V=V+eata*delta_yj*transpose(z);
     q=q+1;                           % update step counter
 end

% step 6 training cycle is completed

fprintf('error=%f no of epcohes = %d \n',e,main_loop);
            if e>=emax
               e=0;
            else
               save backp20_2.mat W V Z;
                   break;
            end
                  
end 
save backp.mat W V Z;
toc