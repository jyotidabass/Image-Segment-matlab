clc;
clear all;
close all;
warning off
RGB=imread("1E6AE7E2-F4F6-4EFC-AFEC-75B6AF988C47 - Abhishek Karekar.jpeg");
subplot(131);
imshow(RGB);
title('Original Image');
[BW, maskedImage]= segmentImage(RGB);
subplot(132);
imshow(BW)
title('Segmented Binary Image');
subplot(133);
imshow(maskedImage);
title('Segmented Image');
    J = rgb2gray(maskedImage);
   figure, imshow(J);
   K=adapthisteq(J);
   imshow(K)
   a=double(K);
   p=size(a);
   w=[1 1 1;1 1 1;1 1 1];
   for x=2:1:p(1)-1
       for y=2:1:p(2)-1
           a1=[w(1)*a(x-1,y-1) w(2)*a(x-1,y) w(3)*a(x-1,y+1) w(4)*a(x,y-1) w(5)*a(x,y) w(6)*a(x,y+1) w(7)*a(x+1,y-1) w(8)*a(x+1,y) w(9)*a(x+1,y+1)];
           A(x,y)=min(a1);
           sharp(x,y)= double(a(x,y))-double(A(x,y));
       end
   end
   imshow(a)
   figure
   imshow(A)
   figure
   imshow(sharp)