function varargout = FirstGUI(varargin)
% FIRSTGUI M-file for FirstGUI.fig
%      FIRSTGUI, by itself, creates a new FIRSTGUI or raises the existing
%      singleton*.
%
%      H = FIRSTGUI returns the handle to a new FIRSTGUI or the handle to
%      the existing singleton*.
%
%      FIRSTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRSTGUI.M with the given input arguments.
%
%      FIRSTGUI('Property','Value',...) creates a new FIRSTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FirstGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FirstGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FirstGUI

% Last Modified by GUIDE v2.5 13-Apr-2016 17:38:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FirstGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @FirstGUI_OutputFcn, ...
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


% --- Executes just before FirstGUI is made visible.
function FirstGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FirstGUI (see VARARGIN)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FirstGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

bg_image1=imread('C:\Users\Harsh Shah\Documents\MATLAB\BE_Project_Implementation_1\start.jpg');%image for pushbutton1
set(handles.pushbutton5,'CData',bg_image1);


bg_image2=imread('C:\Users\Harsh Shah\Documents\MATLAB\BE_Project_Implementation_1\RESET.jpg');%image for pushbutton2
set(handles.pushbutton6,'CData',bg_image2,'ForegroundColor','black');


% --- Outputs from this function are returned to the command line.


function varargout = FirstGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Create an axis that spans whole gui
ah=axes( 'unit' , 'normalized' , 'position' , [ 0 0 1 1 ] );
%import background image and show it on axisr FirstGUI
bg=imread('C:\Users\Harsh Shah\Documents\MATLAB\BE_Project_Implementation_1\b1.jpg');
imagesc(bg);
%prevent plotting over the background and turn axis off
set(ah , 'handlevisibility' , 'off'  ,'visible' , 'off' )
%making background behind all unicontrols
uistack(ah,'bottom');
%%%%%%%%%%
% Choose default command line output fo
% Get default command line output from handles structure
varargout{1} = handles.output;



%%%%%%ARROW
X = [0.3 0.4];
 Y = [0.456   0.456];
 
set(annotation('arrow',X,Y),'Color','red','LineWidth',8,'Visible','off');


X = [0.5 0.6];
 Y = [0.456   0.456];
 
set(annotation('arrow',X,Y),'Color','red','LineWidth',8,'Visible','off');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I = imread('C:\Users\Harsh Shah\Documents\MATLAB\BE_Project_Implementation_1\logo3.jpg');
% axes(handles.axes9);
% imshow(I);





% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
X = [0.3 0.4];
 Y = [0.456   0.456];
[fn pn] = uigetfile('*.jpg','select jpg file');
complete = strcat(pn,fn);
 I = imread(complete);
axes(handles.axes5);
imshow(I);
ap=prepro_1(I);
% apt = imread(ap);
axes(handles.axes10);
imshow(ap);
res=assmem();
set(handles.edit1,'string',res);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.pushbutton2,'visible','off');
% set(handles.axes6,'visible','off');
% set(handles.pushbutton3,'visible','on');
% set(handles.edit1,'visible','off');
% set(annotation('arrow',X,Y),'Color','red','LineWidth',8,'Visible','on');

% --- Executes on button press in pushbutton2.
% --- Executes when uipanel1 is resized.
% function uipanel1_ResizeFcn(hObject, eventdata, handles)
% % hObject    handle to uipanel1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% set(hObject,'color','none')
% %set(hObject,'BackgroundColor',get(,'BackgroundColor'));


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
X = [0.5 0.6];
 Y = [0.456   0.456];
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%set(handles.axes10,'visible','on')


%  output.worldmap = gcf
%  getappdata(0,'output')
%  set(output.worldmap,'CurrentAxes',handles.axes_7)
%set(handles.pushbutton8,'visible','on');
%set(handles.edit1,'visible','on');
%  prepro_1.m;

% --- Executes on button press in pushbutton4.

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel4,'visible','on');
set(handles.pushbutton1,'visible','on');
set(handles.axes5,'visible','on');
set(handles.pushbutton7,'visible','on');
set(handles.pushbutton3,'visible','on');
set(handles.pushbutton8,'visible','on');
set(handles.axes10,'visible','on');
set(handles.axes5,'visible','on','xtick',[],'ytick',[],'ztick',[]) %hide the current axes
set(handles.axes5,'xlim',[-100 100],'ylim',[-100 100]);
set(gca,'visible','off');
set(get(handles.axes5,'children'),'visible','off');
set(get(handles.axes10,'children'),'visible','off');
set(handles.edit1,'visible','on');
%set(handles.axes6,'xlim',[-100 100],'ylim',[-100 100])

