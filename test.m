close
clc
% Version 1.0
% Armenia,Quíndio - Colombia
% Set frequency
f = input('Set Frequency: ');
% Set amplitude 
a = input('Set Amplitude: ');
%time points
N=1000;
t=linspace(0,1,N);
cos=[];
sin=[];


for j =1:N
% Call CORDIC algorithm
v=cordic(2*f*t(j)*180);

cos(j)=a.*v(1);
sin(j)=a.*v(2);

end


if f>1
  for i=2:f
    cos((i-1)*N/f:(i)*N/f)=cos(1:N/f+1);
    sin((i-1)*N/f:(i)*N/f)=sin(1:N/f+1);
  end
end

%Graph
plot(t,cos)
title('Cos')
xlabel('Time (s)')
ylabel('Amplitude')
figure
plot(t,sin)
title('Sin')
xlabel('Time (s)')
ylabel('Amplitude')
 
   
    
    

