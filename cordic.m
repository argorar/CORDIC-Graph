function v=cordic(angulo)
%constant
A=1.6467;
K=0.6073;
x=1.0/A;
y=0.0;
di=0;
%temp
ang_original=angulo;
%iterations
n = 11;
%angle table
angulos =  [  ...
    0.78539816339745   0.46364760900081   0.24497866312686   0.12435499454676 ...
    0.06241880999596   0.03123983343027   0.01562372862048   0.00781234106010 ...
    0.00390623013197   0.00195312251648   0.00097656218956   0.00048828121119 ...
    0.00024414062015   0.00012207031189   0.00006103515617   0.00003051757812 ...
    0.00001525878906   0.00000762939453   0.00000381469727   0.00000190734863 ...
    0.00000095367432   0.00000047683716   0.00000023841858   0.00000011920929 ...
    0.00000005960464   0.00000002980232   0.00000001490116   0.00000000745058 ];
%convert to degrees    
angulos=angulos.*(180/pi);

%transferring first quadrant
if (angulo <= 180&& angulo > 90)
    angulo= angulo -90;  
    end
if(angulo > 180 && angulo <= 270)
    angulo = angulo-180;  
    end
if(angulo > 270 && angulo <= 360)
   angulo =angulo -270;    
    end
z=angulo;

%para la rotacion se define el signo
%en donde, di = -1 si zi ≥ 0 ; di=1 zi yi < 0     ecuacion 1.12
for j = 0:n-1;
    if z < 0
        di = -1;
    else
        di = 1;
    end
    %ecuacion 1.14
    newx=x-(y*di*2^(-j));
    newy=y+(x*di*2^(-j));
    x=newx;
    y=newy;
    z=z-(di*angulos(j+1));
    
end

if (ang_original <= 180&& ang_original > 90)
    temp=y;
    y=x;
    x=-temp;
    end
if(ang_original> 180 && ang_original <= 270)
    
    x=-x;
    y=-y;
    end
if(ang_original > 270 && ang_original <= 360)
   temp =y;
  y=-x;
   x=temp;
    end
v=[x y];

