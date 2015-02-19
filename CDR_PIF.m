cd /Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/
%%
% Basic Stats       Min     Max          Mean          Stdev

% tt = load('OntarioBeachSmall_AllBandstat.txt');
% tt = load('PIFstatAll.txt'); % less conservative and based in DN
% tt = load('PIFstat.txt');% more conservative and based in lndsr
tt = load('PIFstatImproved.txt');% with PIFmaskFINAL.txt


nscenes = size(tt,1)/6;
OBSmean = 0.0001*reshape(tt(:,3),6,nscenes);

% OBSmean = [OBSmean(:,1:3) OBSmean(:,5:end)];

L5bands = [0.485, 0.56, 0.66, 0.83, 1.65, 2.22];

figure 
fs = 15;
set(gcf,'color','white')
plot(L5bands,OBSmean)
legend('0115','0179','0307','1133','1165'...
    ,'1293','1325','1341','2216','Location','EastOutside');
tit = sprintf('PIF Mean Reflectance, %i scenes',nscenes)
title(tit,'fontsize',fs)
xlabel('wavelength [um]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
axis([0.450 2.500 0 0.2])

hold on
% 427 478 546 608 659 724 831 908x
m = get(gca,'ylim');
lw = 1.0;
line([L5bands(1) L5bands(1)],m,'Color','b','LineWidth',lw)
line([L5bands(2) L5bands(2)],m,'Color','g','LineWidth',lw)
line([L5bands(3) L5bands(3)],m,'Color','r','LineWidth',lw)
line([L5bands(4) L5bands(4)],m,'Color','k','LineWidth',lw)
line([L5bands(5) L5bands(5)],m,'Color','k','LineWidth',lw)
line([L5bands(6) L5bands(6)],m,'Color','k','LineWidth',lw)
%% R vs zenith angle
disp('----------------------------------------')
disp('Band n: p(1)      p(2))    r-sq     rmse')
elev = [
53.0585481;
60.8539184;
28.9114026;
58.4972934;
61.7975978;
33.1355268;
23.9517443;
21.0272145;
55.3237096];

zenith = 90-elev';

[m1,y01] = refvszenith(1,OBSmean,zenith);
[m2,y02] = refvszenith(2,OBSmean,zenith);
[m3,y03] = refvszenith(3,OBSmean,zenith);
[m4,y04] = refvszenith(4,OBSmean,zenith);
[m5,y05] = refvszenith(5,OBSmean,zenith);
[m6,y06] = refvszenith(6,OBSmean,zenith);

X = [min(zenith) max(zenith)];
Y = [min(zenith)*m1+y01 max(zenith)*m1+y01;
    min(zenith)*m2+y02 max(zenith)*m2+y02;
    min(zenith)*m3+y03 max(zenith)*m3+y03;
    min(zenith)*m4+y04 max(zenith)*m4+y04;
    min(zenith)*m5+y05 max(zenith)*m5+y05;
    min(zenith)*m6+y06 max(zenith)*m6+y06];




%% Plot different curves

figure
fs = 15;
set(gcf,'color','white')
plot(X,Y')
hold on
% ylim([0 1])

title('Different fit curves','fontsize',fs)
xlabel('zenith [\circ]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
legend('band 1','band 2','band 3','band 4','band 5'...
    ,'band 6');

%% Correct zenith angle
sat_angle = 45.53970398;
CDR45degrees = [sat_angle*m1+y01;
     sat_angle*m2+y02;
     sat_angle*m3+y03;
     sat_angle*m4+y04;
     sat_angle*m5+y05;
     sat_angle*m6+y06];
 
figure 
fs = 15;
set(gcf,'color','white')
plot(L5bands,OBSmean)
hold on
plot(L5bands,CDR45degrees,'*-r','linewidth',1.5)
legend('0115','0179','0307','1133','1165'...
    ,'1293','1325','1341','2216','zenith = 45\circ','Location','EastOutside');
tit = sprintf('PIF Mean Reflectance, %i scenes',nscenes);
title(tit,'fontsize',fs)
xlabel('wavelength [\mum]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
axis([0.450 2.500 0 0.2])

hold on
% 427 478 546 608 659 724 831 908
m = get(gca,'ylim');
lw = 1.0;
line([0.485 0.485],m,'Color','b','LineWidth',lw)
line([0.56 0.56],m,'Color','g','LineWidth',lw)
line([0.66 0.66],m,'Color','r','LineWidth',lw)
line([0.83 0.83],m,'Color','k','LineWidth',lw)
line([1.65 1.65],m,'Color','k','LineWidth',lw)
line([2.22 2.22],m,'Color','k','LineWidth',lw)
%% applying solar zenith correction factor in CDR PIF reflectance spectra
L8bands = [0.4430,0.4826,0.5613,0.6546,0.8646,1.6090,2.2010];

CDR115 = OBSmean(:,1);

figure
fs = 15;
set(gcf,'color','white')
plot(L5bands,CDR115)
hold on
plot(L5bands,CDR45degrees,'*-r')
legend('0115;zenith = 37^\circ','zenith = 45^\circ')
xlabel('wavelength [\mum]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
xlim([.4 2.5])
% ylim([0 .17])
%% 
% figure 
% fs = 15;
% set(gcf,'color','white')
% plot(1:6,OBSmean./(max(OBSmean,[],2)*ones(1,9)))
% legend('0115','0179','0307','1133','1165'...
%     ,'1293','1325','1341','2216','Location','EastOutside');
% title('Normalization for the max of each band','fontsize',fs)
% xlabel('band','fontsize',fs)
% ylabel('reflectance','fontsize',fs)
% set(gca,'fontsize',fs)
% % axis([300 1000 0 0.45])

% %% 
% 
% maximum = 5;
% figure 
% fs = 15;
% set(gcf,'color','white')
% plot(1:6,OBSmean./(OBSmean(:,maximum)*ones(1,9)))
% legend('0115','0179','0307','1133','1165'...
%     ,'1293','1325','1341','2216','Location','EastOutside' );
% title('Normalization for the max curve (1165)','fontsize',fs)
% xlabel('band','fontsize',fs)
% ylabel('reflectance','fontsize',fs)
% set(gca,'fontsize',fs)
% % axis([300 1000 0 0.45])

%%

day = [115,179,307,133,165,293,325,341,216];

figure
plot(day,OBSmean(3,:),'.')
%%
band = 1;

A = OBSmean(band,1)*zenith(1)/OBSmean(band,2)/zenith(2)


A*zenith(2)*OBSmean(band,2)/zenith(1)
OBSmean(band,1)
%%
disp('---------------------')
x = 6;
A*zenith(2)*OBSmean(band,2)/zenith(x)
OBSmean(band,x)

% %% zenith equal to zero
% r = [0.128742 0.153118 0.168112 0.225136 0.222973 0.212046];
% 
% figure 
% fs = 15;
% set(gcf,'color','white')
% plot(L5bands,r,'linewidth',1.2)
% % legend('0115','0179','0307','1133','1165'...
% %     ,'1293','1325','1341','2216','Location','EastOutside');
% title('PIF Mean Reflectance with   \sigma_s = 0[\circ]','fontsize',fs)
% xlabel('wavelength [um]','fontsize',fs)
% ylabel('reflectance','fontsize',fs)
% set(gca,'fontsize',fs)
% % axis([0.450 2.500 0 0.2])
% 
% hold on
% % 427 478 546 608 659 724 831 908
% m = get(gca,'ylim');
% lw = 1.0;
% line([0.485 0.485],m,'Color','b','LineWidth',lw)
% line([0.56 0.56],m,'Color','g','LineWidth',lw)
% line([0.66 0.66],m,'Color','r','LineWidth',lw)
% line([0.83 0.83],m,'Color','k','LineWidth',lw)
% line([1.65 1.65],m,'Color','k','LineWidth',lw)
% line([2.22 2.22],m,'Color','k','LineWidth',lw)


plot(L5bands,OBSmean)
%%
% figure 
% fs = 15;
% set(gcf,'color','white')
% plot(1:6,r)
%% Extrapolation City pixel from L5
cd /Users/javier/Desktop/Javier/PHD_RIT/LDCM/InputOutput/

L8bands = [0.4430,0.4826,0.5613,0.6546,0.8646,1.6090,2.2010];

% citypx = [
%     0.4430  0.102244;
%     0.4826  0.102244;
%     0.5613  0.119937;
%     0.6546  0.129334;
%     0.8646  0.155755;
%     1.6090  0.166700;
%     2.2010  0.154745];
citypx = [ L8bands' [CDR45degrees(1,1); CDR45degrees]]; % with the correction for zenith angle equal 45

% darkpx = [
%     0.442491    0.015501;
%     0.482764    0.017912;
%     0.560859    0.013945;
%     0.654205    0.003978;
%     0.863971    0.001249;
%     1.609077    0.000000;
%     2.201533    0.000000];

x1 = citypx(2,1);
x2 = citypx(3,1);
y1 = citypx(2,2);
y2 = citypx(3,2);

m0 = (y2-y1)/(x2-x1);
y0 = y1-m0*x1;

x3 = 0.4430;
y3 = m0*x3+y0;

figure%(gcf)
fs = 15;
set(gcf,'color','white')
hold on
plot(citypx(2:end,1),citypx(2:end,2),'r-*')
% plot(darkpx(:,1)*1000,darkpx(:,2)*100,'g-*')
plot(x3,y3,'*r')
% 427 478 546 608 659 724 831 908x
plot([.4 .7],[(m0*.4+y0) (m0*.7+y0)],'k')
% ylim([0 30])
xlim([.4 2.3])
title('Bright Pixel','fontsize',fs)
xlabel('wavelength [\mum]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
m = get(gca,'ylim');
lw = 1.0;
line([L8bands(1) L8bands(1)],m,'Color','c','LineWidth',lw)
line([L8bands(2) L8bands(2)],m,'Color','b','LineWidth',lw)
line([L8bands(3) L8bands(3)],m,'Color','g','LineWidth',lw)
line([L8bands(4) L8bands(4)],m,'Color','r','LineWidth',lw)
line([L8bands(5) L8bands(5)],m,'Color','m','LineWidth',lw)
line([L8bands(6) L8bands(6)],m,'Color','k','LineWidth',lw)
line([L8bands(7) L8bands(7)],m,'Color','k','LineWidth',lw)

BrigtPx = [y3; citypx(2:end,2)];

RrsDTROC = BrigtPx./pi;

figure
fs = 15;
set(gcf,'color','white')
plot(L8bands,RrsDTROC)


Ref = [L8bands', RrsDTROC];
save('RrsDTROC131909.txt','Ref','-ascii')
