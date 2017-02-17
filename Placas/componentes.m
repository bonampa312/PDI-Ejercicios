function b = componentes(a)
    [fil,col,cap]=size(a);
    if cap==1; b=a; return;end
    rgb=normaliza(a);
    b=rgb;
    rgb=normaliza(a);
    hsi=rgb2hsv(a);
    hsi=normaliza(hsi);
    cform=makecform('srgb2cmyk'); % cyan, magenta, yello, black
    cmyk=applycform(a,cform);
    % b=[rgb;hsi];
    k=cmyk(:,:,4);k=[k,k,k];
    cmy=cmyk(:,:,1:3);
    % El color negro no es importante, por lo tanto se reduce la matriz
    cmy=normaliza(cmy);
    b=[rgb;hsi;cmy;k];
    cform=makecform('srgb2lab');
    lab=applycform(a,cform);
    lab=normaliza(lab);
    cform=makecform('lab2lch');
    lch=applycform(a,cform);
    lch=normaliza(lch);
    b=[rgb,hsi;cmy,k;lab,lch];
end

