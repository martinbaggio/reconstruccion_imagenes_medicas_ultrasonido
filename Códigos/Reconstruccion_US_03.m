function varargout = Reconstruccion_US_03(varargin)
% RECONSTRUCCION_US_03 MATLAB code for Reconstruccion_US_03.fig
%      RECONSTRUCCION_US_03, by itself, creates a new RECONSTRUCCION_US_03 or raises the existing
%      singleton*.
%
%      H = RECONSTRUCCION_US_03 returns the handle to a new RECONSTRUCCION_US_03 or the handle to
%      the existing singleton*.
%
%      RECONSTRUCCION_US_03('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONSTRUCCION_US_03.M with the given input arguments.
%
%      RECONSTRUCCION_US_03('Property','Value',...) creates a new RECONSTRUCCION_US_03 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Reconstruccion_US_03_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Reconstruccion_US_03_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Reconstruccion_US_03

% Last Modified by GUIDE v2.5 27-Dec-2016 01:20:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Reconstruccion_US_03_OpeningFcn, ...
                   'gui_OutputFcn',  @Reconstruccion_US_03_OutputFcn, ...
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


% --- Executes just before Reconstruccion_US_03 is made visible.
function Reconstruccion_US_03_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Reconstruccion_US_03 (see VARARGIN)
global  im_ecografo im_ejes regiones pix colores rectangulo
im_ejes = repmat(im_ecografo,[1 1 3]);
% im_ejes = cat(3,im_ecografo,im_ecografo,im_ecografo);
imshow(im_ejes, 'Parent', handles.axis1);

rectangulo = zeros(4,4);
colores = {'red', 'blue', 'magenta', 'green'};
for i=1:4
    rectangulo(i,:) = [regiones(i,1)-pix/2 regiones(i,2)-pix/2 pix pix];
end
    rectangulo = int32(rectangulo);
    im_ejes = insertShape(im_ecografo, 'FilledRectangle', rectangulo,'Opacity',0.3,...
         'Color', {colores{1},colores{2},colores{3},colores{4}});
    imshow(im_ejes, 'Parent', handles.axis1);

% Choose default command line output for Reconstruccion_US_03
handles.output = hObject;
handles.numberOfErrors = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Reconstruccion_US_03 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Reconstruccion_US_03_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
 
% --- Executes on button press in regiones.
function regiones_Callback(hObject, eventdata, handles)
global im_ecografo regiones pix rectangulo colores

figure(2)
imshow(im_ecografo)
regiones = ginput(4);
close

if (regiones(:,:)>=1) & (regiones(:,:)<=size(im_ecografo,1));
   rectangulo = zeros(4,4);
for i=1:4
    rectangulo(i,:) = [regiones(i,1)-pix/2 regiones(i,2)-pix/2 pix pix];
end
    rectangulo = int32(rectangulo);
    im_ejes = insertShape(im_ecografo, 'FilledRectangle', rectangulo,'Opacity',0.3,...
         'Color', {colores{1},colores{2},colores{3},colores{4}});
    imshow(im_ejes, 'Parent', handles.axis1);

set(handles.regionx1,'String',num2str(regiones(1,1)));
set(handles.regionx2,'String',num2str(regiones(2,1)));
set(handles.regionx3,'String',num2str(regiones(3,1)));
set(handles.regionx4,'String',num2str(regiones(4,1)));
set(handles.regiony1,'String',num2str(regiones(1,2)));
set(handles.regiony2,'String',num2str(regiones(2,2)));
set(handles.regiony3,'String',num2str(regiones(3,2)));
set(handles.regiony4,'String',num2str(regiones(4,2)));
else msgbox('Seleccione los puntos dentro de la figura')
u=length(im_ecografo)/4;
regiones(1,1)=u;
regiones(1,2)=u;
regiones(2,1)=3*u;
regiones(2,2)=u;
regiones(3,1)=u;
regiones(3,2)=3*u;
regiones(4,1)=3*u;
regiones(4,2)=3*u;
end

% --- Executes during object creation, after setting all properties.
function axis1_CreateFcn(hObject, eventdata, handles)



function edit1_Callback(hObject, eventdata, handles)
global pix reset regiones im_ecografo rectangulo colores

pix = str2double(get(hObject,'String'));
if isnan(pix)
    msgbox('Ingresar un número')
    set(hObject, 'String', reset);
    pix = reset;
else
    A=size(im_ecografo,1)/2;
    if (pix>A) || (pix<0)
        msgbox(['Ingresar un número positivo y menor a ',num2str(A)])
        set(hObject, 'String', reset);
        pix = reset;
    else
        reset = pix;
        if regiones ~ 0;
            for i=1:4
                rectangulo(i,:) = [regiones(i,1)-pix/2 regiones(i,2)-pix/2 pix pix];
            end
            rectangulo = int32(rectangulo);
            im_ejes = insertShape(im_ecografo, 'FilledRectangle', rectangulo,'Opacity',0.3,...
                'Color', {colores{1},colores{2},colores{3},colores{4}});
            imshow(im_ejes, 'Parent', handles.axis1);
            
        end
    end
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
global pix reset

pix = 40;
reset = 40;
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global regiones pix im_ecografo

 if regiones == 0;
     msgbox('Seleccionar regiones de análisis');
     regiones_callback
 else
     if (min(min(regiones))-pix/2>0) && (max(max(regiones))+pix/2< size(im_ecografo,1))
         run Reconstruccion_US_04
         close Reconstruccion_US_03
     else
         msgbox('La sección de análisis queda fuera de la figura. Reduzca la cantidad de pixeles a analizar o vuelva a definir los puntos que se encuentran en los márgenes de la figura');
     end
     
end

  
function regionx1_Callback(hObject, eventdata, handles)
global pix regiones im_ecografo rectangulo colores
regiones(1,1)=str2double(get(hObject,'String'));
if (regiones(:,:)>=1) & (regiones(:,:)<=size(im_ecografo,1));
    rectangulo = zeros(4,4);
    for i=1:4
        rectangulo(i,:) = [regiones(i,1)-pix/2 regiones(i,2)-pix/2 pix pix];
    end
    rectangulo = int32(rectangulo);
    im_ejes = insertShape(im_ecografo, 'FilledRectangle', rectangulo,'Opacity',0.3,...
        'Color', {colores{1},colores{2},colores{3},colores{4}});
    imshow(im_ejes, 'Parent', handles.axis1);
    
else msgbox('Seleccione los puntos dentro de la figura')
    u=length(im_ecografo)/4;
    regiones(1,1)=u;
end


% --- Executes during object creation, after setting all properties.
function regionx1_CreateFcn(hObject, eventdata, handles)
global regiones 

set(hObject,'String',num2str(regiones(1,1)));

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function regionx2_Callback(hObject, eventdata, handles)
global pix regiones im_ecografo rectangulo colores
regiones(2,1)=str2double(get(hObject,'String'));
if (regiones(:,:)>=1) & (regiones(:,:)<=size(im_ecografo,1));
    rectangulo = zeros(4,4);
    for i=1:4
        rectangulo(i,:) = [regiones(i,1)-pix/2 regiones(i,2)-pix/2 pix pix];
    end
    rectangulo = int32(rectangulo);
    im_ejes = insertShape(im_ecografo, 'FilledRectangle', rectangulo,'Opacity',0.3,...
        'Color', {colores{1},colores{2},colores{3},colores{4}});
    imshow(im_ejes, 'Parent', handles.axis1);
    
else msgbox('Seleccione los puntos dentro de la figura')
    u=length(im_ecografo)/4;
    regiones(2,1)=3*u;
end


% --- Executes during object creation, after setting all properties.
function regionx2_CreateFcn(hObject, eventdata, handles)
global regiones
set(hObject,'String',num2str(regiones(2,1)));

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function regionx3_Callback(hObject, eventdata, handles)
global pix regiones im_ecografo rectangulo colores
regiones(3,1)=str2double(get(hObject,'String'));
if (regiones(:,:)>=1) & (regiones(:,:)<=size(im_ecografo,1));
    rectangulo = zeros(4,4);
    for i=1:4
        rectangulo(i,:) = [regiones(i,1)-pix/2 regiones(i,2)-pix/2 pix pix];
    end
    rectangulo = int32(rectangulo);
    im_ejes = insertShape(im_ecografo, 'FilledRectangle', rectangulo,'Opacity',0.3,...
        'Color', {colores{1},colores{2},colores{3},colores{4}});
    imshow(im_ejes, 'Parent', handles.axis1);
    
else msgbox('Seleccione los puntos dentro de la figura')
    u=length(im_ecografo)/4;
    regiones(3,1)=u;
end


% --- Executes during object creation, after setting all properties.
function regionx3_CreateFcn(hObject, eventdata, handles)
global regiones
set(hObject,'String',num2str(regiones(3,1)));

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function regionx4_Callback(hObject, eventdata, handles)
global pix regiones im_ecografo rectangulo colores
regiones(4,1)=str2double(get(hObject,'String'));
if (regiones(:,:)>=1) & (regiones(:,:)<=size(im_ecografo,1));
    rectangulo = zeros(4,4);
    for i=1:4
        rectangulo(i,:) = [regiones(i,1)-pix/2 regiones(i,2)-pix/2 pix pix];
    end
    rectangulo = int32(rectangulo);
    im_ejes = insertShape(im_ecografo, 'FilledRectangle', rectangulo,'Opacity',0.3,...
        'Color', {colores{1},colores{2},colores{3},colores{4}});
    imshow(im_ejes, 'Parent', handles.axis1);
    
else msgbox('Seleccione los puntos dentro de la figura')
    u=length(im_ecografo)/4;
    regiones(4,1)=3*u;
end


% --- Executes during object creation, after setting all properties.
function regionx4_CreateFcn(hObject, eventdata, handles)
global regiones
set(hObject,'String',num2str(regiones(4,1)));

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function regiony4_Callback(hObject, eventdata, handles)
global pix regiones im_ecografo rectangulo colores
regiones(4,2)=str2double(get(hObject,'String'));
if (regiones(:,:)>=1) & (regiones(:,:)<=size(im_ecografo,1));
    rectangulo = zeros(4,4);
    for i=1:4
        rectangulo(i,:) = [regiones(i,1)-pix/2 regiones(i,2)-pix/2 pix pix];
    end
    rectangulo = int32(rectangulo);
    im_ejes = insertShape(im_ecografo, 'FilledRectangle', rectangulo,'Opacity',0.3,...
        'Color', {colores{1},colores{2},colores{3},colores{4}});
    imshow(im_ejes, 'Parent', handles.axis1);
    
else msgbox('Seleccione los puntos dentro de la figura')
    u=length(im_ecografo)/4;
    regiones(4,2)=3*u;
end


% --- Executes during object creation, after setting all properties.
function regiony4_CreateFcn(hObject, eventdata, handles)
global regiones
set(hObject,'String',num2str(regiones(4,2)));

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function regiony3_Callback(hObject, eventdata, handles)
global pix regiones im_ecografo rectangulo colores
regiones(3,2)=str2double(get(hObject,'String'));
if (regiones(:,:)>=1) & (regiones(:,:)<=size(im_ecografo,1));
    rectangulo = zeros(4,4);
    for i=1:4
        rectangulo(i,:) = [regiones(i,1)-pix/2 regiones(i,2)-pix/2 pix pix];
    end
    rectangulo = int32(rectangulo);
    im_ejes = insertShape(im_ecografo, 'FilledRectangle', rectangulo,'Opacity',0.3,...
        'Color', {colores{1},colores{2},colores{3},colores{4}});
    imshow(im_ejes, 'Parent', handles.axis1);
    
else msgbox('Seleccione los puntos dentro de la figura')
    u=length(im_ecografo)/4;
    regiones(3,2)=3*u;
end


% --- Executes during object creation, after setting all properties.
function regiony3_CreateFcn(hObject, eventdata, handles)
global regiones
set(hObject,'String',num2str(regiones(3,2)));

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function regiony2_Callback(hObject, eventdata, handles)
global pix regiones im_ecografo rectangulo colores
regiones(2,2)=str2double(get(hObject,'String'));
if (regiones(:,:)>=1) & (regiones(:,:)<=size(im_ecografo,1));
    rectangulo = zeros(4,4);
    for i=1:4
        rectangulo(i,:) = [regiones(i,1)-pix/2 regiones(i,2)-pix/2 pix pix];
    end
    rectangulo = int32(rectangulo);
    im_ejes = insertShape(im_ecografo, 'FilledRectangle', rectangulo,'Opacity',0.3,...
        'Color', {colores{1},colores{2},colores{3},colores{4}});
    imshow(im_ejes, 'Parent', handles.axis1);
    
else msgbox('Seleccione los puntos dentro de la figura')
    u=length(im_ecografo)/4;
    regiones(2,2)=u;
end


% --- Executes during object creation, after setting all properties.
function regiony2_CreateFcn(hObject, eventdata, handles)
global regiones
set(hObject,'String',num2str(regiones(2,2)));

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function regiony1_Callback(hObject, eventdata, handles)
global pix regiones im_ecografo rectangulo colores
regiones(1,2)=str2double(get(hObject,'String'));
if (regiones(:,:)>=1) & (regiones(:,:)<=size(im_ecografo,1));
    rectangulo = zeros(4,4);
    for i=1:4
        rectangulo(i,:) = [regiones(i,1)-pix/2 regiones(i,2)-pix/2 pix pix];
    end
    rectangulo = int32(rectangulo);
    im_ejes = insertShape(im_ecografo, 'FilledRectangle', rectangulo,'Opacity',0.3,...
        'Color', {colores{1},colores{2},colores{3},colores{4}});
    imshow(im_ejes, 'Parent', handles.axis1);
    
else msgbox('Seleccione los puntos dentro de la figura')
    u=length(im_ecografo)/4;
    regiones(1,2)=u;
end


% --- Executes during object creation, after setting all properties.
function regiony1_CreateFcn(hObject, eventdata, handles)
global regiones  

set(hObject,'String',num2str(regiones(1,2)));
    
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
