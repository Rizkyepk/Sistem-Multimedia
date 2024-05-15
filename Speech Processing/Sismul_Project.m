function varargout = Sismul_Project(varargin)
% SISMUL_PROJECT MATLAB code for Sismul_Project.fig
%      SISMUL_PROJECT, by itself, creates a new SISMUL_PROJECT or raises the existing
%      singleton*.
%
%      H = SISMUL_PROJECT returns the handle to a new SISMUL_PROJECT or the handle to
%      the existing singleton*.
%
%      SISMUL_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SISMUL_PROJECT.M with the given input arguments.
%
%      SISMUL_PROJECT('Property','Value',...) creates a new SISMUL_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sismul_Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sismul_Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sismul_Project

% Last Modified by GUIDE v2.5 20-Dec-2023 03:53:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sismul_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Sismul_Project_OutputFcn, ...
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


% --- Executes just before Sismul_Project is made visible.
function Sismul_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sismul_Project (see VARARGIN)
global myrecobj;
global Fs;
Fs = 44100;

[y,Fs]=audioread('intro.wav');
sound(y,Fs);
disp('mobil merek apa yang ingin kamu beli?');
myrecobj = audiorecorder(Fs,16,1);
pause(1.25);

welcomeAudio = audioread('Toyota.wav');  
sound(welcomeAudio, 50100);
pause(1.25);
welcomeAudio = audioread('Nisan.wav');  
sound(welcomeAudio, 50100);
pause(1.25);
welcomeAudio = audioread('Audi.wav');  
sound(welcomeAudio, 50100);
pause(1.25);
welcomeAudio = audioread('Kia.wav');  
sound(welcomeAudio, 50100);
pause(1.25);
welcomeAudio = audioread('Subaru.wav');
sound(welcomeAudio, 50100);

% Choose default command line output for Sismul_Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Sismul_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sismul_Project_OutputFcn(hObject, eventdata, handles) 
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
global myrecobj;



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myrecobj;

%recording
disp('Recording');
recordblocking(myrecobj,2);
disp('END');
xin = getaudiodata(myrecobj);

[s1,Fs] =audioread('Toyotaj.wav');
[s2,Fs] =audioread('Nisanj.wav');
[s3,Fs] =audioread('Audij.wav');
[s4,Fs] =audioread('Kiaj.wav');
[s5,Fs] =audioread('Subaruj.wav');

if size(s1, 2) > 1
    s1 = s1(:, 1);
end
if size(s2, 2) > 1
    s2 = s2(:, 1);
end
if size(s3, 2) > 1
    s3 = s3(:, 1);
end
if size(s4, 2) > 1
    s4 = s4(:, 1);
end
if size(s5, 2) > 1
    s5 = s5(:, 1);
end

r1 = xcorr(xin,s1);
r2 = xcorr(xin,s2);
r3 = xcorr(xin,s3);
r4 = xcorr(xin,s4);
r5 = xcorr(xin,s5);

M1 = max(r1);
M2 = max(r2);
M3 = max(r3);
M4 = max(r4);
M5 = max(r5);

A = [M1 M2 M3 M4 M5];

[~, Index] = max(A);

switch Index
    case 1
        sound(s1, Fs);
        img = imread('Toyota.jpg');
    case 2
        sound(s2, Fs);
        img = imread('Nissan.jpg')
    case 3
        sound(s3, Fs);
        img = imread('Audi.jpg')
    case 4
        sound(s4, Fs);
        img = imread('Kia.jpg')
    case 5
        sound(s5, Fs);
        img = imread('Subaru.jpg');
end

%nampilin 
tampil = handles.axes6;
imshow(img, 'Parent',tampil);

% --- Executes during object creation, after setting all properties.
function axes7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img1 = imread('Toyota.jpg');
imshow(img1);
% Hint: place code in OpeningFcn to populate axes7


% --- Executes during object creation, after setting all properties.
function axes8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img2 = imread('Nissan.jpg');
imshow(img2);
% Hint: place code in OpeningFcn to populate axes8


% --- Executes during object creation, after setting all properties.
function axes9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img3 = imread('Audi.jpg');
imshow(img3);
% Hint: place code in OpeningFcn to populate axes9


% --- Executes during object creation, after setting all properties.
function axes10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img4 = imread('Kia.jpg');
imshow(img4);
% Hint: place code in OpeningFcn to populate axes10


% --- Executes during object creation, after setting all properties.
function axes11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img5 = imread('Subaru.jpg');
imshow(img5);
% Hint: place code in OpeningFcn to populate axes11

% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)%pilihan
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes6
