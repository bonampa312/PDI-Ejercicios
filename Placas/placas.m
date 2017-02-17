clear all; close all; clc;
a=imread('carro.jpg'); a=imresize(a,0.6);
[fil,col,cap]=size(a);
%figure(1);imshow(a);
%b=componentes(a);
%figure(2);imshow(b);impixelinfo
[bn,s,y,b,c]=componentes2(a);
figure(3);imshow([bn,s,y;b,c,c]);impixelinfo
min1=min(s,y);
figure(4);imshow(min1);impixelinfo;
pix = impixel;
min1(min1<min(pix(:)))=0;
min1(min1>0)=255;
%figure(5);imshow(min1);impixelinfo
min1=[min1,min1,min1];
min1=reshape(min1,[fil,col,cap]);
a(min1==0)=0;
figure(6);imshow(a);