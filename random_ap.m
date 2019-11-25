%randomize aperture unalterd sp: generate multiple k realizations by Ankur Roy 2014
k=input('number of random realizations...');
 for ii = 1:k
     
  SCAN=load('pedrnls_ap.dat');N=length(SCAN)
  AP=SCAN(SCAN~=0);lap=length(AP);
  c2=0;
  APran=AP(randperm(lap));
 for c = 1:N
 if SCAN(c)~=0 
     c2=c2+1;
 SCAN(c)=APran(c2);
 end
 end
 
 filename = sprintf('pedrnls_ranap%d.dat',ii);
dlmwrite(filename,SCAN);
clear
 end
