clear all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%01%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=imread('SS1.jpg'); % Training:tnr1,A1,S1,SS1,ariale
I=imresize(f,[500 NaN]);
%%%%%%A1 Accepted--->60 holes size
%%%%%%ariale Accepted ---->60 holes size
%%%%%%tnr1 Accepted ---->40 holes size
%%%%%%S1 Accepted ---->20 holes size
%%%%%%SS1 Accepted ---->60 holes size

%figure(1),imshow(I);
Igray = rgb2gray(I); 
%figure(2),imshow(Igray);

 Ibw = im2bw(I,graythresh(I));
%figure(3),imshow(Ibw);

 Iedge = edge(uint8(Ibw)); 
%figure(4),imshow(Iedge);
 
se = strel('square',2);
% 
% se=strel('disk',1); 
% %se=ones(3,3);
% 
% 
% 
 Iedge2 = imdilate(Iedge, se); 
%figure(5),imshow(Iedge2);  
% 
 Ifill= imfill(Iedge2,'holes'); 
%figure(6),imshow(Ifill);
Ifill = imdilate(Ifill, se);
%figure(7),imshow(Ifill);






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%changes

holes = Ifill & ~Iedge2;
%figure(17),imshow(holes)
%title('Hole pixels identified')
bigholes = bwareaopen(holes, 60);
%figure(18),imshow(bigholes)
%title('Only the big holes')
% 
 bigholes= imfill(bigholes,'holes'); 
%figure(19),imshow(bigholes);

ge=imerode(bigholes,se); % Eroding the gray image with structural element.
% 
% figure(8),imshow(ge);
% 
 gdiff=imsubtract(Ifill,ge); % Morphological Gradient for edges enhancement.
%figure(20),imshow(gdiff);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5


 pause(1)
 figure (21)
imshow(gdiff);
title('INPUT IMAGE WITHOUT NOISE')
% %% Label connected components
 [L Ne]=bwlabel(gdiff);
 disp(Ne);
 %propied=regionprops(L,'BoundingBox');
 CC = bwconncomp(gdiff);
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
  n1=gdiff(min(r):max(r),min(c):max(c));
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












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%02%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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

Ifill = imdilate(Ifill, se);
figure(7),imshow(Ifill);
Ifill = imdilate(Ifill, se);
figure(8),imshow(Ifill);






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%changes

holes = Ifill & ~Iedge2;
%figure(17),imshow(holes)
%title('Hole pixels identified')
bigholes = bwareaopen(holes, 20);
%figure(18),imshow(bigholes)
%title('Only the big holes')
% 
 bigholes= imfill(bigholes,'holes'); 
%figure(19),imshow(bigholes);

ge=imerode(bigholes,se); % Eroding the gray image with structural element.
% 
%figure(8),imshow(ge);
% 
 gdiff=imsubtract(Ifill,ge); % Morphological Gradient for edges enhancement.
%figure(20),imshow(gdiff);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5




pause(1)
figure (7)
imshow(gdiff);
title('INPUT IMAGE WITHOUT NOISE')
%% Label connected components
[L Ne]=bwlabel(gdiff);
disp(Ne);
%propied=regionprops(L,'BoundingBox');
CC = bwconncomp(gdiff);
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
  n1=gdiff(min(r):max(r),min(c):max(c));
  [x,y]=size(n1);
  if(x>10 && x<100 && y>15)
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
  end
     pause(0.5)
 end
%save trainingdata.mat k
%---------------------------------------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%03%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

Ifill = imdilate(Ifill, se);
figure(7),imshow(Ifill);






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%changes

holes = Ifill & ~Iedge2;
%figure(17),imshow(holes)
%title('Hole pixels identified')
bigholes = bwareaopen(holes, 60);
%figure(18),imshow(bigholes)
%title('Only the big holes')
% 
 bigholes= imfill(bigholes,'holes'); 
%figure(19),imshow(bigholes);

ge=imerode(bigholes,se); % Eroding the gray image with structural element.
% 
% figure(8),imshow(ge);
% 
 gdiff=imsubtract(Ifill,ge); % Morphological Gradient for edges enhancement.
%figure(20),imshow(gdiff);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5





pause(1)
figure (7)
imshow(gdiff);
title('INPUT IMAGE WITHOUT NOISE')
%% Label connected components
[L Ne]=bwlabel(gdiff);
disp(Ne);
%propied=regionprops(L,'BoundingBox');
CC = bwconncomp(gdiff);
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
  n1=gdiff(min(r):max(r),min(c):max(c));
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
% %-----------------------------------------------------------
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%04%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 

f=imread('tnr1.jpg'); % Training:tnr1,A1,S1,SS1,ariale
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


Ifill = imdilate(Ifill, se);
figure(7),imshow(Ifill);






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%changes

holes = Ifill & ~Iedge2;
%figure(17),imshow(holes)
%title('Hole pixels identified')
bigholes = bwareaopen(holes, 40);
%figure(18),imshow(bigholes)
%title('Only the big holes')
% 
 bigholes= imfill(bigholes,'holes'); 
%figure(19),imshow(bigholes);

ge=imerode(bigholes,se); % Eroding the gray image with structural element.
% 
% figure(8),imshow(ge);
% 
 gdiff=imsubtract(Ifill,ge); % Morphological Gradient for edges enhancement.
%figure(20),imshow(gdiff);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5




pause(1)
figure (7)
imshow(gdiff);
title('INPUT IMAGE WITHOUT NOISE')
%% Label connected components
[L Ne]=bwlabel(gdiff);
disp(Ne);
%propied=regionprops(L,'BoundingBox');
CC = bwconncomp(gdiff);
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
  n1=gdiff(min(r):max(r),min(c):max(c));
  [x,y]=size(n1);
  if(x>10 && x<100 && y>15)
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
  end
     pause(0.5)
 end
%save trainingdata.mat k
[r c]=size(k)