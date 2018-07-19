%clear all; clc;
function varargout = untitled(varargin)

% UNTITLED M-file for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 31-Mar-2016 10:31:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
%[fn pn] = uigetfile('*.jpg','select jpg file');
%complete = strcat(pn,fn);
%I = imread(complete);
%-------------------------------------------------------------------------------

%clear all;clc;
camlist=webcamlist;
cam=webcam(1);
%preview(cam)
img = snapshot(cam);

%------------------------------------------------------------------------------
I=img;
axes(handles.axes1);
imshow(I);
prepro_1(I);
assmem();
%------------------------------------------
% clear all;clc;
%f=imread(I); % Reading the number plate image.    Testing:(9,10,24,25,26/27,28,29/30,5,6,pic4,46/35 ,36/37,39,41/49 ,43/44 ,47)    Training:ariale,
%figure(1),imshow(f);
% f=imresize(I,[400 NaN]); % Resizing the image keeping aspect ratio same.
% %figure(2),imshow(f);
% 
% g=rgb2gray(f);% Converting the RGB (color) image to gray (intensity).
% 
% %figure(3),imshow(g);
% 
% g=medfilt2(g,[3 3]); % Median filtering to remove noise.
% 
% %figure(4),imshow(g);
% 
% se=strel('disk',1); % Structural element (disk of radius 1) for morphological processing.
% %se=ones(3,3);
% gi=imdilate(g,se); % Dilating the gray image with the structural element.
% 
% %figure(5),imshow(gi);
% 
% ge=imerode(g,se); % Eroding the gray image with structural element.
% 
% %figure(6),imshow(ge);
% 
% gdiff=imsubtract(gi,ge); % Morphological Gradient for edges enhancement.
% %figure(7),imshow(gdiff);
% gdiff=mat2gray(gdiff); % Converting the class to double.<matrix tu image ma convert ma  kearech
% 
% %figure(8),imshow(gdiff);
% 
% gdiff=conv2(gdiff,[1 1;1 1]); % Convolution of the double image for brightening the edges.[1 1;1 1] is the matrix using which convolution og gdiff is performed.
% 
% %figure(9),imshow(gdiff);
% 
% gdiff=imadjust(gdiff,[0.5 0.6],[0 1],0.1); % Intensity scaling between the range 0 to 1.Values below 0.5-->0,  0.6 and above-->1
% 
% %figure(10),imshow(gdiff);
% 
% B=logical(gdiff);
% %figure(11),imshow(B);% Conversion of the class from double to binary. 
% % Eliminating the possible horizontal lines from the output image of regiongrow
% % that could be edges of license plate.
% % -----------------------------------------------------------------------------------------------------
% 
% 
% % . Works for some images. The number plate becomes completely white  for some images and appropriately distinctive for some. 
% B=imclearborder(B);
% 
% %figure(12),imshow(B);
% er=imerode(B,strel('line',50,0));
% %er=imerode(B,strel('disk',1));
% 
% %figure(12),imshow(er);
% 
% %imclearborder(B);
% 
% out1=imsubtract(B,er);
% %figure(13),imshow(out1);
% % Filling all the regions of the image.
% 
% %out1=mat2gray(out1);
% %out1=im2bw(out1);
% %F=out1;
% F=imfill(out1,'holes');% helps to identify difference between W and H
% %--------------------------------------------------------------------------
% %-------------------------------------------------
% figure(14),imshow(F);
% % Thinning the image.
% %H=bwmorph(F,'endpoints',1);%----
% %H=bwmorph(F,'fill',1);%----
% 
% H=bwmorph(F,'thin',1);
% %H=bwmorph(H,'thin',1);
% 
% %figure(15),imshow(H);%--------
% %-------------------------------------------------------------------
% 
% H=imclearborder(H);
% %figure(16),imshow(H);
% 
% H=imerode(H,strel('line',3,90));
% %H=imerode(H,strel('line',3,90));
% 
% %H=imerode(H,strel('disk',1));
% %figure(17),imshow(H);
% 
% %H=immultiply(H,out1);
% %H=imfill(H,'holes');
% %imtransform()
% %H=bwmorph(H,'thin',1);
% %figure(18),imshow(H);
% %pause
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% imagen = bwareaopen(H,100);
% %figure(19),imshow(imagen);
% [r c k]=size(imagen);
% %r
% %c
% %k
% pause(1)
% %% Show image binary image
% figure(20)
% imshow(imagen);
% title('INPUT IMAGE WITHOUT NOISE')
% %% Label connected components
% [L Ne]=bwlabel(imagen);
% %propied1=regionprops(H,'FilledImage');
% %figure(21),imshow(propied1);
% 
% CC = bwconncomp(imagen); propied = regionprops(CC,'BoundingBox');
% 
% %propied=regionprops(imagen,'BoundingBox');
% 
% 
% hold on
% %% Plot Bounding Box
% for n=1:size(propied,1)
%   rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
% end
% hold off
% pause (1)
% %% Objects extraction
% i=1;
% figure
% %subplot(8,8,i),imshow(imresize(f,[50 50]))
% 
% %-----------------------------------------------------------------------------------
% p=1;
% for n=1:Ne
%   [r,c] = find(L==n);
%   n1=imagen(min(r):max(r),min(c):max(c));
%   [x,y]=size(n1);
%   if(x>30 && x<100 && y>15)
%     %imshow(n1);
%     final=imresize(n1,[80 80]);
%     %final=~final;
%     imshow(final);
%     l=1;
%     for i=1:80
%         for j=1:80
%          result(p,l)=final(i,j);
%          l=l+1;
%         end
%     end
%     p=p+1;
%    % subplot(8,8,i+1), imshow(imresize(n1,[50 50]));
%     %i=i+1;
%   end
%   
%   %imshow(imresize(n1,[40 40]));
%   %subplot(8,8,i+1), imshow(~n1);
% 
%   %imageStack{n}=figure(i);
%   %imwrite(figure(i),'C:\Users\rahul1\Pictures\output.jpg','jpg');
%   
%   pause(0.5)
% end
% [r c]=size(result)
% save test.mat result
%result
%---------------------------------------------------------------------------------------
%db2();
%assmem();





%--------------------------------------
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function pushbutton2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
