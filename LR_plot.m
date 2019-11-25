% Calculating and plotting of LR-curve: developed by Ankur Roy (2016)
clear;
data=load('lac_pedrnls_gr.out');Ld=data(:,2);r=data(:,1);Ldiv_all=[];
for k = 1:100
    filename = sprintf('lac_pedrnls_ranap%d.out',k);
 random=load(filename);N=length(random);
   Lr=random(:,2);
Ldiv=Ld./Lr;

for i = 1:length(Ldiv)
    if Lr(i)==0 
        Ldiv(i)=0;
    end
end
Ldiv_all=[Ldiv_all, Ldiv];
end
p25=prctile(Ldiv_all,25,2);p75=prctile(Ldiv_all,75,2);
p50=prctile(Ldiv_all,50,2); Lavg=mean(Ldiv_all,2);

%log-plot
plot(log10(r),p25,'b:', log10(r),p75,'b:', log10(r),Lavg,'b'); xlabel('log r(mm)'); ylabel('Ldata / Lran');
% arithmetic-scale% plot(r,p25,'b:', r,p75,'b:', r,Lavg,'b'); xlabel('r(mm)'); ylabel('Ldata / Lran')
hold on;
%plot(log10(r),p50,'m')
hold on; 
plot(log10(r),ones(N,1),'r')
% aritmetic scale% plot(r,ones(N,1),'r')