function [im_referencia_crop] = Reconstruccion_US_04(im_ecografo, im_referencia, regiones, pix)
global im_ecografo im_referencia regiones pix im_referencia_crop

im_referencia_crop = cell(4,1);

for i=1:4
    auxiliar_im = imcrop(im_ecografo,[(regiones(i,1)-ceil(pix/2)), (regiones(i,2)-ceil(pix/2)), (pix-1), (pix-1)]);
    auxiliar_ref = imcrop(im_referencia,[(regiones(i,1)-pix), (regiones(i,2)-pix), (pix*2-1), (pix*2-1)]);
    
    correlacion = normxcorr2(double(auxiliar_im),double(auxiliar_ref));
    [punto1, punto2] = find(correlacion==max(correlacion(:)));
   
    im_referencia_crop{i} = imcrop(im_referencia, [(regiones(i,1)-pix+punto1-size(auxiliar_im,2))...
        (regiones(i,2)-pix+punto2-size(auxiliar_im,1)+1) (pix-1) (pix-1)]);
    
end



         run Reconstruccion_US_05_DWT
