% finds lacunarity of scanlines: developed by Ankur Roy and Tapan Mukerji (2016)
clear;
SCAN=load('pedrnls_gr.dat');

% to find lacunarity

%c is total no. of window sizes used 
[ncol] = length(SCAN);N=ncol
steps = input('number of boxes to skip between two window sizes ');

c=0; 
for w = 1:steps:N
    c=c+1;
end
lacSCAN=rand(c,1);box_size=(1:steps:N)';
tic; c=0;
for wind=1:steps:N
    mom1=0; v=0; mom2=0; wind

w = ones(1,wind);
s = conv(SCAN,w,'valid');

mom1 = mean(s);
v=var(s,1);
mom2 = mom1^2+v;

c=c+1;
lacSCAN(c) = mom2/(mom1^2);
end
time=toc
L = [box_size,lacSCAN];
dlmwrite('lac_pedrnls_gr.out',L);
dlmwrite('timetaken.out',time);

