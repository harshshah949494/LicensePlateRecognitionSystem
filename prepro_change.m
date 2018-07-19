 clear all;clc;
f=imread('im26.jpg'); % Reading the number plate image.(22,24,25,26,27,28,29,30,5,6,pic4)
%figure(1),imshow(f);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%HOLES INTRODUCED AT LINE 81
%%WORKED FOR im2,im13,im30,im25,im28,
%%%%%im22(if holes raised from 332 to 600),im26(if holes raised from 332 to 500)
%%%%%im29(if holes raised from 332 to 150)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f=imresize(f,[400 NaN]); % Resizing the image keeping aspect ratio same.

%figure(2),imshow(f);

g=rgb2gray(f);% Converting the RGB (color) image to gray (intensity).

%figure(3),imshow(g);

g=medfilt2(g,[3 3]); % Median filtering to remove noise.

%figure(4),imshow(g);

se=strel('disk',1); % Structural element (disk of radius 1) for morphological processing.
%se=ones(3,3);
gi=imdilate(g,se); % Dilating the gray image with the structural element.

%figure(5),imshow(gi);

ge=imerode(g,se); % Eroding the gray image with structural element.

%figure(6),imshow(ge);

gdiff=imsubtract(gi,ge); % Morphological Gradient for edges enhancement.
%figure(7),imshow(gdiff);
gdiff=mat2gray(gdiff); % Converting the class to double.<matrix tu image ma convert ma kearech

%figure(8),imshow(gdiff);

gdiff=conv2(gdiff,[1 1;1 1]); % Convolution of the double image for brightening the edges.[1 1;1 1] is the matrix using which convolution og gdiff is performed.

%figure(9),imshow(gdiff);

gdiff=imadjust(gdiff,[0.5 0.6],[0 1],0.1); % Intensity scaling between the range 0 to 1.Values below 0.5-->0,  0.6 and above-->1

%figure(10),imshow(gdiff);

B=logical(gdiff);
%figure(11),imshow(B);% Conversion of the class from double to binary. 
% Eliminating the possible horizontal lines from the output image of regiongrow
% that could be edges of license plate.
% -----------------------------------------------------------------------------------------------------


% . Works for some images. The number plate becomes completely white  for some images and appropriately distinctive for some. 
B=imclearborder(B);
%figure(12),imshow(B);
er=imerode(B,strel('line',50,0));
%er=imerode(B,strel('disk',1));

%figure(13),imshow(er);

%imclearborder(B);

out1=imsubtract(B,er);
%figure(14),imshow(out1);
% Filling all the regions of the image.


%F=out1;
F=imfill(out1,'holes');% helps to identify difference between W and H
%--------------------------------------------------------------------------
%-------------------------------------------------
figure(15),imshow(F);


%%%%%%%%%%%%%%%%%%%%%%%%%changes%%%%%%%%%%%%%%%%%%%%%





holes = F & ~out1;
figure(16),imshow(holes)
title('Hole pixels identified')
bigholes = bwareaopen(holes, 600);
figure(17),imshow(bigholes)
title('Only the big holes')







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Thinning the image.
%H=bwmorph(F,'endpoints',1);%----
%H=bwmorph(F,'fill',1);%----

% H=bwmorph(bigholes,'thin',1);
% %H=bwmorph(H,'thin',1);
% 
% figure(18),imshow(H);%--------

H=imclearborder(bigholes);
figure(18),imshow(H);

%  H=imerode(H,strel('line',3,90));
% % %H=imerode(H,strel('line',3,90));
% % 
% % %H=imerode(H,strel('disk',1));
%  figure(19),imshow(H);
% % 
%  H=immultiply(H,out1);
%  H=imfill(H,'holes');
%  figure(20),imshow(H);
% % 
% % 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%
  imagen = bwareaopen(H,100);
  figure(19),imshow(imagen);
% 
 pause(1)
 %% Show image binary image
 figure(20)
 imshow(imagen);
 title('INPUT IMAGE WITHOUT NOISE')
 %% Label connected components
[L Ne]=bwlabel(imagen);
%propied1=regionprops(H,'FilledImage');
%figure(21),imshow(propied1);

CC = bwconncomp(imagen); propied = regionprops(CC,'BoundingBox');

%propied=regionprops(imagen,'BoundingBox');


hold on
%% Plot Bounding Box
for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (1)
%% Objects extraction
i=1;
figure
%subplot(8,8,i),imshow(imresize(f,[50 50]))
p=1;
for n=1:Ne
  [r,c] = find(L==n);
  n1=imagen(min(r):max(r),min(c):max(c));
  [x,y]=size(n1);
  if(x>30 && x<100 && y>15)
    %imshow(n1);
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
    %subplot(8,8,i+1), imshow(imresize(n1,[50 50]));
    %i=i+1;
  end
  
  %imshow(imresize(n1,[40 40]));
  %subplot(8,8,i+1), imshow(~n1);

  %imageStack{n}=figure(i);
  %imwrite(figure(i),'C:\Users\rahul1\Pictures\output.jpg','jpg');
  
  pause(0.5)
end
 result=k
%save test.mat result
k