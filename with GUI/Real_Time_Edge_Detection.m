function varargout = Real_Time_Edge_Detection(varargin)
% REAL_TIME_EDGE_DETECTION MATLAB code for Real_Time_Edge_Detection.fig
%      REAL_TIME_EDGE_DETECTION, by itself, creates a new REAL_TIME_EDGE_DETECTION or raises the existing
%      singleton*.
%
%      H = REAL_TIME_EDGE_DETECTION returns the handle to a new REAL_TIME_EDGE_DETECTION or the handle to
%      the existing singleton*.
%
%      REAL_TIME_EDGE_DETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REAL_TIME_EDGE_DETECTION.M with the given input arguments.
%
%      REAL_TIME_EDGE_DETECTION('Property','Value',...) creates a new REAL_TIME_EDGE_DETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Real_Time_Edge_Detection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      threshold.  All inputs are passed to Real_Time_Edge_Detection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Real_Time_Edge_Detection

% Last Modified by GUIDE v2.5 06-Apr-2019 06:07:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Real_Time_Edge_Detection_OpeningFcn, ...
                   'gui_OutputFcn',  @Real_Time_Edge_Detection_OutputFcn, ...
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


% --- Executes just before Real_Time_Edge_Detection is made visible.
function Real_Time_Edge_Detection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Real_Time_Edge_Detection (see VARARGIN)

% Choose default command line output for Real_Time_Edge_Detection
handles.output = hObject;
flag=0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Real_Time_Edge_Detection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Real_Time_Edge_Detection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);
SE = strel('diamond',2);

for i=1:20
    
    img=getsnapshot(view);
    axes(handles.axes2);
    imshow(img);
    title(handles.axes2,'Original');
    img2= imclose(rgb2gray(img),SE);
    img3= edge(img2,'Sobel');
    img4=imdilate(img3,SE);
    axes(handles.axes1);
    imshow(img4);
    title(handles.axes1,'Sobel');

    pause(0.1);
end

% --- Executes on button press in Roberts.
function Roberts_Callback(hObject, eventdata, handles)
% hObject    handle to Roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);
SE = strel('diamond',2);

for i=1:20
    
    img=getsnapshot(view);
    axes(handles.axes2);
    imshow(img);
    title(handles.axes2,'Original');
    img2= imclose(rgb2gray(img),SE);
    img3= edge(img2,'Roberts');
    img4=imdilate(img3,SE);
    axes(handles.axes1);
    imshow(img4);
    title(handles.axes1,'Roberts');
    pause(0.1);
end


% --- Executes on button press in Prewitt.
function Prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to Prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);
SE = strel('diamond',2);

for i=1:20
    
    img=getsnapshot(view);
    axes(handles.axes2);
    imshow(img);
    title(handles.axes2,'Original');
    img2= imclose(rgb2gray(img),SE);
    img3= edge(img2,'Prewitt');
    img4=imdilate(img3,SE);
    axes(handles.axes1);
    imshow(img4);
    title(handles.axes1,'Prewitt');
    pause(0.1);
end

% --- Executes on button press in Canny.
function Canny_Callback(hObject, eventdata, handles)
% hObject    handle to Canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);
SE = strel('diamond',2);

for i=1:20
    
    img=getsnapshot(view);
    axes(handles.axes2);
    imshow(img);
    title(handles.axes2,'Original');
    img2= imclose(rgb2gray(img),SE);
    img3= edge(img2,'Canny');
    img4=imdilate(img3,SE);
    axes(handles.axes1);
    imshow(img4);
    title(handles.axes1,'Canny');
    pause(0.1);
end



% --- Executes on button press in Compare.
function Compare_Callback(hObject, eventdata, handles)
% hObject    handle to Compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);
SE = strel('diamond',2);

for i=1:20
    
    %Pre-processing%
    img=getsnapshot(view);
    img2= imclose(rgb2gray(img),SE);
    
    %Sobel Edge Detection%
    img3= edge(img2,'Sobel');
    axes(handles.axes1);
    imshow(imdilate(img3,SE));
    title(handles.axes1,'Sobel');
    
    %Roberts Edge Detection%
    img4= edge(img2,'Roberts');
    axes(handles.axes2);
    imshow(imdilate(img4,SE));
    title(handles.axes2,'Roberts');
    
    %Prewitt Edge Detection%
    img5= edge(img2,'Prewitt');
    axes(handles.axes3);
    imshow(imdilate(img5,SE));
    title(handles.axes3,'Prewitt');
    
    %Canny Edge Detection%
    img6= edge(img2,'Canny');
    axes(handles.axes4);
    imshow(imdilate(img6,SE));
    title(handles.axes4,'Canny');
    
    pause(0.1);
end


% --- Executes on button press in Threshold.
function Threshold_Callback(hObject, eventdata, handles)
% hObject    handle to Threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
view=videoinput('winvideo',1);
SE = strel('diamond',2);

for i=1:20
    img=getsnapshot(view);
    img2= imclose(rgb2gray(img),SE);
    
    %Sobel Edge Detection%
    img3= edge(img2,'Sobel',0.08);
    axes(handles.axes1);
    imshow(imdilate(img3,SE));
    title(handles.axes1,'Sobel');
    
    %Roberts Edge Detection%
    img4= edge(img2,'Roberts',0.08);
    axes(handles.axes2);
    imshow(imdilate(img4,SE));
    title(handles.axes2,'Roberts');
    
    %Prewitt Edge Detection%
    img5= edge(img2,'Prewitt',0.08);
    axes(handles.axes3);
    imshow(imdilate(img5,SE));
    title(handles.axes3,'Prewitt');
    
    %Canny Edge Detection%
    img6= edge(img2,'Canny',0.08);
    axes(handles.axes4);
    imshow(imdilate(img6,SE));
    title(handles.axes4,'Canny');
    
    pause(0.1);
end
