function [ Resultado ] = Reconstruccion_US_05_DWT( im_ecografo , im_referencia_crop, filtros, th_nivel1, th_nivel2, th_nivel3, regiones, pix )

global im_ecografo im_referencia_crop filtros th_nivel1 th_nivel2 th_nivel3 regiones Resultado l1 l2 l3 Resultadopsnr0 Resultadopsnr1 Resultadopsnr2 Resultadopsnr3 Resultadopsnr4 pix
global ResultadoCG12 ResultadoCG23 ResultadoCG34 ResultadoCG41 ResultadoLateral1 ResultadoLateral2 ResultadoLateral3 ResultadoLateral4 ResultadoAxial1 ResultadoAxial2 ResultadoAxial3 ResultadoAxial4
global Resultadoactual1 Resultadoactual2 Resultadoactual3 Resultadoactual4 Resultadonorm1 Resultadonorm2 Resultadonorm3 Resultadonorm4 Lista_indice Linea1 Linea2 Linea3 Linea4 Indice

l1 = length(th_nivel1);
l2 = length(th_nivel2);
l3 = length(th_nivel3);

Total = l1^3*l2^3*l3^3;
wt_Total = length(filtros)*2;
aux_ResultadoS = cell(1,Total);
aux_ResultadoH = cell(1,Total);

Recorte = cell(4,1);
for i=1:4
    Recorte{i} = [(regiones(i,1)-ceil(pix/2)), (regiones(i,2)-ceil(pix/2)), (pix-1), (pix-1)];
end



Resultadopsnr1 = zeros(wt_Total,Total);
Resultadopsnr2 = zeros(wt_Total,Total);
Resultadopsnr3 = zeros(wt_Total,Total);
Resultadopsnr4 = zeros(wt_Total,Total);
ResultadoCG12 = zeros(wt_Total,Total);
ResultadoCG23 = zeros(wt_Total,Total);
ResultadoCG34 = zeros(wt_Total,Total);
ResultadoCG41 = zeros(wt_Total,Total);
ResultadoLateral1=zeros(wt_Total,Total);
ResultadoLateral2=zeros(wt_Total,Total);
ResultadoLateral3=zeros(wt_Total,Total);
ResultadoLateral4=zeros(wt_Total,Total);
ResultadoAxial1=zeros(wt_Total,Total);
ResultadoAxial2=zeros(wt_Total,Total);
ResultadoAxial3=zeros(wt_Total,Total);
ResultadoAxial4=zeros(wt_Total,Total);
CG12=mean(mean(imcrop(im_ecografo,Recorte{1})))/mean(mean(imcrop(im_ecografo,Recorte{2})));
CG23=mean(mean(imcrop(im_ecografo,Recorte{2})))/mean(mean(imcrop(im_ecografo,Recorte{3})));
CG34=mean(mean(imcrop(im_ecografo,Recorte{3})))/mean(mean(imcrop(im_ecografo,Recorte{4})));
CG41=mean(mean(imcrop(im_ecografo,Recorte{4})))/mean(mean(imcrop(im_ecografo,Recorte{1})));

val = zeros(2,4);
Pico = zeros(1,4);
valor_mse = zeros(1,4);
RL = zeros(1,4);
RA = zeros(1,4);
Corr = cell(1,4);

cA=cell(1,4);
cH=cell(1,4);
cV=cell(1,4);
cD=cell(1,4);

cArS=cell(1,4);
cHrS=cell(1,4);
cVrS=cell(1,4);
cDrS=cell(1,4);

cArH=cell(1,4);
cHrH=cell(1,4);
cVrH=cell(1,4);
cDrH=cell(1,4);

Wait = waitbar(0,'Filtrando...');
pasos = l1^3*l2^3*l3^3*length(filtros);
paso = 0;


