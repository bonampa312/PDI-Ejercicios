function [bn,s,y,b,c] = componentes2(a)
    [fil,col,cap]=size(a);
    if cap==1; b=a; return;end
    rgb=normaliza(a);
    b=rgb;
    rgb=normaliza(a);
    hsi=rgb2hsv(a);
    hsi=normaliza(hsi);
    cform=makecform('srgb2cmyk'); % cyan, magenta, yello, black
    cmyk=applycform(a,cform);
    k=cmyk(:,:,4);k=[k,k,k];
    cmy=cmyk(:,:,1:3);
    % El color negro no es importante, por lo tanto se reduce la matriz
    cmy=normaliza(cmy);
    cform=makecform('srgb2lab');
    lab=applycform(a,cform);
    lab=normaliza(lab);
    cform=makecform('lab2lch');
    lch=applycform(a,cform);
    lch=normaliza(lch);
    
    bn=rgb(:,(col*2+1):col*3);
    bn=255-bn;
    s=hsi(:,(col+1):col*2);
    y=cmy(:,(col*2+1):col*3);
    b=lab(:,(col*2+1):col*3);
    c=lch(:,(col+1):col*2);    
end

