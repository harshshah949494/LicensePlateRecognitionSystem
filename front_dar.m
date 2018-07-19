function varargout = front_dar(varargin)
% FRONT_DAR M-file for front_dar.fig
%      FRONT_DAR, by itself, creates a new FRONT_DAR or raises the existing
%      singleton*.
%
%      H = FRONT_DAR returns the handle to a new FRONT_DAR or the handle to
%      the existing singleton*.
%
%      FRONT_DAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRONT_DAR.M with the given input arguments.
%
%      FRONT_DAR('Property','Value',...) creates a new FRONT_DAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before front_dar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to front_dar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help front_dar

% Last Modified by GUIDE v2.5 12-Apr-2016 17:00:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @front_dar_OpeningFcn, ...
                   'gui_OutputFcn',  @front_dar_OutputFcn, ...
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


% --- Executes just before front_dar is made visible.
function front_dar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to front_dar (see VARARGIN)

% Choose default command line output for front_dar
handles.output = hObject;

%create an axes than spans the whole gui
ah=axes('unit','normalized','position',[0 0 1 1]);
%import the background image and show it on the axes
bg=imread('C:\Users\Harsh Shah\Documents\MATLAB\BE_Project_Implementation_1\example.jpg');imagesc(bg);
%prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off');
%make sure the background is behind all the other uicontrols
uistack(ah,'bottom');

bg_image1=imread('C:\Users\Harsh Shah\Documents\MATLAB\BE_Project_Implementation_1\button1.jpg');%image for pushbutton1
set(handles.pushbutton1,'CData',bg_image1);


bg_image2=imread('C:\Users\Harsh Shah\Documents\MATLAB\BE_Project_Implementation_1\button2.jpg');%image for pushbutton2
set(handles.pushbutton2,'CData',bg_image2);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes front_dar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = front_dar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.output = hObject;
[fn pn] = uigetfile('*.jpg','select jpg file');
complete = strcat(pn,fn);
I = imread(complete);
%pre();
axes(handles.axes1);
imshow(I);
guidata(hObject, handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
