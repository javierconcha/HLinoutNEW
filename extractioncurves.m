cd /Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/

%% % Wavelength
% % % wave (wavelength band-center values)
lambda = [  3.52500E+02  3.57500E+02  3.62500E+02  3.67500E+02  3.72500E+02  3.77500E+02  3.82500E+02  3.87500E+02  3.92500E+02  3.97500E+02...
  4.02500E+02  4.07500E+02  4.12500E+02  4.17500E+02  4.22500E+02  4.27500E+02  4.32500E+02  4.37500E+02  4.42500E+02  4.47500E+02...
  4.52500E+02  4.57500E+02  4.62500E+02  4.67500E+02  4.72500E+02  4.77500E+02  4.82500E+02  4.87500E+02  4.92500E+02  4.97500E+02...
  5.02500E+02  5.07500E+02  5.12500E+02  5.17500E+02  5.22500E+02  5.27500E+02  5.32500E+02  5.37500E+02  5.42500E+02  5.47500E+02...
  5.52500E+02  5.57500E+02  5.62500E+02  5.67500E+02  5.72500E+02  5.77500E+02  5.82500E+02  5.87500E+02  5.92500E+02  5.97500E+02...
  6.02500E+02  6.07500E+02  6.12500E+02  6.17500E+02  6.22500E+02  6.27500E+02  6.32500E+02  6.37500E+02  6.42500E+02  6.47500E+02...
  6.52500E+02  6.57500E+02  6.62500E+02  6.67500E+02  6.72500E+02  6.77500E+02  6.82500E+02  6.87500E+02  6.92500E+02  6.97500E+02...
  7.02500E+02  7.07500E+02  7.12500E+02  7.17500E+02  7.22500E+02  7.27500E+02  7.32500E+02  7.37500E+02  7.42500E+02  7.47500E+02...
  7.52500E+02  7.57500E+02  7.62500E+02  7.67500E+02  7.72500E+02  7.77500E+02  7.82500E+02  7.87500E+02  7.92500E+02  7.97500E+02...
  8.02500E+02  8.07500E+02  8.12500E+02  8.17500E+02  8.22500E+02  8.27500E+02  8.32500E+02  8.37500E+02  8.42500E+02  8.47500E+02...
  8.52500E+02  8.57500E+02  8.62500E+02  8.67500E+02  8.72500E+02  8.77500E+02  8.82500E+02  8.87500E+02  8.92500E+02  8.97500E+02...
  9.02500E+02  9.07500E+02  9.12500E+02  9.17500E+02  9.22500E+02  9.27500E+02  9.32500E+02  9.37500E+02  9.42500E+02  9.47500E+02...
  9.52500E+02  9.57500E+02  9.62500E+02  9.67500E+02  9.72500E+02  9.77500E+02  9.82500E+02  9.87500E+02  9.92500E+02  9.97500E+02...
  1.00250E+03  1.00750E+03  1.01250E+03  1.01750E+03  1.02250E+03  1.02750E+03  1.03250E+03  1.03750E+03  1.04250E+03  1.04750E+03];
lambda = lambda';

OLIbands = [443 482 562 655 865 1375 1610 2200];

% rc = load('tempRrc.txt');
rc = load('tempRNimaCon8.txt');
win = load('tempRwin.txt');
% RADMa.txt Ed.txt RAD0Ma.txt
%% RADMa (diffuse upward radiances in air (water-leaving radiances))
figure
fs = 15;
set(gcf,'color','white')
plot(lambda,rc(:,1))
title('RADMa (water-leaving radiance)','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('radiance [W/m^2/sr/nm]','fontsize',fs)
hold on
plot(lambda,win(:,1),'r')
set(gca,'fontsize',fs)
legend('Research Computing','Windows')
%% Difference between RADMa runs
dif = rc(:,1)-win(:,1);
figure
fs = 15;
set(gcf,'color','white')
plot(lambda,dif)
title('Difference in RADMa between RC and Win','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('radiance [W/m^2/sr/nm]','fontsize',fs)

set(gca,'fontsize',fs)

Erms = sqrt(sum(dif.^2/size(dif,1)))
%% Ed (downwelling plane irradiance)
figure
fs = 15;
set(gcf,'color','white')
plot(lambda,rc(:,2))
title('Ed (downwelling plane irradiance)','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('irradiance [W/m^2]','fontsize',fs)
hold on
plot(lambda,win(:,2),'r')
set(gca,'fontsize',fs)
legend('Research Computing','Windows')
%% RAD0Ma (direct upward radiances in air (surface-reflected sky radiance))
figure
fs = 15;
set(gcf,'color','white')
plot(lambda,rc(:,3))
title('RAD0Ma (surface-reflected sky radiance)','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('radiance [W/m^2/sr/nm]','fontsize',fs)
hold on
plot(lambda,win(:,3),'r')
set(gca,'fontsize',fs)
%% Difference between RAD0Ma runs
% figure
% fs = 15;
% set(gcf,'color','white')
% plot(lambda,rc(:,3)-win(:,3))
% title('Difference in RAD0Ma','fontsize',fs)
% xlabel('wavelength [nm]','fontsize',fs)
% ylabel('radiance [W/m^2/sr/nm]','fontsize',fs)
% 
% set(gca,'fontsize',fs)
%%
% % magic pi: L=E/pi
% figure
% fs = 15;
% set(gcf,'color','white')
% plot(lambda,rc(:,3)*pi./rc(:,2))
% title('percentage reflected from sky','fontsize',fs)
% xlabel('wavelength [nm]','fontsize',fs)
% ylabel('%','fontsize',fs)
% 
% set(gca,'fontsize',fs)

%% Remote Sensing Reflectance w/o pi - part a
% Rrs = L*pi/Ed
Lw = rc(:,1);
Ed = rc(:,2);
Rrs = Lw./Ed;
figure
fs = 15;
set(gcf,'color','white')
plot(lambda,Rrs)
title('Remote Sensing Reflectance','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('R_{rs} [sr^{-1}]','fontsize',fs)
set(gca,'fontsize',fs)
% ylim([0 1])

%% Remote Sensing Reflectance w/ pi - part b
% Rrs = L*pi/Ed
Lw = rc(:,1);
Ed = rc(:,2);
Rrs = Lw*pi./Ed;
figure
fs = 15;
set(gcf,'color','white')
plot(lambda,Rrs)
title('Remote Sensing Reflectance','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
% ylim([0 1])
%%
xx = [lambda,Rrs];
save('darkpixel.txt','xx','-ascii')
