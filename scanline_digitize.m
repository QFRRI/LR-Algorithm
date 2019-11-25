%to digitize scanline data: developed by Ankur Roy (2014)
clear;
X=xlsread('scanline_data.xlsx')
S=X(:,1); A=X(:,2);
n=length(S);
Z=[]; ZNA=[];SCAN=[];ZA=[];SCANM=[]; 
for i=1:n
 Z = zeros (1,S(i));
 ZNA = [Z,1]; ZA = [Z,A(i)];
 SCAN = [SCAN, ZNA];
 SCANM = [SCANM, ZA];
end

save pdrnls_sp.dat SCAN -ascii;
save pdrnls_ap.dat SCANM -ascii;
disp('done with digitizing scanline')