cA{1} = im_ecografo;
for wt = 1:length(filtros)                                                 %% Descompongo todos los coeficientes de DWT, filtro rearmo y guardo... así por cada mother
    for k = 1:3
        [cA{k+1},cH{k+1},cV{k+1},cD{k+1}]=dwt2(cA{k},filtros{wt},'mode','per');
    end
    cArS{4}=cA{4};
    cArH{4}=cA{4};
    
    for h=1:l1
        cHrH{h,2}  = wthresh(cH{2},'h',th_nivel1(h));                            %aplico umbral a coeficientes horizontales nivel 1
        cHrS{h,2}  = wthresh(cH{2},'s',th_nivel1(h));
        cVrH{h,2}  = wthresh(cV{2},'h',th_nivel1(h));                            %aplico umbral a coeficientes verticales nivel 1
        cVrS{h,2}  = wthresh(cV{2},'s',th_nivel1(h));
        cDrH{h,2}  = wthresh(cD{2},'h',th_nivel1(h));                            %aplico umbral a coeficientes diagonales nivel 1
        cDrS{h,2}  = wthresh(cD{2},'s',th_nivel1(h));
    end
    
    for i=1:l2
        cHrH{i,3}  = wthresh(cH{3},'h',th_nivel2(i));                            %aplico umbral a coeficientes horizontales nivel 2
        cHrS{i,3}  = wthresh(cH{3},'s',th_nivel2(i));
        cVrH{i,3}  = wthresh(cV{3},'h',th_nivel2(i));                            %aplico umbral a coeficientes verticales nivel 2
        cVrS{i,3}  = wthresh(cV{3},'s',th_nivel2(i));
        cDrH{i,3}  = wthresh(cD{3},'h',th_nivel2(i));                            %aplico umbral a coeficientes diagonales nivel 2
        cDrS{i,3}  = wthresh(cD{3},'s',th_nivel2(i));
    end
    
    for j=1:l3
        cHrH{j,4}  = wthresh(cH{4},'h',th_nivel3(j));                            %aplico umbral a coeficientes horizontales nivel 3
        cHrS{j,4}  = wthresh(cH{4},'s',th_nivel3(j));
        cVrH{j,4}  = wthresh(cV{4},'h',th_nivel3(j));                            %aplico umbral a coeficientes verticales nivel 3
        cVrS{j,4}  = wthresh(cV{4},'s',th_nivel3(j));
        cDrH{j,4}  = wthresh(cD{4},'h',th_nivel3(j));                            %aplico umbral a coeficientes diagonales nivel 3
        cDrS{j,4}  = wthresh(cD{4},'s',th_nivel3(j));
    end
    
    for d3 = 1:l3
        for v3=1:l3
            for h3=1:l3
                cArS{3}=idwt2(cArS{4},cHrS{h3,4},cVrS{v3,4},...
                    cDrS{d3,4},filtros{wt},'mode','per');
                cArH{3}=idwt2(cArH{4},cHrH{h3,4},cVrH{v3,4},...
                    cDrH{d3,4},filtros{wt},'mode','per');
                
                for d2=1:l2
                    for v2=1:l2
                        for h2=1:l2
                            cArS{2}=idwt2(cArS{3},cHrS{h2,3},cVrS{v2,3},...
                                cDrS{d2,3},filtros{wt},'mode','per');
                            cArH{2}=idwt2(cArH{3},cHrH{h2,3},cVrH{v2,3},...
                                cDrH{d2,3},filtros{wt},'mode','per');
                            
                            for d1=1:l1
                                for v1=1:l1
                                    for h1=1:l1
                                        
                                        ord=h1+(v1-1)*l1+(d1-1)*l1^2+(h2-1)*l1^3+(v2-1)...
                                            *l2*l1^3+(d2-1)*l2^2*l1^3+(h3-1)*l2^3*l1^3+(v3-1)*l3*...
                                            l2^3*l1^3+(d3-1)*l3^2*l2^3*l1^3;
                                        
                                        cArS{1}=idwt2(cArS{2},cHrS{h1,2},cVrS{v1,2},...
                                            cDrS{d1,2},filtros{wt},'mode','per');

                                        Imagen = uint8(cArS{1}*255);
                                        save(strcat(pwd,'\temp\',filtros{wt},'_Soft_',num2str...
                                            (ord)),'Imagen');
                                      
                                        
                                        valor_mse(1)=mean(mean((im_referencia_crop{1} - imcrop(cArS{1},...
                                            Recorte{1})).^2));
                                        valor_mse(2)=mean(mean((im_referencia_crop{2} - imcrop(cArS{1},...
                                            Recorte{2})).^2));
                                        valor_mse(3)=mean(mean((im_referencia_crop{3} - imcrop(cArS{1},...
                                            Recorte{3})).^2));
                                        valor_mse(4)=mean(mean((im_referencia_crop{4} - imcrop(cArS{1},...
                                            Recorte{4})).^2));
                                        
                                        Resultadopsnr1(wt,ord)=round(10*log10(1./ valor_mse(1)),3);
                                        
                                        Resultadopsnr2(wt,ord)=round(10*log10(1./ valor_mse(2)),3);
                                        
                                        Resultadopsnr3(wt,ord)=round(10*log10(1./ valor_mse(3)),3);
                                        
                                        Resultadopsnr4(wt,ord)=round(10*log10(1./ valor_mse(4)),3);
                                        
                                        ResultadoCG12(wt,ord)=(mean(mean(imcrop(cArS{1},Recorte{1})))/mean(mean(imcrop(cArS{1},Recorte{2}))))/CG12;
                                        
                                        ResultadoCG23(wt,ord)=(mean(mean(imcrop(cArS{1},Recorte{2})))/mean(mean(imcrop(cArS{1},Recorte{3}))))/CG23;
                                        
                                        ResultadoCG34(wt,ord)=(mean(mean(imcrop(cArS{1},Recorte{3})))/mean(mean(imcrop(cArS{1},Recorte{4}))))/CG34;
                                        
                                        ResultadoCG41(wt,ord)=(mean(mean(imcrop(cArS{1},Recorte{4})))/mean(mean(imcrop(cArS{1},Recorte{1}))))/CG41;
                                        
                                        for p0=1:4
                                            Imagen=imcrop(cArS{1},Recorte{p0});
                                            [Aux, idx] = max(Imagen(:));
                                            val(p0)=max(Aux);
                                            [Pico(1,p0), Pico(2,p0)]=ind2sub(size(Imagen),idx);
                                            RA(p0)=sum(Imagen(:,Pico(2,p0))/val(p0)>0.5);
                                            RL(p0)=sum(Imagen(Pico(1,p0),:)/val(p0)>0.5);
                                        end
                                        
                                        
                                        ResultadoLateral1(wt,ord)=RL(1);
                                        
                                        ResultadoAxial1(wt,ord)=RA(1);
                                        
                                        ResultadoLateral2(wt,ord)=RL(2);
                                        
                                        ResultadoAxial2(wt,ord)=RA(2);
                                        
                                        ResultadoLateral3(wt,ord)=RL(3);
                                        
                                        ResultadoAxial3(wt,ord)=RA(3);
                                        
                                        ResultadoLateral4(wt,ord)=RL(4);
                                        
                                        ResultadoAxial4(wt,ord)=RA(4);
                                                                                
                                        cArH{1}=idwt2(cArH{2},cHrH{h1,2},cVrH{v1,2},...
                                            cDrH{d1,2},filtros{wt},'mode','per');
                                        
                                        Imagen = uint8(cArH{1}*255);
                                        save(strcat(pwd,'\temp\',filtros{wt},'_Hard_',num2str...
                                            (ord)),'Imagen');

                                        valor_mse(1)=mean(mean((im_referencia_crop{1} - imcrop(cArH{1},...
                                            Recorte{1})).^2));
                                        valor_mse(2)=mean(mean((im_referencia_crop{2} - imcrop(cArH{1},...
                                            Recorte{2})).^2));
                                        valor_mse(3)=mean(mean((im_referencia_crop{3} - imcrop(cArH{1},...
                                            Recorte{3})).^2));
                                        valor_mse(4)=mean(mean((im_referencia_crop{4} - imcrop(cArH{1},...
                                            Recorte{4})).^2));
                                        
                                        Resultadopsnr1(wt+length(filtros),ord)=round(10*log10(1./ valor_mse(1)),3);
                                        
                                        Resultadopsnr2(wt+length(filtros),ord)=round(10*log10(1./ valor_mse(2)),3);
                                        
                                        Resultadopsnr3(wt+length(filtros),ord)=round(10*log10(1./ valor_mse(3)),3);
                                        
                                        Resultadopsnr4(wt+length(filtros),ord)=round(10*log10(1./ valor_mse(4) ),3);
                                        
                                        ResultadoCG12(wt+length(filtros),ord)=(mean(mean(imcrop(cArH{1},Recorte{1})))/mean(mean(imcrop(cArH{1},Recorte{2}))))/CG12;
                                        
                                        ResultadoCG23(wt+length(filtros),ord)=(mean(mean(imcrop(cArH{1},Recorte{2})))/mean(mean(imcrop(cArH{1},Recorte{3}))))/CG23;
                                        
                                        ResultadoCG34(wt+length(filtros),ord)=(mean(mean(imcrop(cArH{1},Recorte{3})))/mean(mean(imcrop(cArH{1},Recorte{4}))))/CG34;
                                        
                                        ResultadoCG41(wt+length(filtros),ord)=(mean(mean(imcrop(cArH{1},Recorte{4})))/mean(mean(imcrop(cArH{1},Recorte{1}))))/CG41;
                                        
                                        for p0=1:4
                                            Imagen=imcrop(cArH{1},Recorte{p0});
                                            [Aux, idx] = max(Imagen(:));
                                            val(p0)=max(Aux);
                                            [Pico(1,p0), Pico(2,p0)]=ind2sub(size(Imagen),idx);
                                            RA(p0)=sum(Imagen(:,Pico(2,p0))/val(p0)>0.5);
                                            RL(p0)=sum(Imagen(Pico(1,p0),:)/val(p0)>0.5);
                                        end
                                        
                                        ResultadoLateral1(wt+length(filtros),ord)=RL(1);
                                        
                                        ResultadoAxial1(wt+length(filtros),ord)=RA(1);
                                        
                                        ResultadoLateral2(wt+length(filtros),ord)=RL(2);
                                        
                                        ResultadoAxial2(wt+length(filtros),ord)=RA(2);
                                        
                                        ResultadoLateral3(wt+length(filtros),ord)=RL(3);
                                        
                                        ResultadoAxial3(wt+length(filtros),ord)=RA(3);
                                        
                                        ResultadoLateral4(wt+length(filtros),ord)=RL(4);
                                        
                                        ResultadoAxial4(wt+length(filtros),ord)=RA(4);
                                        
                                        paso=paso+1;
                                        waitbar(paso / pasos);
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

