function varargout = ffsim_gui(varargin)
% FFSIM_GUI MATLAB code for ffsim_gui.fig
%      FFSIM_GUI, by itself, creates a new FFSIM_GUI or raises the existing
%      singleton*.
%
%      H = FFSIM_GUI returns the handle to a new FFSIM_GUI or the handle to
%      the existing singleton*.
%
%      FFSIM_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FFSIM_GUI.M with the given input arguments.
%
%      FFSIM_GUI('Property','Value',...) creates a new FFSIM_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ffsim_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ffsim_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ffsim_gui

% Last Modified by GUIDE v2.5 18-Jan-2021 17:27:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ffsim_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @ffsim_gui_OutputFcn, ...
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


% --- Executes just before ffsim_gui is made visible.
function ffsim_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ffsim_gui (see VARARGIN)

% Choose default command line output for ffsim_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

myImage = imread('ff.jpg');
set(handles.axes1,'Units','pixels');
axes(handles.axes1);
imshow(myImage);
set(handles.axes1,'Units','normalized');

% UIWAIT makes ffsim_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ffsim_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in runbutton.
function runbutton_Callback(hObject, eventdata, handles)
% hObject    handle to runbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


disp('RUN BUTTON');
final_time = str2double(get(handles.timetext, 'String'))
tstep = str2double(get(handles.tstext, 'String'))
firefly_nr = str2double(get(handles.nrtext, 'String'))
cycle_period = str2double(get(handles.pertext, 'String'))
coupling = str2double(get(handles.ctext, 'String'))

ffsim( final_time, tstep, firefly_nr, cycle_period, coupling);

% --- Executes on button press in ppbutton.
function ppbutton_Callback(hObject, eventdata, handles)
% hObject    handle to ppbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function nrtext_Callback(hObject, eventdata, handles)
% hObject    handle to nrtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nrtext as text
%        str2double(get(hObject,'String')) returns contents of nrtext as a double


% --- Executes during object creation, after setting all properties.
function nrtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nrtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pertext_Callback(hObject, eventdata, handles)
% hObject    handle to pertext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pertext as text
%        str2double(get(hObject,'String')) returns contents of pertext as a double


% --- Executes during object creation, after setting all properties.
function pertext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pertext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ctext_Callback(hObject, eventdata, handles)
% hObject    handle to ctext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ctext as text
%        str2double(get(hObject,'String')) returns contents of ctext as a double


% --- Executes during object creation, after setting all properties.
function ctext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ctext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timetext_Callback(hObject, eventdata, handles)
% hObject    handle to timetext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timetext as text
%        str2double(get(hObject,'String')) returns contents of timetext as a double


% --- Executes during object creation, after setting all properties.
function timetext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timetext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tstext_Callback(hObject, eventdata, handles)
% hObject    handle to tstext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tstext as text
%        str2double(get(hObject,'String')) returns contents of tstext as a double


% --- Executes during object creation, after setting all properties.
function tstext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tstext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
