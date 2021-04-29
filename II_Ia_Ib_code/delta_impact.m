close all;
clear all;
clc;


ri = [0.7139 0.7214 0.7501 0.7636 0.7734 0.788;
      0.7139 0.7214 0.7501 0.7636 0.7734 0.788;
      0.7139 0.7214 0.7501 0.7636 0.7734 0.788;];

fscore = [0.3003 0.4561 0.5697 0.6036 0.6061 0.6246;
          0.3003 0.4561 0.5697 0.6036 0.6061 0.6246;
          0.3003 0.4561 0.5697 0.6036 0.6061 0.6246;];
            
kappa = [0.3687 0.3603 0.4598 0.4979 0.5129 0.5531;
         0.3687 0.3603 0.4598 0.4979 0.5129 0.5531;
         0.3687 0.3603 0.4598 0.4979 0.5129 0.5531;];



bar(ri);

axis([0.6 1.4 0.67 0.80]);
colormap(jet);
set(gca,'XTickLabel',{'RI','F-score','\kapp'});
% legend('\delta1','\delta2','\delta3','\delta4','\delta5', );
set(gca,'YGrid','on');
set(gca,'XGrid','on');
set(gca,'position',[0.2,0.1,0.2,0.8]) 
set(gca,'FontName','Times New Roman','FontSize',13)
% title('CoGEEGc with different distance measures on #15 dataset');

