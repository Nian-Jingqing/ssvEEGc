close all;
clear all;
clc;

%--------------------II_Ia--------------------------------------
ri=[0.6581	0.7527	0.7638	0.7627	0.7685	0.7767	0.7796	0.788	0.7821	0.7881	0.7762];
fscore=[0.4346	0.5955	0.6109	0.6139	0.6098	0.6174	0.6231	0.6246	0.6298	0.6285	0.6003];
kappa=[0.2613 0.4823 0.5109	0.5073	0.5094	0.5321	0.5338	0.5531	0.5407	0.5513	0.5365];

[n m]=size(ri);
t=1:m;
plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->','Linewidth',2);
legend('RI','F-score','kappa');
set(gca,'xticklabel',{'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
set(gca,'FontName','Times New Roman','FontSize',13);
xlabel('\alpha');
title('Impact of \alpha on ssvEEGc with II\_Ia\_Ib');