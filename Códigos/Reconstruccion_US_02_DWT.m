function varargout = Reconstruccion_US_02_DWT(varargin)
% RECONSTRUCCION_US_02_DWT MATLAB code for Reconstruccion_US_02_DWT.fig
%      RECONSTRUCCION_US_02_DWT, by itself, creates a new RECONSTRUCCION_US_02_DWT or raises the existing
%      singleton*.
%
%      H = RECONSTRUCCION_US_02_DWT returns the handle to a new RECONSTRUCCION_US_02_DWT or the handle to
%      the existing singleton*.
%
%      RECONSTRUCCION_US_02_DWT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONSTRUCCION_US_02_DWT.M with the given input arguments.
%
%      RECONSTRUCCION_US_02_DWT('Property','Value',...) creates a new RECONSTRUCCION_US_02_DWT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Reconstruccion_US_02_DWT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Reconstruccion_US_02_DWT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Reconstruccion_US_02_DWT

% Last Modified by GUIDE v2.5 27-Dec-2016 02:26:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Reconstruccion_US_02_DWT_OpeningFcn, ...
                   'gui_OutputFcn',  @Reconstruccion_US_02_DWT_OutputFcn, ...
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


% --- Executes just before Reconstruccion_US_02_DWT is made visible.
function Reconstruccion_US_02_DWT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Reconstruccion_US_02_DWT (see VARARGIN)

% Choose default command line output for Reconstruccion_US_02_DWT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Reconstruccion_US_02_DWT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Reconstruccion_US_02_DWT_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in coef1.
function coef1_Callback(hObject, eventdata, handles)
global cH cV cD
figure(1)
xax=length(cH{2});
yax=ceil(max(max(abs([cH{2},cV{2},cD{2}]))));

subplot(3,1,1)
stem(max(abs(cH{2})));
axis([0, xax , 0, yax]);
ylabel('Coef. horizontales')
subplot(3,1,2)
stem(max(abs(cV{2})));
axis([0, xax , 0, yax]);
ylabel('Coef. verticales')
subplot(3,1,3)
stem(max(abs(cD{2})));
axis([0, xax , 0, yax]);
ylabel('Coef. diagonales')




% --- Executes on button press in coef2.
function coef2_Callback(hObject, eventdata, handles)
global cH cV cD
figure(1)
xax=length(cH{3});
yax=ceil(max(max(abs([cH{3},cV{3},cD{3}]))));

subplot(3,1,1)
stem(max(abs(cH{3})));
axis([0, xax , 0, yax]);
ylabel('Coef. horizontales')
subplot(3,1,2)
stem(max(abs(cV{3})));
axis([0, xax , 0, yax]);
ylabel('Coef. verticales')
subplot(3,1,3)
stem(max(abs(cD{3})));
axis([0, xax , 0, yax]);
ylabel('Coef. diagonales')


% --- Executes on button press in coef3.
function coef3_Callback(hObject, eventdata, handles)
global cH cV cD
figure(1)
xax=length(cH{4});
yax=ceil(max(max(abs([cH{4},cV{4},cD{4}]))));

subplot(3,1,1)
stem(max(abs(cH{4})));
axis([0, xax , 0, yax]);
ylabel('Coef. horizontales')
subplot(3,1,2)
stem(max(abs(cV{4})));
axis([0, xax , 0, yax]);
ylabel('Coef. verticales')
subplot(3,1,3)
stem(max(abs(cD{4})));
axis([0, xax , 0, yax]);
ylabel('Coef. diagonales')




function minumb3_Callback(hObject, eventdata, handles)
global minumb3
minumb3 = str2double(get(hObject,'String'));
if isnan(minumb3)
    msgbox('Ingresar un número')
end


% --- Executes during object creation, after setting all properties.
function minumb3_CreateFcn(hObject, eventdata, handles)
global minumb3
minumb3 = 0;

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxumb3_Callback(hObject, eventdata, handles)
global maxumb3
maxumb3 = str2double(get(hObject,'String'));
if isnan(maxumb3)
    msgbox('Ingresar un número')
end


% --- Executes during object creation, after setting all properties.
function maxumb3_CreateFcn(hObject, eventdata, handles)
global maxumb3
maxumb3 = 1;

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pasos3.
function pasos3_Callback(hObject, eventdata, handles)
global filtros Pasos1 Pasos2 Pasos3 tiempo

seleccion = get(hObject,'Value');
lista = get(hObject,'String');
Pasos3 = str2double(lista{seleccion});

A = round(2*length(filtros)*(Pasos1+1)^3*(Pasos2+1)^3*(Pasos3+1)^3*tiempo/20);
set(handles.duracion, 'String' ,strcat({'El tiempo aproximado de análisis es:  '}, num2str(A),{' minutos'}));


% --- Executes during object creation, after setting all properties.
function pasos3_CreateFcn(hObject, eventdata, handles)
global Pasos3
Pasos3 = 0;
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function minumb2_Callback(hObject, eventdata, handles)
global minumb2
minumb2 = str2double(get(hObject,'String'));
if isnan(minumb2)
    msgbox('Ingresar un número')
end


% --- Executes during object creation, after setting all properties.
function minumb2_CreateFcn(hObject, eventdata, handles)
global minumb2
minumb2 = 0;

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxumb2_Callback(hObject, eventdata, handles)
global maxumb2
maxumb2 = str2double(get(hObject,'String'));
if isnan(maxumb2)
    msgbox('Ingresar un número')
end