function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel4,'visible','off');
set(handles.axes10,'visible','off');
set(handles.pushbutton1,'visible','off');
set(handles.pushbutton3,'visible','off');
set(handles.pushbutton5,'visible','on');
set(handles.pushbutton6,'visible','on');
set(handles.pushbutton7,'visible','off');
set(handles.pushbutton8,'visible','off');
set(handles.edit1,'String','');
set(handles.axes5,'visible','off');
%set(get(handles.axes10,'children'),'visible','off');
set(handles.axes8,'visible','off');
set(handles.pushbutton1,'visible','off');
set(handles.text14,'visible','off');
set(handles.text15,'visible','off');
set(handles.text16,'visible','off');
set(handles.text17,'visible','off');
set(handles.text12,'visible','off');
set(handles.text13,'visible','off');
set(handles.text18,'visible','off');
set(handles.text19,'visible','off');
set(handles.text20,'visible','off');
set(handles.text21,'visible','off');
set(handles.text22,'visible','off');
set(handles.text23,'visible','off');

set(handles.edit1,'visible','off');
set(get(handles.axes5,'children'),'visible','off');
set(get(handles.axes10,'children'),'visible','off');
cla(handles.axes8,'reset');
set(get(handles.axes8,'children'),'visible','off');

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
camlist=webcamlist;
cam=webcam(1);
%preview(cam)
img = snapshot(cam);

%------------------------------------------------------------------------------
I=img;
axes(handles.axes5);
imshow(I);
ap=prepro_1(I);
axes(handles.axes10);
imshow(ap);
res=assmem();
set(handles.edit1,'string',res);
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel4,'visible','on');
set(handles.axes8,'visible','on');
set(handles.text12,'visible','on');
set(handles.text13,'visible','on');
set(handles.text14,'visible','on');
set(handles.text15,'visible','on');
set(handles.text16,'visible','on');
set(handles.text17,'visible','on');
set(handles.text18,'visible','on');
set(handles.text19,'visible','on');
set(handles.text20,'visible','on');
set(handles.text21,'visible','on');
set(handles.text22,'visible','on');
set(handles.text23,'visible','on');
res=assmem();
 [nums,strings]=xlsread('cardata.xlsx',1,'A1:G18');          
  for vv=1:18
     if strcmp(res,strings(vv,1))==1
         s1=strings(vv,2);
         s2=strings(vv,5);
         s3=strings(vv,6);
         s4=strings(vv,7);
         n1=nums(vv,1);
         n2=nums(vv,2);
%          disp(s1);
%          disp(s2);
%          disp(s3);
%          disp(s4);
%          disp(n1);
%          disp(n2);
     end
  end
%str=sprintf('%s',s1);
set(handles.text14,'string',s1);
set(handles.text15,'string',s2);
set(handles.text16,'string',s3);
set(handles.text17,'string',s4);
set(handles.text12,'string',num2str(n1));
set(handles.text13,'string',num2str(n2));

if strcmp(res,'MH02NA4524')==1
im = imread('abk.jpg');
axes(handles.axes8);
imshow(im);  
end
if strcmp(res,'MH14FG7584')==1
    im = imread('bj.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH02DS8675')==1
    im = imread('mi.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH02BZ6090')==1
    im = imread('ca.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH02AP2673')==1
    im = imread('sp.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH02AU2390')==1
    im = imread('nj.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH01R3209')==1
    im = imread('am.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH47A2258')==1
    im = imread('ks.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH02CB672')==1
    im = imread('ak.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH01YA2302')==1
    im = imread('thampi.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH02BJ378')==1
    im = imread('darshil.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH02AQ9590')==1
    im = imread('gp.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH02DG1318')==1
    im = imread('thampi.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH02CW0677')==1
    im = imread('rm.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH01SA1920')==1
    im = imread('ekta.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH02NL7504')==1
    im = imread('harsh.jpg');
    axes(handles.axes8);
    imshow(im);  
end

if strcmp(res,'MH02GL4545')==1
    im = imread('chogdi.jpeg');
    axes(handles.axes8);
    imshow(im);  
end    

if strcmp(res,'MH02DZ4050')==1
    im = imread('chogdi.jpeg');
    axes(handles.axes8);
    imshow(im);  
end

% set(handles.text3,'string',s2);
% set(handles.text3,'string',s3);
% set(handles.text3,'string',s4);
% set(handles.text3,'string',n1);
% set(handles.text3,'string',n2);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
