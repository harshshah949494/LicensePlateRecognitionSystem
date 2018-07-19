clc;
clear all;
close all;
b=imread('ARAIL.jpg');

b1=rgb2gray(b);
[r,c]=size(b1);
b2=zeros(r,c);
for i=1:1:r 
    for j=1:1:c
        if b1(i,j)>=50
            b2(i,j)=255;
       else
            b2(1,j)=0;
          
      end
    end
end
subplot(4,4,1), imshow(b2);
        
 p=1;
y = zeros(1,1);           
            
[r,c]=size(b2);
for i=3:c-3
    for j=3:r-3
        if b2(j,i)==0
            y(1,p)=i;
            p=p+1;
        break;
        end
    end
end

[r1,c1]=size(y);
   z(1,1)=y(1,1);  k=1;
        for i=2:c1-1
            if (y(1,i+1)-y(1,i))>1
                y(1,i+1);
                y(1,i);                
                k=k+1;
                z(1,k)=y(i+1);
                                        
            end
        end
        
        [a b]=size(z);
        t=1;
        for i=2:b
            for j=1:c1
                if z(1,i)==y(1,j)
                    kk(1,t)=y(1,j-1);
                    t=t+1;
                    break
                end
            end
        end
        
        kk=[kk y(1,c1)];
        [s1 s2]=size(kk);
        for i=1:s2
            x=b2(:,z(1,i):kk(1,i));
            subplot(4,4,i+1), imshow(x);
               end
          