Resultadopsnr0(1)=round(10*log10(1./(mean(mean((im_referencia_crop{1}-imcrop(im_ecografo,Recorte{1})).^2)))),3);
Resultadopsnr0(2)=round(10*log10(1./(mean(mean((im_referencia_crop{2}-imcrop(im_ecografo,Recorte{2})).^2)))),3);
Resultadopsnr0(3)=round(10*log10(1./(mean(mean((im_referencia_crop{3}-imcrop(im_ecografo,Recorte{3})).^2)))),3);
Resultadopsnr0(4)=round(10*log10(1./(mean(mean((im_referencia_crop{4}-imcrop(im_ecografo,Recorte{4})).^2)))),3);

close(Wait)
load(strcat(pwd,'/temp/',filtros{1},'_Soft_1'))
Resultado=Imagen;

Resultadoactual1=Resultadopsnr1;
Resultadoactual2=Resultadopsnr2;
Resultadoactual3=Resultadopsnr3;
Resultadoactual4=Resultadopsnr4;

Resultadonorm1=Resultadopsnr1-Resultadopsnr0(1);
Resultadonorm2=Resultadopsnr2-Resultadopsnr0(2);
Resultadonorm3=Resultadopsnr3-Resultadopsnr0(3);
Resultadonorm4=Resultadopsnr4-Resultadopsnr0(4);

Lista_indice={'PSNR'; 'CG'; 'RL'; 'RA'};

Linea1 = 'PSNR1';
Linea2 = 'PSNR2';
Linea3 = 'PSNR3';
Linea4 = 'PSNR4';
Indice = ' dB';

run Reconstruccion_US_06


