f=imread('1.bmp');
I=imresize(f,[500 NaN]);

figure(1),imshow(I);
%Igray = rgb2gray(I); 
%figure(2),imshow(Igray);

Ibw = im2bw(I,graythresh(I)); 
%figure(3),imshow(Ibw);

Iedge = edge(uint8(Ibw)); 
%figure(4),imshow(Iedge);

se = strel('square',2);
Iedge2 = imdilate(Iedge, se); 
%figure(5),imshow(Iedge2);  

Ifill= imfill(Iedge2,'holes'); 
figure(6),imshow(Ifill);

pause(1)
figure (7)
imshow(Ifill);


[Ilabel num] = bwlabel(Ifill); 
disp(num); 
Iprops = regionprops(Ilabel);
Ibox = [Iprops.BoundingBox];
[r c ]=size(Ibox);
%r 
%c
Ibox = reshape(Ibox,[r c]); 
%figure(7),imshow(Ibox); 
   


hold on;
for cnt = 1:50
    rectangle('position',Ibox(:,cnt),'edgecolor','r'); 
end 