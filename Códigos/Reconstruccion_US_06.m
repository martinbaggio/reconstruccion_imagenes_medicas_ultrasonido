function varargout = Reconstuccion_US_06(varargin)
% Reconstruccion_US_06 MATLAB code for Reconstruccion_US_06.fig
%      Reconstruccion_US_06, by itself, creates a new Reconstruccion_US_06 or raises the existing
%      singleton*.
%
%      H = Reconstruccion_US_06 returns the handle to a new Reconstruccion_US_06 or the handle to
%      the existing singleton*.
%
%      Reconstruccion_US_06('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Reconstruccion_US_06.M with the gpv3en input arguments.
%
%      Reconstruccion_US_06('Property','Value',...) creates a new Reconstruccion_US_06 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Reconstruccion_US_06_OpeningFcn gets called.  An
%      unrecognized property name or invalpd3 value makes property application
%      stop.  All inputs are passed to Reconstruccion_US_06_OpeningFcn via varargin.
%
%      *See GUI Options on GUpd3E's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUpd3E, GUpd3ATA, GUph3ANDLES

% Edit the above text to modify the response to help Reconstruccion_US_06

% Last Modified by GUpd3E v2.5 26-Jul-2016 01:38:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Reconstruccion_US_06_OpeningFcn, ...
    'gui_OutputFcn',  @Reconstruccion_US_06_OutputFcn, ...
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


% --- Executes just before Reconstruccion_US_06 is made visible.
function Reconstruccion_US_06_OpeningFcn(hObject, eventdata, handles, varargin)
global Resultado Resultadoactual1 Resultadoactual2 Resultadoactual3 Resultadoactual4 l1 l2 l3 pasos colores rectangulo Resultadonorm1 Resultadonorm2 Resultadonorm3 Resultadonorm4

im_ejes = insertShape(Resultado, 'FilledRectangle', rectangulo,'Opacity',0.3,...
    'Color', {colores{1},colores{2},colores{3},colores{4}});
imshow(im_ejes, 'Parent', handles.axes1);

hold on
for d3=1
    for d2=1
        for d1=1
            for v3=1
                for v2=1
                    for v1=1
                        for h3=1:l3
                            for h2=1:l2
                                for h1=1
                                    plot(pasos,Resultadonorm1(1,(1:l1)+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...           %combinaciones manteniendo dirección
                                        *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
                                        l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3),'.','color', [0.7 0.7 0.7], 'parent', handles.axes3)
                                    plot(pasos,Resultadonorm2(1,(1:l1)+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...           %combinaciones manteniendo dirección
                                        *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
                                        l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3),'.','color', [0.7 0.7 0.7], 'parent', handles.axes3)
                                    plot(pasos,Resultadonorm3(1,(1:l1)+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...           %combinaciones manteniendo dirección
                                        *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
                                        l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3),'.','color', [0.7 0.7 0.7], 'parent', handles.axes3)
                                    plot(pasos,Resultadonorm4(1,(1:l1)+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...           %combinaciones manteniendo dirección
                                        *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
                                        l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3),'.','color', [0.7 0.7 0.7], 'parent', handles.axes3)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

plot(pasos,Resultadonorm1(1,1+((1:l1)-1)*l1^2),'b *', 'parent', handles.axes3)
plot(pasos,Resultadonorm2(1,1+((1:l1)-1)*l1^2),'r *', 'parent', handles.axes3)
plot(pasos,Resultadonorm3(1,1+((1:l1)-1)*l1^2),'g *', 'parent', handles.axes3)
plot(pasos,Resultadonorm4(1,1+((1:l1)-1)*l1^2),'m *', 'parent', handles.axes3)
plot(pasos,Resultadonorm1(1,1+((1:l1)-1)*l1),'b x', 'parent', handles.axes3)
plot(pasos,Resultadonorm2(1,1+((1:l1)-1)*l1),'r x', 'parent', handles.axes3)
plot(pasos,Resultadonorm3(1,1+((1:l1)-1)*l1),'g x', 'parent', handles.axes3)
plot(pasos,Resultadonorm4(1,1+((1:l1)-1)*l1),'m x', 'parent', handles.axes3)
plot(pasos,Resultadonorm1(1,1:l1),'b', 'parent', handles.axes3)
plot(pasos,Resultadonorm2(1,1:l1),'r', 'parent', handles.axes3)
plot(pasos,Resultadonorm3(1,1:l1),'g', 'parent', handles.axes3)
plot(pasos,Resultadonorm4(1,1:l1),'m', 'parent', handles.axes3)
plot(pasos(1),Resultadonorm1(1,1),'b o', 'parent', handles.axes3)
plot(pasos(1),Resultadonorm2(1,1),'r o', 'parent', handles.axes3)
plot(pasos(1),Resultadonorm3(1,1),'g o', 'parent', handles.axes3)
plot(pasos(1),Resultadonorm4(1,1),'m o', 'parent', handles.axes3)
hold off

% Choose default command line output for Reconstruccion_US_06
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Reconstruccion_US_06 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Reconstruccion_US_06_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUpd3ATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slpd3er movement.
function sliderH_Callback(hObject, eventdata, handles)
global h1 h2 h3 v1 v2 v3 d1 d2 d3 auxiliar_im wt Imagen Resultadoactual1 Resultadoactual2 Resultadoactual3 Resultadoactual4 Linea1 Linea2 Linea3 Linea4 Indice
global l1 l2 l3 Resultadoactual0 A  auxH auxV auxD pasos C colores rectangulo Resultadonorm1 Resultadonorm2 Resultadonorm3 Resultadonorm4 lista_ext


if get(handles.niv1,'Value') == 1
    if get(handles.th_H,'Value') == 1
        h1= round(get(hObject,'Value'));
        B=h1;
        C=(1:l1)+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...
            *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
            l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3;
        D = (1:l1)-1;
        ph3 = 1:l3;
        ph2 = 1:l2;
        ph1 = 1;
        pv3 = v3;
        pv2 = v2;
        pv1 = v1;
        pd3 = d3;
        pd2 = d2;
        pd1 = d1;
    else if get(handles.th_V,'Value') == 1
            v1 = round(get(hObject,'Value'));
            B=v1;
            C=h1+((1:l1)-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...
                *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
                l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3;
            D = ((1:l1)-1)*l1;
            ph3 = h3;
            ph2 = h2;
            ph1 = h1;
            pv3 = 1:l3;
            pv2 = 1:l2;
            pv1 = 1;
            pd3 = d3;
            pd2 = d2;
            pd1 = d1;
        else
            d1= round(get(hObject,'Value'));
            B=d1;
            C=h1+(v1-1)*l1+((1:l1)-1)*l1^2+(h2-1)*l1^3+(v2-1)...
                *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
                l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3;
            D = ((1:l1)-1)*l1^2;
            ph3 = h3;
            ph2 = h2;
            ph1 = h1;
            pv3 = v3;
            pv2 = v2;
            pv1 = v1;
            pd3 = 1:l3;
            pd2 = 1:l2;
            pd1 = 1;
        end
    end
else if get(handles.niv2,'Value') == 1
        if get(handles.th_H,'Value') == 1
            h2= round(get(hObject,'Value'));
            B=h2;
            C=h1+(v1-1)*l1+(d1-1)*l1^2+((1:l2)-1)*l1^3+(v2-1)...
                *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
                l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3;
            D = ((1:l2)-1)*l1^3;
            ph3 = 1:l3;
            ph2 = 1;
            ph1 = 1:l1;
            pv3 = v3;
            pv2 = v2;
            pv1 = v1;
            pd3 = d3;
            pd2 = d2;
            pd1 = d1;
        else if get(handles.th_V,'Value') == 1
                v2 = round(get(hObject,'Value'));
                B=v2;
                C=h1+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+((1:l2)-1)...
                    *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
                    l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3;
                D = ((1:l2)-1)*l2*l1^3;
                ph3 = h3;
                ph2 = h2;
                ph1 = h1;
                pv3 = 1:l3;
                pv2 = 1;
                pv1 = 1:l1;
                pd3 = d3;
                pd2 = d2;
                pd1 = d1;
            else
                d2= round(get(hObject,'Value'));
                B=d2;
                C=h1+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...
                    *l2*l1^3+((1:l2)-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
                    l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3;
                D = ((1:l2)-1)*l2^2*l1^3;
                ph3 = h3;
                ph2 = h2;
                ph1 = h1;
                pv3 = v3;
                pv2 = v2;
                pv1 = v1;
                pd3 = 1:l3;
                pd2 = 1;
                pd1 = 1:l1;
            end
        end
    else
        if get(handles.th_H,'Value') == 1
            h3= round(get(hObject,'Value'));
            B=h3;
            C=h1+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...
                *l2*l1^3+(d2-1)*l2^2*l1^3+((1:l3)-1)*l2^3*l1^3+(v3-1)*l3*...
                l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3;
            D = ((1:l3)-1)*l2^3*l1^3;
            ph3 = 1;
            ph2 = 1:l2;
            ph1 = 1:l1;
            pv3 = v3;
            pv2 = v2;
            pv1 = v1;
            pd3 = d3;
            pd2 = d2;
            pd1 = d1;
        else if get(handles.th_V,'Value') == 1
                v3 = round(get(hObject,'Value'));
                B=v3;
                C=h1+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...
                    *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+((1:l3)-1)*l3*...
                    l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3;
                D = ((1:l3)-1)*l3*l2^3*l1^3;
                ph3 = h3;
                ph2 = h2;
                ph1 = h1;
                pv3 = 1;
                pv2 = 1:l2;
                pv1 = 1:l1;
                pd3 = d3;
                pd2 = d2;
                pd1 = d1;
            else
                d3= round(get(hObject,'Value'));
                B=d3;
                C=h1+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...
                    *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
                    l2^3*l1^3+((1:l3)-1)*l3^2*l2^3*l1^3;
                D = ((1:l3)-1)*l3^2*l2^3*l1^3;
                ph3 = h3;
                ph2 = h2;
                ph1 = h1;
                pv3 = v3;
                pv2 = v2;
                pv1 = v1;
                pd3 = 1;
                pd2 = 1:l2;
                pd1 = 1:l1;
            end
        end
    end
end

auxiliar_im = h1+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...
    *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
    l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3;

Aux=strcat(pwd,'\temp\',lista_ext{wt},'_',num2str(auxiliar_im));
load(Aux{1})

im_ejes = insertShape(Imagen, 'FilledRectangle', rectangulo,'Opacity',0.3,...
    'Color', {colores{1},colores{2},colores{3},colores{4}});
imshow(im_ejes, 'Parent', handles.axes1);


set(handles.PSNR1, 'String',[Linea1, ' = ',num2str(Resultadoactual1(wt,auxiliar_im)), Indice]);
set(handles.PSNR2, 'String',[Linea2, ' = ',num2str(Resultadoactual2(wt,auxiliar_im)), Indice]);
set(handles.PSNR3, 'String',[Linea3, ' = ',num2str(Resultadoactual3(wt,auxiliar_im)), Indice]);
set(handles.PSNR4, 'String',[Linea4, ' = ',num2str(Resultadoactual4(wt,auxiliar_im)), Indice]);

for d3r=pd3
    for v3r=pv3
        for h3r=ph3
            for d2r=pd2
                for v2r=pv2
                    for h2r=ph2
                        for d1r=pd1
                            for v1r=pv1
                                for h1r=ph1
                                    plot(pasos,Resultadonorm1(wt,h1r+(v1r-1)*l1+(d1r-1)*l1^2+(h2r-1)*l1^3+(v2r-1)...
                                        *l2*l1^3+(d2r-1)*l2^2*l1^3+(h3r-1)*l2^3*l1^3+(v3r-1)*l3*...
                                        l2^3*l1^3+(d3r-1)*l3^2*l2^3*l1^3+D),'.', 'color', [0.7 0.7 0.7], 'parent', handles.axes3)
                                    hold on
                                    plot(pasos,Resultadonorm2(wt,h1r+(v1r-1)*l1+(d1r-1)*l1^2+(h2r-1)*l1^3+(v2r-1)...
                                        *l2*l1^3+(d2r-1)*l2^2*l1^3+(h3r-1)*l2^3*l1^3+(v3r-1)*l3*...
                                        l2^3*l1^3+(d3r-1)*l3^2*l2^3*l1^3+D),'.','color', [0.7 0.7 0.7], 'parent', handles.axes3)
                                    plot(pasos,Resultadonorm3(wt,h1r+(v1r-1)*l1+(d1r-1)*l1^2+(h2r-1)*l1^3+(v2r-1)...
                                        *l2*l1^3+(d2r-1)*l2^2*l1^3+(h3r-1)*l2^3*l1^3+(v3r-1)*l3*...
                                        l2^3*l1^3+(d3r-1)*l3^2*l2^3*l1^3+D),'.','color', [0.7 0.7 0.7], 'parent', handles.axes3)
                                    plot(pasos,Resultadonorm4(wt,h1r+(v1r-1)*l1+(d1r-1)*l1^2+(h2r-1)*l1^3+(v2r-1)...
                                        *l2*l1^3+(d2r-1)*l2^2*l1^3+(h3r-1)*l2^3*l1^3+(v3r-1)*l3*...
                                        l2^3*l1^3+(d3r-1)*l3^2*l2^3*l1^3+D),'.','color', [0.7 0.7 0.7], 'parent', handles.axes3)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

plot(pasos,Resultadonorm1(wt,h1+(v1-1)*l1+(h2-1)*l1^3+(v2-1)...
    *l2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
    l2^3*l1^3+auxD),'r *', 'parent', handles.axes3)
plot(pasos,Resultadonorm2(wt,h1+(v1-1)*l1+(h2-1)*l1^3+(v2-1)...
    *l2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
    l2^3*l1^3+auxD),'b *', 'parent', handles.axes3)
plot(pasos,Resultadonorm3(wt,h1+(v1-1)*l1+(h2-1)*l1^3+(v2-1)...
    *l2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
    l2^3*l1^3+auxD),'m *', 'parent', handles.axes3)
plot(pasos,Resultadonorm4(wt,h1+(v1-1)*l1+(h2-1)*l1^3+(v2-1)...
    *l2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
    l2^3*l1^3+auxD),'g *', 'parent', handles.axes3)
plot(pasos,Resultadonorm1(wt,h1+(d1-1)*l1^2+(h2-1)*l1^3+...
    (d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+...
    (d3-1)*l3^2*l2^3*l1^3+auxV),'r x', 'parent', handles.axes3)
plot(pasos,Resultadonorm2(wt,h1+(d1-1)*l1^2+(h2-1)*l1^3+...
    (d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+...
    (d3-1)*l3^2*l2^3*l1^3+auxV),'b x', 'parent', handles.axes3)
plot(pasos,Resultadonorm3(wt,h1+(d1-1)*l1^2+(h2-1)*l1^3+...
    (d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+...
    (d3-1)*l3^2*l2^3*l1^3+auxV),'m x', 'parent', handles.axes3)
plot(pasos,Resultadonorm4(wt,h1+(d1-1)*l1^2+(h2-1)*l1^3+...
    (d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+...
    (d3-1)*l3^2*l2^3*l1^3+auxV),'g x', 'parent', handles.axes3)
plot(pasos,Resultadonorm1(wt,1+(v1-1)*l1+(d1-1)*l1^2+(v2-1)...
    *l2*l1^3+(d2-1)*l2^2*l1^3+(v3-1)*l3*...
    l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3+auxH),'r +', 'parent', handles.axes3)
plot(pasos,Resultadonorm2(wt,1+(v1-1)*l1+(d1-1)*l1^2+(v2-1)...
    *l2*l1^3+(d2-1)*l2^2*l1^3+(v3-1)*l3*...
    l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3+auxH),'b +', 'parent', handles.axes3)
plot(pasos,Resultadonorm3(wt,1+(v1-1)*l1+(d1-1)*l1^2+(v2-1)...
    *l2*l1^3+(d2-1)*l2^2*l1^3+(v3-1)*l3*...
    l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3+auxH),'m +', 'parent', handles.axes3)
plot(pasos,Resultadonorm4(wt,1+(v1-1)*l1+(d1-1)*l1^2+(v2-1)...
    *l2*l1^3+(d2-1)*l2^2*l1^3+(v3-1)*l3*...
    l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3+auxH),'g +', 'parent', handles.axes3)
plot(pasos,Resultadonorm1(wt,C),'r', 'parent', handles.axes3)
plot(pasos,Resultadonorm2(wt,C),'b', 'parent', handles.axes3)
plot(pasos,Resultadonorm3(wt,C),'m', 'parent', handles.axes3)
plot(pasos,Resultadonorm4(wt,C),'g', 'parent', handles.axes3)
plot(pasos(B),Resultadonorm1(wt,auxiliar_im),'r o', 'parent', handles.axes3)
plot(pasos(B),Resultadonorm2(wt,auxiliar_im),'b o', 'parent', handles.axes3)
plot(pasos(B),Resultadonorm3(wt,auxiliar_im),'m o', 'parent', handles.axes3)
plot(pasos(B),Resultadonorm4(wt,auxiliar_im),'g o', 'parent', handles.axes3)
hold off
set(gca,'XLim',[(min(pasos)-(max(pasos)-min(pasos))/10) (max(pasos)+(max(pasos)-min(pasos))/10)],'YLim',[min(A(:,1)) max(A(:,2))+(max(A(:,2))-min(A(:,1)))/10])
set(hObject,'SliderStep', [1/(length(pasos)-1) 1]);



% --- Executes during object creation, after setting all properties.
function sliderH_CreateFcn(hObject, eventdata, handles)
global l1 l2 l3 h1 h2 h3 v1 v2 v3 d1 d2 d3 wt
if l1>1
    PR=l1;
else if l2>1
        PR=l2;
    else PR=l3;
    end
end
set(hObject,'Position',[38 66 25 260], 'Value',1,'min',1,...
    'Max',PR,'SliderStep', [1/(PR-1) 1]);
h1 = 1;
h2 = 1;
h3 = 1;
v1 = 1;
v2 = 1;
v3 = 1;
d1 = 1;
d2 = 1;
d3 = 1;
wt = 1;

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in th_H.
function th_H_Callback(hObject, eventdata, handles)
global h1 h2 h3
set(hObject, 'Value', 1);
set(handles.th_V, 'Value', 0);
set(handles.th_D, 'Value', 0);
if get(handles.niv1,'Value') == 1
    set(handles.sliderH,'Value',h1)
else if get(handles.niv2,'Value') == 1
        set(handles.sliderH,'Value',h2)
    else set(handles.sliderH,'Value',h3)
    end
end




% --- Executes on button press in th_V.
function th_V_Callback(hObject, eventdata, handles)
global v1 v2 v3
set(hObject, 'Value', 1);
set(handles.th_H, 'Value', 0);
set(handles.th_D, 'Value', 0);
if get(handles.niv1,'Value') == 1
    set(handles.sliderH,'Value',v1)
else if get(handles.niv2,'Value') == 1
        set(handles.sliderH,'Value',v2)
    else set(handles.sliderH,'Value',v3)
    end
end




% --- Executes on button press in th_D.
function th_D_Callback(hObject, eventdata, handles)
global d1 d2 d3
set(hObject, 'Value', 1);
set(handles.th_H, 'Value', 0);
set(handles.th_V, 'Value', 0);
if get(handles.niv1,'Value') == 1
    set(handles.sliderH,'Value',d1)
else if get(handles.niv2,'Value') == 1
        set(handles.sliderH,'Value',d2)
    else set(handles.sliderH,'Value',d3)
    end
end


% --- Executes on button press in nivel1.
function niv1_Callback(hObject, eventdata, handles)
global l1 h1 v1 d1 auxH auxV auxD pasos th_nivel1
set(hObject, 'Value', 1);
set(handles.niv2, 'Value', 0);
set(handles.niv3, 'Value', 0);
set(handles.sliderH,'Min',1,...
    'Max',l1,'SliderStep', [1/(l1-1) 1])
auxH = (1:l1)-1;
auxV = ((1:l1)-1)*l1;
auxD = ((1:l1)-1)*l1^2;
pasos = th_nivel1;
if get(handles.th_H,'Value') == 1
    set(handles.sliderH,'Value',h1)
else if get(handles.th_V,'Value') == 1
        set(handles.sliderH,'Value',v1)
    else set(handles.sliderH,'Value',d1)
    end
end

% --- Executes on button press in nivel2.
function niv2_Callback(hObject, eventdata, handles)
global l1 l2 h2 v2 d2 auxH auxV auxD pasos th_nivel2
set(hObject, 'Value', 1);
set(handles.niv1, 'Value', 0);
set(handles.niv3, 'Value', 0);
set(handles.sliderH,'Min',1,...
    'Max',l2,'SliderStep', [1/(l2-1) 1])
auxH = ((1:l2)-1)*l1^3;
auxV = ((1:l2)-1)*l2*l1^3;
auxD = ((1:l2)-1)*l2^2*l1^3;
pasos = th_nivel2;
if get(handles.th_H,'Value') == 1
    set(handles.sliderH,'Value',h2)
else if get(handles.th_V,'Value') == 1
        set(handles.sliderH,'Value',v2)
    else set(handles.sliderH,'Value',d2)
    end
end


% --- Executes on button press in nivel3.
function niv3_Callback(hObject, eventdata, handles)
global l1 l2 l3 h3 v3 d3 auxH auxV auxD pasos th_nivel3
set(hObject, 'Value', 1);
set(handles.niv1, 'Value', 0);
set(handles.niv2, 'Value', 0);
set(handles.sliderH,'Min',1,...
    'Max',l3,'SliderStep', [1/(l3-1) 1])
auxH = ((1:l3)-1)*l2^3*l1^3;
auxV = ((1:l3)-1)*l3*l2^3*l1^3;
auxD = ((1:l3)-1)*l3^2*l2^3*l1^3;
pasos = th_nivel3;
if get(handles.th_H,'Value') == 1
    set(handles.sliderH,'Value',h3)
else if get(handles.th_V,'Value') == 1
        set(handles.sliderH,'Value',v3)
    else set(handles.sliderH,'Value',d3)
    end
end



 


% --- Executes on button press in ex_gr.
function ex_gr_Callback(hObject, eventdata, handles)
global h1 h2 h3 v1 v2 v3 d1 d2 d3 auxiliar_im wt Resultadoactual1 Resultadoactual2 Resultadoactual3 Resultadoactual4 Linea1 Linea2 Linea3 Linea4 Indice
global l1 l2 l3 A  auxH auxV auxD pasos C regiones pix fn lista_ext th_nivel1 th_nivel2 th_nivel3 Resultadonorm1 Resultadonorm2 Resultadonorm3 Resultadonorm4


if get(handles.niv1,'Value') == 1
    if get(handles.th_H,'Value') == 1
        ph3 = h3;
        ph2 = h2;
        ph1 = 1;
        pv3 = v3;
        pv2 = v2;
        pv1 = v1;
        pd3 = d3;
        pd2 = d2;
        pd1 = d1;
        Texto = {['H1: ',num2str(th_nivel1(1)),':',num2str(th_nivel1(2)-th_nivel1(1)),':',num2str(max(th_nivel1))];...
                    ['V1: ',num2str(th_nivel1(v1))];[ 'D1: ',num2str(th_nivel1(d1))]; []; ['H2: ',num2str(th_nivel2(h2))];['V2: ',num2str(th_nivel2(v2))]; ...
                    ['D2: ',num2str(th_nivel2(d2))];[]; ['H3: ',num2str(th_nivel3(h3))]; ['V3: ',num2str(th_nivel3(v3))];['D3: ',num2str(th_nivel3(d3))]};
    else if get(handles.th_V,'Value') == 1
            ph3 = h3;
            ph2 = h2;
            ph1 = h1;
            pv3 = v3;
            pv2 = v2;
            pv1 = 1;
            pd3 = d3;
            pd2 = d2;
            pd1 = d1;
            Texto = {['H1: ',num2str(th_nivel1(h1))];['V1: ',num2str(th_nivel1(1)),':',num2str(th_nivel1(2)-th_nivel1(1)),...
                ':',num2str(max(th_nivel1))];[ 'D1: ',num2str(th_nivel1(d1))]; []; ['H2: ',num2str(th_nivel2(h2))];['V2: ',num2str(th_nivel2(v2))]; ...
                    ['D2: ',num2str(th_nivel2(d2))];[]; ['H3: ',num2str(th_nivel3(h3))]; ['V3: ',num2str(th_nivel3(v3))];['D3: ',num2str(th_nivel3(d3))]};
        else
            ph3 = h3;
            ph2 = h2;
            ph1 = h1;
            pv3 = v3;
            pv2 = v2;
            pv1 = v1;
            pd3 = d3;
            pd2 = d2;
            pd1 = 1;
            Texto = {['H1: ',num2str(th_nivel1(h1))];['V1: ',num2str(th_nivel1(v1))];[ 'D1: ',...
                num2str(th_nivel1(1)),':',num2str(th_nivel1(2)-th_nivel1(1)),':',num2str(max(th_nivel1))]; [];...
                ['H2: ',num2str(th_nivel2(h2))];['V2: ',num2str(th_nivel2(v2))]; ...
                    ['D2: ',num2str(th_nivel2(d2))];[]; ['H3: ',num2str(th_nivel3(h3))]; ['V3: ',num2str(th_nivel3(v3))];['D3: ',num2str(th_nivel3(d3))]};
        end
    end
else if get(handles.niv2,'Value') == 1
        if get(handles.th_H,'Value') == 1
            ph3 = h3;
            ph2 = 1;
            ph1 = h1;
            pv3 = v3;
            pv2 = v2;
            pv1 = v1;
            pd3 = d3;
            pd2 = d2;
            pd1 = d1;
            Texto = {['H1: ',num2str(th_nivel1(h1))];['V1: ',num2str(th_nivel1(v1))];[ 'D1: ',num2str(th_nivel1(d1))]; []; ...
                ['H2: ',num2str(th_nivel2(1)),':',num2str(th_nivel2(2)-th_nivel2(1)),':',num2str(max(th_nivel2))];['V2: ',num2str(th_nivel2(v2))]; ...
                    ['D2: ',num2str(th_nivel2(d2))];[]; ['H3: ',num2str(th_nivel3(h3))]; ['V3: ',num2str(th_nivel3(v3))];['D3: ',num2str(th_nivel3(d3))]};
        else if get(handles.th_V,'Value') == 1
                ph3 = h3;
                ph2 = h2;
                ph1 = h1;
                pv3 = v3;
                pv2 = 1;
                pv1 = v1;
                pd3 = d3;
                pd2 = d2;
                pd1 = d1;
                Texto = {['H1: ',num2str(th_nivel1(h1))];['V1: ',num2str(th_nivel1(v1))];[ 'D1: ',num2str(th_nivel1(d1))]; []; ...
                    ['H2: ',num2str(th_nivel2(h2))];['V2: ',num2str(th_nivel2(1)),':',num2str(th_nivel2(2)-th_nivel2(1)),':',num2str(max(th_nivel2))]; ...
                    ['D2: ',num2str(th_nivel2(d2))];[]; ['H3: ',num2str(th_nivel3(h3))]; ['V3: ',num2str(th_nivel3(v3))];['D3: ',num2str(th_nivel3(d3))]};
            else
                ph3 = h3;
                ph2 = h2;
                ph1 = h1;
                pv3 = v3;
                pv2 = v2;
                pv1 = v1;
                pd3 = d3;
                pd2 = 1;
                pd1 = d1;
                Texto = {['H1: ',num2str(th_nivel1(h1))];['V1: ',num2str(th_nivel1(v1))];[ 'D1: ',num2str(th_nivel1(d1))]; []; ...
                    ['H2: ',num2str(th_nivel2(h2))];['V2: ',num2str(th_nivel2(v2))]; ...
                    ['D2: ',num2str(th_nivel2(1)),':',num2str(th_nivel2(2)-th_nivel2(1)),':',num2str(max(th_nivel2))]...
                    ;[]; ['H3: ',num2str(th_nivel3(h3))]; ['V3: ',num2str(th_nivel3(v3))];['D3: ',num2str(th_nivel3(d3))]};
            end
        end
    else
        if get(handles.th_H,'Value') == 1
            ph3 = 1;
            ph2 = h2;
            ph1 = h1;
            pv3 = v3;
            pv2 = v2;
            pv1 = v1;
            pd3 = d3;
            pd2 = d2;
            pd1 = d1;
            Texto = {['H1: ',num2str(th_nivel1(h1))];['V1: ',num2str(th_nivel1(v1))];[ 'D1: ',num2str(th_nivel1(d1))]; []; ...
                ['H2: ',num2str(th_nivel2(h2))];['V2: ',num2str(th_nivel2(v2))]; ...
                    ['D2: ',num2str(th_nivel2(d2))];[]; ['H3: ',num2str(th_nivel3(1)),':',num2str(th_nivel3(2)-th_nivel3(1)),...
                    ':',num2str(max(th_nivel3))]; ['V3: ',num2str(th_nivel3(v3))];['D3: ',num2str(th_nivel3(d3))]};
        else if get(handles.th_V,'Value') == 1
                ph3 = h3;
                ph2 = h2;
                ph1 = h1;
                pv3 = 1;
                pv2 = v2;
                pv1 = v1;
                pd3 = d3;
                pd2 = d2;
                pd1 = d1;
                Texto = {['H1: ',num2str(th_nivel1(h1))];...
                    ['V1: ',num2str(th_nivel1(v1))];[ 'D1: ',num2str(th_nivel1(d1))]; []; ['H2: ',num2str(th_nivel2(h2))];['V2: ',num2str(th_nivel2(v2))]; ...
                    ['D2: ',num2str(th_nivel2(d2))];[]; ['H3: ',num2str(th_nivel3(h3))]; ['V3: ',...
                    num2str(th_nivel3(1)),':',num2str(th_nivel3(2)-th_nivel3(1)),':',num2str(max(th_nivel3))];['D3: ',num2str(th_nivel3(d3))]};
            else
                ph3 = h3;
                ph2 = h2;
                ph1 = h1;
                pv3 = v3;
                pv2 = v2;
                pv1 = v1;
                pd3 = 1;
                pd2 = d2;
                pd1 = d1;
                Texto = {['H1: ',num2str(th_nivel1(h1))];['V1: ',num2str(th_nivel1(v1))];[ 'D1: ',num2str(th_nivel1(d1))]; []; ['H2: ',num2str(th_nivel2(h2))];['V2: ',num2str(th_nivel2(v2))]; ...
                    ['D2: ',num2str(th_nivel2(d2))];[]; ['H3: ',num2str(th_nivel3(h3))]; ['V3: ',num2str(th_nivel3(v3))];...
                    ['D3: ',num2str(th_nivel3(1)),':',num2str(th_nivel3(2)-th_nivel3(1)),':',num2str(max(th_nivel3))]};
            end
        end
    end
end

graf_puntos = ph1+(pv1-1)*l1+(pd1-1)*l1^2+(ph2-1)*l1^3+(pv2-1)...
    *l2*l1^3+(pd2-1)*l2^2*l1^3+(ph3-1)*l2^3*l1^3+(pv3-1)*l3*...
    l2^3*l1^3+(pd3-1)*l3^2*l2^3*l1^3;

figure('Position', [25 100 800 500])
 axes('Position', [0.31 0.5-300/800 512/800 300/400])

plot(pasos,Resultadonorm1(wt,C),'r')
hold on
plot(pasos,Resultadonorm2(wt,C),'b')
plot(pasos,Resultadonorm3(wt,C),'m')
plot(pasos,Resultadonorm4(wt,C),'g')

hold off

xlim([(min(pasos)-(max(pasos)-min(pasos))/10) (max(pasos)+(max(pasos)-min(pasos))/10)])
ylim([min(A(:,1)) max(A(:,2))+(max(A(:,2))-min(A(:,1)))/10])

xlabel('Umbral aplicado')
ylabel([{['Filtro Wavelet: ', strrep(char(lista_ext{wt}),'_','\_')];[]}; Texto ;...
     {[];[Linea1, ' inicial: ',num2str(Resultadoactual1(graf_puntos)), Indice];['en x = ', num2str(regiones(1,1)), ' en y = ', num2str(regiones(1,2))];'(rojo)';[];...
     [Linea2, ' inicial: ',num2str(Resultadoactual2(graf_puntos)),Indice];['en x = ', num2str(regiones(2,1)), ' en y = ', num2str(regiones(2,2))];'(azul)';[];...
     [Linea3, ' inicial: ',num2str(Resultadoactual3(graf_puntos)),Indice];['en x = ', num2str(regiones(3,1)), ' en y = ', num2str(regiones(3,2))];'(magenta)';[];...
     [Linea4, ' inicial: ',num2str(Resultadoactual4(graf_puntos)),Indice];['en x = ', num2str(regiones(4,1)), ' en y = ', num2str(regiones(4,2))];'(verde)';[];...
     ['Cantidad de pixeles = ', num2str(pix)]}],...
     'Rotation', 0, 'FontSize', 8,'VerticalAlignment', 'middle' , 'HorizontalAlignment', 'left') %'Position', [-1.5 0.5 1],
title(strrep(fn,'_','\_'),'FontSize', 12)



% --- Executes on button press in ex_im.
function ex_im_Callback(hObject, eventdata, handles)
global wt Imagen auxiliar_im  h1 h2 h3 v1 v2 v3 d1 d2 d3 Linea1 Linea2 Linea3 Linea4 Indice
global th_nivel1 th_nivel2 th_nivel3 lista_ext regiones pix fn
global Resultadoactual1 Resultadoactual2 Resultadoactual3 Resultadoactual4
figure('Position', [25 50 800 600])
 axes('Position', [0.31 0.5-512/1200 512/800 512/600])
 
 imshow(Imagen)
 title(strrep(fn,'_','\_'),'FontSize', 11);
 ylabel({['Filtro Wavelet: ', strrep(char(lista_ext{wt}),'_','\_')];[]; ['H1: ',num2str(th_nivel1(h1))];...
     ['V1: ',num2str(th_nivel1(v1))];[ 'D1: ',num2str(th_nivel1(d1))]; []; ['H2: ',num2str(th_nivel2(h2))];['V2: ',num2str(th_nivel2(v2))]; ...
     ['D2: ',num2str(th_nivel2(d2))];[]; ['H3: ',num2str(th_nivel3(h3))]; ['V3: ',num2str(th_nivel3(v3))];['D3: ',num2str(th_nivel3(d3))];...
     [];[];[Linea1, ': ',num2str(Resultadoactual1(wt,auxiliar_im)), Indice];['en x = ', num2str(regiones(1,1)), ' en y = ', num2str(regiones(1,2))];[];...
     [Linea2, ': ',num2str(Resultadoactual2(wt,auxiliar_im)),Indice];['en x = ', num2str(regiones(2,1)), ' en y = ', num2str(regiones(2,2))];[];...
     [Linea3, ': ',num2str(Resultadoactual3(wt,auxiliar_im)),Indice];['en x = ', num2str(regiones(3,1)), ' en y = ', num2str(regiones(3,2))];[];...
     [Linea4, ': ',num2str(Resultadoactual4(wt,auxiliar_im)),Indice];['en x = ', num2str(regiones(4,1)), ' en y = ', num2str(regiones(4,2))];[];...
     ['Cantidad de pixeles = ', num2str(pix)]},...
     'Rotation', 0,'Position', [-200 25 1],'FontSize', 8,'VerticalAlignment', 'cap' , 'HorizontalAlignment', 'left')





% --- Executes on selection change in Lista_wt.
function Lista_wt_Callback(hObject, eventdata, handles)
global wt
wt = get(hObject, 'Value');




% --- Executes during object creation, after setting all properties.
function Lista_wt_CreateFcn(hObject, eventdata, handles)
global lista_ext wt

for i=1:length(lista_ext)
    Filt(i,:) = [lista_ext{i}];
end

wt=lista_ext{1};
set(hObject,'String', Filt)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function niv1_CreateFcn(hObject, eventdata, handles)
global auxH auxV auxD l1

if l1==1;
    set(hObject,'Enable','off');
else
    auxH = ((1:l1)-1);
    auxV = ((1:l1)-1)*l1;
    auxD = ((1:l1)-1)*l1^2;
    set(hObject, 'Value', 1);
end




% --- Executes during object creation, after setting all properties.
function niv2_CreateFcn(hObject, eventdata, handles)
global l2
if l2==1;
    set(hObject,'Enable','off');
else
    set(hObject, 'Value', 0);
end


% --- Executes during object creation, after setting all properties.
function niv3_CreateFcn(hObject, eventdata, handles)
global l3
if l3==1;
    set(hObject,'Enable','off');
else
    set(hObject, 'Value', 0);
end


% --- Executes during object creation, after setting all properties.
function th_H_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Value', 1);


% --- Executes during object creation, after setting all properties.
function th_V_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Value', 0);


% --- Executes during object creation, after setting all properties.
function th_D_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Value', 0);


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function PSNR1_CreateFcn(hObject, eventdata, handles)
global Resultadoactual1 
set(hObject, 'String', ['PSNR1: ',num2str(Resultadoactual1(1)), ' dB']);


% --- Executes during object creation, after setting all properties.
function PSNR2_CreateFcn(hObject, eventdata, handles)
global Resultadoactual2
set(hObject, 'String', ['PSNR2: ',num2str(Resultadoactual2(1)), ' dB']);


% --- Executes during object creation, after setting all properties.
function PSNR3_CreateFcn(hObject, eventdata, handles)
global Resultadoactual3
set(hObject, 'String', ['PSNR3: ',num2str(Resultadoactual3(1)), ' dB']);


% --- Executes during object creation, after setting all properties.
function PSNR4_CreateFcn(hObject, eventdata, handles)
global Resultadoactual4
set(hObject, 'String', ['PSNR4: ',num2str(Resultadoactual4(1)), ' dB']);

% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
global Resultadonorm1 Resultadonorm2 Resultadonorm3 Resultadonorm4  A th_nivel1 pasos

pasos = th_nivel1;
A(1,1) = min(min(Resultadonorm1));
A(2,1) = min(min(Resultadonorm2));
A(3,1) = min(min(Resultadonorm3));
A(4,1) = min(min(Resultadonorm4));
A(1,2) = max(max(Resultadonorm1));
A(2,2) = max(max(Resultadonorm2));
A(3,2) = max(max(Resultadonorm3));
A(4,2) = max(max(Resultadonorm4));
set(gca,'XLim',[(min(th_nivel1)-(max(th_nivel1)-min(th_nivel1))/10) (max(th_nivel1)+(max(th_nivel1)-min(th_nivel1))/10)])
set(gca,'YLim',[min(A(:,1)) max(A(:,2))])



% --- Executes during object creation, after setting all properties.
function ex_gr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ex_gr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function ex_im_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ex_im (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in nav_resultado.
function nav_resultado_Callback(hObject, eventdata, handles)
global Resultadoactual1 Resultadoactual2 Resultadoactual3 Resultadoactual4 Resultadonorm1  Resultadonorm2  Resultadonorm3  Resultadonorm4
global Resultadopsnr1 Resultadopsnr2 Resultadopsnr3 Resultadopsnr4 Resultadopsnr0 ResultadoCG12  ResultadoCG23  ResultadoCG34  ResultadoCG41
global ResultadoLateral1 ResultadoLateral2 ResultadoLateral3 ResultadoLateral4 ResultadoAxial1  ResultadoAxial2  ResultadoAxial3  ResultadoAxial4
global Resultadonorm1 Resultadonorm2 Resultadonorm3 Resultadonorm4  A  pasos Linea1 Linea2 Linea3 Linea4 Indice


lista_ind = get(hObject, 'Value');
if lista_ind==1
    Resultadoactual1=Resultadopsnr1;
    Resultadoactual2=Resultadopsnr2;
    Resultadoactual3=Resultadopsnr3;
    Resultadoactual4=Resultadopsnr4;
    Resultadonorm1=Resultadopsnr1-Resultadopsnr0(1);
    Resultadonorm2=Resultadopsnr2-Resultadopsnr0(2);
    Resultadonorm3=Resultadopsnr3-Resultadopsnr0(3);
    Resultadonorm4=Resultadopsnr4-Resultadopsnr0(4);
    Linea1='PSNR1';
    Linea2='PSNR2';
    Linea3='PSNR3';
    Linea4='PSNR4';
    Indice=' dB';
    
else
    if lista_ind==2
        Resultadoactual1=ResultadoCG12;
        Resultadoactual2=ResultadoCG23;
        Resultadoactual3=ResultadoCG34;
        Resultadoactual4=ResultadoCG41;
        Resultadonorm1=ResultadoCG12;
        Resultadonorm2=ResultadoCG23;
        Resultadonorm3=ResultadoCG34;
        Resultadonorm4=ResultadoCG41;
        Linea1='CG12';
        Linea2='CG23';
        Linea3='CG34';
        Linea4='CG41';
        Indice=' ';
    else
        if lista_ind==3
            Resultadoactual1=ResultadoLateral1;
            Resultadoactual2=ResultadoLateral2;
            Resultadoactual3=ResultadoLateral3;
            Resultadoactual4=ResultadoLateral4;
            Resultadonorm1=ResultadoLateral1;
            Resultadonorm2=ResultadoLateral2;
            Resultadonorm3=ResultadoLateral3;
            Resultadonorm4=ResultadoLateral4;
            Linea1='RL1';
            Linea2='RL2';
            Linea3='RL3';
            Linea4='RL4';
            Indice=' pix';
        else
            Resultadoactual1=ResultadoAxial1;
            Resultadoactual2=ResultadoAxial2;
            Resultadoactual3=ResultadoAxial3;
            Resultadoactual4=ResultadoAxial4;
            Resultadonorm1=ResultadoAxial1;
            Resultadonorm2=ResultadoAxial2;
            Resultadonorm3=ResultadoAxial3;
            Resultadonorm4=ResultadoAxial4;
            Linea1='RA1';
            Linea2='RA2';
            Linea3='RA3';
            Linea4='RA4';
            Indice=' pix';
        end
    end
end

A(1,1) = min(min(Resultadonorm1));
A(2,1) = min(min(Resultadonorm2));
A(3,1) = min(min(Resultadonorm3));
A(4,1) = min(min(Resultadonorm4));
A(1,2) = max(max(Resultadonorm1));
A(2,2) = max(max(Resultadonorm2));
A(3,2) = max(max(Resultadonorm3));
A(4,2) = max(max(Resultadonorm4));
set(gca,'XLim',[(min(pasos)-(max(pasos)-min(pasos))/10) (max(pasos)+(max(pasos)-min(pasos))/10)],'YLim',[min(A(:,1)) max(A(:,2))])



% --- Executes during object creation, after setting all properties.
function nav_resultado_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
