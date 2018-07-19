clear all;
clc;
f=imread('tnr1.jpg'); % Training:tnr1,A1,S1,SS1,ariale
I=imresize(f,[1000 NaN]);

figure(1),imshow(I);
%Igray = rgb2gray(I); 
%figure(2),imshow(Igray);

Ibw = im2bw(I,graythresh(I));
%figure(3),imshow(Ibw);

Iedge = edge(uint8(Ibw)); 
%figure(4),imshow(Iedge);

%se = strel('square',2);

%se=strel('disk',1); 
se=ones(3,3);



Iedge2 = imdilate(Iedge, se); 
%figure(5),imshow(Iedge2);  

Ifill= imfill(Iedge2,'holes'); 
%figure(6),imshow(Ifill);

%Ifill=imerode(ge,strel('line',3,0));

%im1=imresize(f,[400 NaN]);
%figure (1),imshow(im1);
%[r c ]=size(im1);
%r
%c
%k
%imagen=im1;
%im1 = bwareaopen(im1,1);
%[r c k]=size(im1);
%r
%c
%k
%imagen=reshape(im1,[r c*k]);
%[r c k ]=size(imagen);
%r
%c
%k
pause(1)
figure (7)
imshow(Ifill);
title('INPUT IMAGE WITHOUT NOISE')
%% Label connected components
[L Ne]=bwlabel(Ifill);
disp(Ne);
%propied=regionprops(L,'BoundingBox');
CC = bwconncomp(Ifill);
propied = regionprops(CC,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off

p=1;
pause (1)
figure
 for n=1:Ne
  [r,c] = find(L==n);
  n1=Ifill(min(r):max(r),min(c):max(c));
  [x,y]=size(n1);
  
   final=imresize(n1,[40 40]);
     imshow(final);
     l=1;
     for i=1:40
         for j=1:40
          k(p,l)=final(i,j);
          l=l+1;
         end
     end
     p=p+1;
     pause(0.5)
 end
%save trainingdata.mat k
%-------------------------------------------------------------------------
f=imread('S1.jpg'); % Training:tnr1,A1,S1,SS1,ariale
I=imresize(f,[500 NaN]);

figure(1),imshow(I);
%Igray = rgb2gray(I); 
%figure(2),imshow(Igray);

Ibw = im2bw(I,graythresh(I));
%figure(3),imshow(Ibw);

Iedge = edge(uint8(Ibw)); 
%figure(4),imshow(Iedge);

%se = strel('square',2);

se=strel('disk',1); 
%se=ones(3,3);



Iedge2 = imdilate(Iedge, se); 
%figure(5),imshow(Iedge2);  

Ifill= imfill(Iedge2,'holes'); 
%figure(6),imshow(Ifill);

%Ifill=imerode(ge,strel('line',3,0));

%im1=imresize(f,[400 NaN]);
%figure (1),imshow(im1);
%[r c ]=size(im1);
%r
%c
%k
%imagen=im1;
%im1 = bwareaopen(im1,1);
%[r c k]=size(im1);
%r
%c
%k
%imagen=reshape(im1,[r c*k]);
%[r c k ]=size(imagen);
%r
%c
%k
pause(1)
figure (7)
imshow(Ifill);
title('INPUT IMAGE WITHOUT NOISE')
%% Label connected components
[L Ne]=bwlabel(Ifill);
disp(Ne);
%propied=regionprops(L,'BoundingBox');
CC = bwconncomp(Ifill);
propied = regionprops(CC,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off

p=37;
pause (1)
figure
 for n=1:Ne
  [r,c] = find(L==n);
  n1=Ifill(min(r):max(r),min(c):max(c));
  [x,y]=size(n1);
  
   final=imresize(n1,[40 40]);
     imshow(final);
     l=1;
     for i=1:40
         for j=1:40
          k(p,l)=final(i,j);
          l=l+1;
         end
     end
     p=p+1;
     pause(0.5)
 end
%save trainingdata.mat k
%---------------------------------------------------------
f=imread('SS1.jpg'); % Training:tnr1,A1,S1,SS1,ariale
I=imresize(f,[500 NaN]);

figure(1),imshow(I);
%Igray = rgb2gray(I); 
%figure(2),imshow(Igray);

Ibw = im2bw(I,graythresh(I));
%figure(3),imshow(Ibw);

Iedge = edge(uint8(Ibw)); 
%figure(4),imshow(Iedge);

%se = strel('square',2);

se=strel('disk',1); 
%se=ones(3,3);



Iedge2 = imdilate(Iedge, se); 
%figure(5),imshow(Iedge2);  

Ifill= imfill(Iedge2,'holes'); 
%figure(6),imshow(Ifill);

%Ifill=imerode(ge,strel('line',3,0));

%im1=imresize(f,[400 NaN]);
%figure (1),imshow(im1);
%[r c ]=size(im1);
%r
%c
%k
%imagen=im1;
%im1 = bwareaopen(im1,1);
%[r c k]=size(im1);
%r
%c
%k
%imagen=reshape(im1,[r c*k]);
%[r c k ]=size(imagen);
%r
%c
%k
pause(1)
figure (7)
imshow(Ifill);
title('INPUT IMAGE WITHOUT NOISE')
%% Label connected components
[L Ne]=bwlabel(Ifill);
disp(Ne);
%propied=regionprops(L,'BoundingBox');
CC = bwconncomp(Ifill);
propied = regionprops(CC,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off

p=73;
pause (1)
figure
 for n=1:Ne
  [r,c] = find(L==n);
  n1=Ifill(min(r):max(r),min(c):max(c));
  [x,y]=size(n1);
  
   final=imresize(n1,[40 40]);
     imshow(final);
     l=1;
     for i=1:40
         for j=1:40
          k(p,l)=final(i,j);
          l=l+1;
         end
     end
     p=p+1;
     pause(0.5)
 end
%save trainingdata.mat k
%-----------------------------------------------------------
f=imread('A1.jpg'); % Training:tnr1,A1,S1,SS1,ariale
I=imresize(f,[500 NaN]);

figure(1),imshow(I);
%Igray = rgb2gray(I); 
%figure(2),imshow(Igray);

Ibw = im2bw(I,graythresh(I));
%figure(3),imshow(Ibw);

Iedge = edge(uint8(Ibw)); 
%figure(4),imshow(Iedge);

%se = strel('square',2);

se=strel('disk',1); 
%se=ones(3,3);



Iedge2 = imdilate(Iedge, se); 
%figure(5),imshow(Iedge2);  

Ifill= imfill(Iedge2,'holes'); 
%figure(6),imshow(Ifill);

%Ifill=imerode(ge,strel('line',3,0));

%im1=imresize(f,[400 NaN]);
%figure (1),imshow(im1);
%[r c ]=size(im1);
%r
%c
%k
%imagen=im1;
%im1 = bwareaopen(im1,1);
%[r c k]=size(im1);
%r
%c
%k
%imagen=reshape(im1,[r c*k]);
%[r c k ]=size(imagen);
%r
%c
%k
pause(1)
figure (7)
imshow(Ifill);
title('INPUT IMAGE WITHOUT NOISE')
%% Label connected components
[L Ne]=bwlabel(Ifill);
disp(Ne);
%propied=regionprops(L,'BoundingBox');
CC = bwconncomp(Ifill);
propied = regionprops(CC,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off

p=109;
pause (1)
figure
 for n=1:Ne
  [r,c] = find(L==n);
  n1=Ifill(min(r):max(r),min(c):max(c));
  [x,y]=size(n1);
  
   final=imresize(n1,[40 40]);
     imshow(final);
     l=1;
     for i=1:40
         for j=1:40
          k(p,l)=final(i,j);
          l=l+1;
         end
     end
     p=p+1;
     pause(0.5)
 end
save trainingdata.mat k
[r c]=size(k)