function [m,y0] = refvszenith(bnumber,OBSmean,zenith)
% R vs zenith angle
addpath('/Users/javier/Desktop/Javier/PHD_RIT/LDCM/rsquare')
% bnumber = input('Type band number:');

band = OBSmean(bnumber,:);

% Fitting data
x = zenith;
y = band;
p = polyfit(x,y,1);
m = p(1);
y0 = p(2);
f = polyval(p,x);
[R_squared rmse] = rsquare(y,f);

%% Plot
figure 
fs = 15;
set(gcf,'color','white')
plot(zenith,band,'*','linewidth',1.5)
str = sprintf('PIF Reflectance vs Solar Zenith Angle - Band %s',num2str(bnumber));
title(str,'fontsize',fs)
xlabel('solar zenith angle [\circ]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)

% % reply = input('Do you want "y" limit [0 1]? Y/N [N]: ', 's');
% % if reply == 'Y'||reply =='y'
% %     ylim([0 1])
% % end

figure(gcf)
% ylim([0 1])
xx = get(gca,'xlim'); 		% Get the plotted data
yy = get(gca,'ylim');
x1_text = min(xx)+abs(max(xx)-min(xx))/2;
y1_text = max(yy)-0.2*(max(yy)-min(yy));
y2_text = max(yy)-0.28*(max(yy)-min(yy));
y3_text = max(yy)-0.36*(max(yy)-min(yy));

str = sprintf('y = %f*x+%f',p(1),p(2));
text(x1_text, y1_text,  str,'fontsize',fs)
text(x1_text, y2_text,['R^2 = ' num2str(R_squared)],'fontsize',fs)
text(x1_text, y3_text,['RMSE = ' num2str(rmse)],'fontsize',fs)

hold on

plot([xx(1) xx(2)],[p(1)*xx(1)+p(2) p(1)*xx(2)+p(2)],'-r')
legend('data','linear')


str = sprintf('Band %i: %f %f %f %f',bnumber,p(1),p(2),R_squared,rmse);
disp(str)