% --- Executes during object creation, after setting all properties.
function maxumb2_CreateFcn(hObject, eventdata, handles)
global maxumb2
maxumb2 = 1;

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in pasos2.
function pasos2_Callback(hObject, eventdata, handles)
global filtros Pasos1 Pasos2 Pasos3 tiempo

seleccion = get(hObject,'Value');
lista = get(hObject,'String');
Pasos2 = str2double(lista{seleccion});

A = round(2*length(filtros)*(Pasos1+1)^3*(Pasos2+1)^3*(Pasos3+1)^3*tiempo/20);
set(handles.duracion, 'String' ,strcat({'El tiempo aproximado de análisis es:  '}, num2str(A),{' minutos'}));


% --- Executes during object creation, after setting all properties.
function pasos2_CreateFcn(hObject, eventdata, handles)
global Pasos2
Pasos2 = 0;

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minumb1_Callback(hObject, eventdata, handles)
global minumb1
minumb1 = str2double(get(hObject,'String'));
if isnan(minumb1)
    msgbox('Ingresar un número')
end


% --- Executes during object creation, after setting all properties.
function minumb1_CreateFcn(hObject, eventdata, handles)
global minumb1
minumb1 = 0;

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxumb1_Callback(hObject, eventdata, handles)
global maxumb1
maxumb1 = str2double(get(hObject,'String'));
if isnan(maxumb1)
    msgbox('Ingresar un número')
end


% --- Executes during object creation, after setting all properties.
function maxumb1_CreateFcn(hObject, eventdata, handles)
global maxumb1
maxumb1 = 1;

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pasos1.
function pasos1_Callback(hObject, eventdata, handles)
global filtros Pasos1 Pasos2 Pasos3 tiempo

seleccion = get(hObject,'Value');
lista = get(hObject,'String');
Pasos1 = str2double(lista{seleccion});

A = round(2*length(filtros)*(Pasos1+1)^3*(Pasos2+1)^3*(Pasos3+1)^3*tiempo/20);
set(handles.duracion, 'String' ,strcat({'El tiempo aproximado de análisis es:  '}, num2str(A),{' minutos'}));


% --- Executes during object creation, after setting all properties.
function pasos1_CreateFcn(hObject, eventdata, handles)
global Pasos1
Pasos1 = 0;

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DWTfiltros.
function DWTfiltros_Callback(hObject, eventdata, handles)
global filtros cH cV cD im_ecografo
val = get(hObject,'Value');
cA=0;
cH=0;
cV=0;
cD=0;

cA=cell(1,4);
cH=cell(1,4);
cV=cell(1,4);
cD=cell(1,4);
cA{1} = im_ecografo;

for i = 2:4
    [cA{i}, cH{i}, cV{i}, cD{i}]=dwt2(cA{i-1},filtros{val},'mode','per');
end



% --- Executes during object creation, after setting all properties.
function DWTfiltros_CreateFcn(hObject, eventdata, handles)
global filtros cH cV cD im_ecografo
set(hObject,'String', filtros);
    
    cA=cell(1,4);
    cH=cell(1,4);
    cV=cell(1,4);
    cD=cell(1,4);
    cA{1} = im_ecografo;
    
    for i = 2:4
        [cA{i}, cH{i}, cV{i}, cD{i}]=dwt2(cA{i-1},filtros{1},'mode','per');
    end
    
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function duracion_CreateFcn(hObject, eventdata, handles)
global tiempo Pasos1 Pasos2 Pasos3
Pasos1 = 0;
Pasos2 = 0;
Pasos3 = 0;

A = strcat({'El tiempo aproximado de análisis es:  '}, num2str(0),{' minutos'});
set(hObject, 'String', A);


% --- Executes on button press in continuar.
function continuar_Callback(hObject, eventdata, handles)
global Pasos1 Pasos2 Pasos3 minumb1 minumb2 minumb3...
    maxumb1 maxumb2 maxumb3 th_nivel1 th_nivel2 th_nivel3...
    filtros  lista_ext im_ecografo regiones
A= 0;
Q = [];


if (minumb1 > maxumb1) || (minumb2 > maxumb2) || (minumb3 > maxumb3)
    Q =['Seleccione umbrales mínimos menores a los máximos.'];
    A=1;
end


if A==0
    if Pasos1 == 0;
        th_nivel1 = minumb1;
    else
        th_nivel1 = minumb1:(maxumb1-minumb1)/Pasos1:maxumb1;
    end
    
    if Pasos2 == 0;
        th_nivel2 = minumb2;
    else
        th_nivel2 = minumb2:(maxumb2-minumb2)/Pasos2:maxumb2;
    end
    
    if Pasos3 == 0;
        th_nivel3 = minumb3;
    else
        th_nivel3 = minumb3:(maxumb3-minumb3)/Pasos3:maxumb3;
    end
    lista_ext = cell(length(filtros)*2,1);
    for i=1:length(filtros)
        lista_ext{i}=strcat(filtros(i), {'_soft'});
        lista_ext{i+length(filtros)}=strcat(filtros(i), {'_hard'});
    end
    regiones=zeros(4,2);
u=length(im_ecografo)/4;
regiones(1,1)=u;
regiones(1,2)=u;
regiones(2,1)=3*u;
regiones(2,2)=u;
regiones(3,1)=u;
regiones(3,2)=3*u;
regiones(4,1)=3*u;
regiones(4,2)=3*u;
    run Reconstruccion_US_03
    close Reconstruccion_US_02_DWT
else
    msgbox(strvcat(Q))
end
