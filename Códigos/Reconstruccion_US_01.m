function varargout = Reconstruccion_US_01(varargin)
% RECONSTRUCCION_US_01 MATLAB code for Reconstruccion_US_01.fig
%      RECONSTRUCCION_US_01, by itself, creates a new RECONSTRUCCION_US_01 or raises the existing
%      singleton*.
%
%      H = RECONSTRUCCION_US_01 returns the handle to a new RECONSTRUCCION_US_01 or the handle to
%      the existing singleton*.
%
%      RECONSTRUCCION_US_01('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONSTRUCCION_US_01.M with the given input arguments.
%
%      RECONSTRUCCION_US_01('Property','Value',...) creates a new RECONSTRUCCION_US_01 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Reconstruccion_US_01_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Reconstruccion_US_01_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Reconstruccion_US_01

% Last Modified by GUIDE v2.5 20-Dec-2016 01:18:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Reconstruccion_US_01_OpeningFcn, ...
                   'gui_OutputFcn',  @Reconstruccion_US_01_OutputFcn, ...
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


% --- Executes just before Reconstruccion_US_01 is made visible.
function Reconstruccion_US_01_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Reconstruccion_US_01 (see VARARGIN)

% Choose default command line output for Reconstruccion_US_01
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Reconstruccion_US_01 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Reconstruccion_US_01_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in im_ecografo.
function im_ecografo_Callback(hObject, eventdata, handles)
global im_ecografo fn

handles.output = hObject;
[fn, pn] = uigetfile('*.bmp','Select .bmp file');
if not(pn==0);
    complete = strcat(pn,fn);
    im_ecografo = im2double(imread(complete));
    if size(im_ecografo,3)==3
        im_ecografo = im2double(rgb2gray(imread(complete)));
    end
end



% --- Executes on button press in im_referencia.
function im_referencia_Callback(hObject, eventdata, handles)
global im_referencia

handles.output = hObject;
[fn, pn] = uigetfile('*.bmp','Select .bmp file');
if not(pn==0);
    complete = strcat(pn,fn);
    im_referencia = im2double(imread(complete));
    if size(im_referencia,3)==3
        im_referencia = im2double(rgb2gray(imread(complete)));
    end
end


% --- Executes on selection change in metodo.
function metodo_Callback(hObject, eventdata, handles)
global Metodo

str = get(hObject, 'String');
val = get(hObject,'Value');

Metodo = str{val};
if  strcmp(Metodo,'DWT')
    set(handles.listawt,'String', ...
{'Haar', ...
'Daubechies',...
'Symlets',...
'Coiflets',...
'BiorSplines',...
'ReverseBior',...
'Meyer',...
'DMeyer',...
'Gaussian',...
'Mexican_hat',...
'Morlet',...
'Complex Gaussian',...
'Shannon',...
'Frequency B-Spline',...
'Complex Morlet'})
else
     msgbox('Por favor seleccione DWT, esta es una versión de prueba')
     set(handles.listawt,'String',[]);
     set(handles.mothwt,'String',[]);
     set(handles.wtseleccion,'String',[]);
end




% --- Executes during object creation, after setting all properties.
function metodo_CreateFcn(hObject, eventdata, handles)
global Metodo
Metodo='DWT';

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in continuar.
function continuar_Callback(hObject, eventdata, handles)
global im_ecografo im_referencia filtros tiempo

A = 0;
W = [];
E = [];
R = [];

if isempty(filtros)
    W=['Seleccione al menos una wavelet.'];
    A=1;
end
if isempty(im_ecografo) || isempty(im_referencia)
    E=['Seleccione imágenes con ruido y de referencia.'];
    A=1;
end

if size(im_ecografo)~=size(im_referencia)
    R='Seleccione imágenes con ruido y de referencia de igual tamaño.';
    A=1;
end

if A==0
    cA=cell(1,4);
    cH=cell(1,4);
    cV=cell(1,4);
    cD=cell(1,4);
    cA{1} = im_ecografo;
    
    for i = 2:4
        [cA{i}, cH{i}, cV{i}, cD{i}]=dwt2(cA{i-1},filtros{1},'mode','per');
    end
    
    comienzo = tic;
    for i=1:20
        for j=4:-1:2
            cA{j-1} = idwt2(cA{j},cH{j},cV{j},cD{j},filtros{1},'mode','per');
        end
    end
    
    tiempo = toc(comienzo)/20;
  
    run Reconstruccion_US_02_DWT
    close Reconstruccion_US_01
else
    msgbox(strvcat(W, E, R))
end


% --- Executes on selection change in listawt.
function listawt_Callback(hObject, eventdata, handles)
global Metodo

if  strcmp(Metodo,'DWT')
index_selected = get(hObject,'Value');
list = get(hObject,'String');
seleccion= list{index_selected}; 
set(handles.mothwt,'Value',1);


if strcmp('Haar',seleccion);
txt_cell_array = {'haar'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('Daubechies',seleccion);
txt_cell_array = {'db1';'db2';'db3';'db4';'db5';'db6';...
    'db7';'db8';'db9';'db10'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('Symlets',seleccion);
txt_cell_array = {'sym2';'sym3';'sym4';'sym5';'sym6';...
    'sym7';'sym8'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('Coiflets',seleccion);
txt_cell_array = {'coif1';'coif2';'coif3';'coif4';'coif5'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('BiorSplines',seleccion);
txt_cell_array = {'bior1.1';'bior1.3';'bior1.5';...
    'bior2.2';'bior2.4';'bior2.6';'bior2.8';...
    'bior3.1';'bior3.3';'bior3.5';'bior3.7';...
    'bior3.9';'bior4.4';'bior5.5';'bior6.8'};
    set(handles.mothwt, 'String', txt_cell_array);
end
           
if strcmp('ReverseBior',seleccion);
txt_cell_array = {'rbior1.1';'rbior1.3';'rbior1.5';...
    'rbior2.2';'rbior2.4';'rbior2.6';'rbior2.8';...
    'rbior3.1';'rbior3.3';'rbior3.5';'rbior3.7';...
    'rbior3.9';'rbior4.4';'rbior5.5';'rbior6.8'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('Meyer',seleccion);
txt_cell_array = {'meyr'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('DMeyer',seleccion);
txt_cell_array = {'dmeyr'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('Gaussian',seleccion);
txt_cell_array = {'gaus2';'gaus3';'gaus4';'gaus5';'gaus6';...
    'gaus7';'gaus8'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('Mexican_hat',seleccion);
txt_cell_array = {'mexh'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('Morlet',seleccion);
txt_cell_array = {'morl'};
    set(handles.mothwt, 'String', txt_cell_array);
end
    
if strcmp('Complex Gaussian',seleccion);
txt_cell_array = {'cgau1';'cgau2';'cgau3';'cgau4';'cgau5'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('Shannon',seleccion);
txt_cell_array = {'shan1-1.5';'shan1-1';'shan1-0.5';...
    'shan1-0.1';'shan2-3'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('Frequency B-Spline',seleccion);
txt_cell_array = {'fbsp1-1-1.5';'fbsp1-1-1';'fbsp1-1-0.5';...
    'fbsp2-1-1';'fbsp2-1-0.5';'fbsp2-1-0.1'};
    set(handles.mothwt, 'String', txt_cell_array);
end

if strcmp('Complex Morlet',seleccion);
txt_cell_array = {'cmor1-1.5';'cmor1-1';'cmor1-0.5';...
    'cmor1-1';'cmor1-0.5';'cmor1-0.1'};
    set(handles.mothwt, 'String', txt_cell_array);
end
else
    set(hObject,'Value',1);
   
end


% --- Executes during object creation, after setting all properties.
function listawt_CreateFcn(hObject, eventdata, handles)
set(hObject,'String', ...
{'Haar', ...
'Daubechies',...
'Symlets',...
'Coiflets',...
'BiorSplines',...
'ReverseBior',...
'Meyer',...
'DMeyer',...
'Gaussian',...
'Mexican_hat',...
'Morlet',...
'Complex Gaussian',...
'Shannon',...
'Frequency B-Spline',...
'Complex Morlet'})

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in wtseleccion.
function wtseleccion_Callback(hObject, eventdata, handles)
% hObject    handle to wtseleccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns wtseleccion contents as cell array
%        contents{get(hObject,'Value')} returns selected item from wtseleccion


% --- Executes during object creation, after setting all properties.
function wtseleccion_CreateFcn(hObject, eventdata, handles)
global filtros
filtros = [];

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in agregar.
function agregar_Callback(hObject, eventdata, handles)
global filtros 

oldstr = get(handles.wtseleccion,'String');
seleccion = get(handles.mothwt,'String');
seleccion2 = get(handles.mothwt,'Value');

for i=1:length(seleccion2)
    oldstr{length(oldstr)+1}= seleccion{seleccion2(i)};   
end

oldstr=sort(oldstr);

set(handles.wtseleccion,'String', oldstr);
filtros = oldstr;


% --- Executes on button press in borrar.
function borrar_Callback(hObject, eventdata, handles)
global filtros

seleccion = get(handles.wtseleccion,'Value');
prev_str = get(handles.wtseleccion, 'String');
if ~isempty(prev_str)
    prev_str(get(handles.wtseleccion,'Value')) = [];
    set(handles.wtseleccion, 'String', prev_str, ...
        'Value', min(seleccion,length(prev_str)));
end

filtros = prev_str;




% --- Executes on selection change in mothwt.
function mothwt_Callback(hObject, eventdata, handles)
% hObject    handle to mothwt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns mothwt contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mothwt


% --- Executes during object creation, after setting all properties.
function mothwt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mothwt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
