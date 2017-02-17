clear all, close all, clc

%a = imread('peper.jpg'); % -- figure(1);imshow(a)
a = imread('sparkies.jpg'); % -- figure(1);imshow(a)
[fil,col,cap]=size(a);
a1 = reshape(a,[fil,col*cap]);
% -- figure(2); imshow(a1);title('R-G-B');impixelinfo
%Formato de color HSV
a2 = rgb2hsv(a);
% -- figure(3); imshow(a2)
a2 = double(a2);a2=a2/max(a2(:))*255;
a2 = uint8(a2);
a2 = reshape(a2,[fil,col*cap]);
% -- figure(4);imshow([a1;a2]);title('R-G-B ; H-S-I');impixelinfo

% Nuevo ormato de Matlab para los formatos de color
cform = makecform('srgb2lab');
a3 = applycform(a,cform);
a3 = double(a3); a3 = a3/max(a3(:))*255;
a3 = uint8(a3);
b = a3(:,:,3);
a3 = reshape(a3,[fil,col*cap]);
%figure(5);imshow([a1;a2;a3]);title('RGB; HSV; LAB');impixelinfo
% Extraer un color X=200 de la imagen
figure(6);imshow(b);impixelinfo
b(b<180)=0;
b(b>0)=255;
%figure(7);imshow(b);impixelinfo

%Reemplazar esa máscara que quedó por el color original
b = [b,b,b]; b=reshape(b,[fil,col,cap]);
a4 = a; a4(b==0)=0;
figure(8);imshow(a4);impixelinfo