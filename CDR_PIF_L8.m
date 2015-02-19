cd /Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/
%%
% Basic Stats       Min     Max          Mean          Stdev
tt = load('PIFstatImproved_L8.txt');% with PIFmaskFINAL.txt

nbands = 7;
nscenes = size(tt,1)/nbands;
OBSmean = reshape(tt(:,3),nbands,nscenes);

L8bands = [0.4430 0.4826 0.5613 0.6546 0.8646 1.6090 2.2010];

figure 
fs = 15;
set(gcf,'color','white')
plot(L8bands,OBSmean)
legend('3262','4153','4297','3237','3285',...
    '4192','4272','Location','EastOutside');
tit = sprintf('PIF Mean Reflectance, %i scenes',nscenes);
title(tit,'fontsize',fs)
xlabel('wavelength [um]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
axis([0.450 2.500 0 0.3])

hold on

m = get(gca,'ylim');
lw = 1.0;
line([L8bands(1) L8bands(1)],m,'Color','b','LineWidth',lw)
line([L8bands(2) L8bands(2)],m,'Color','g','LineWidth',lw)
line([L8bands(3) L8bands(3)],m,'Color','r','LineWidth',lw)
line([L8bands(4) L8bands(4)],m,'Color','k','LineWidth',lw)
line([L8bands(5) L8bands(5)],m,'Color','k','LineWidth',lw)
line([L8bands(6) L8bands(6)],m,'Color','k','LineWidth',lw)
line([L8bands(7) L8bands(7)],m,'Color','k','LineWidth',lw)
%% R vs zenith angle
disp('----------------------------------------')
disp('Band n: p(1)      p(2)    r-sq     rmse')
elev = [
45.53970398; % LC80160302013262LGN00
64.03899661; % LC80160302014153LGN00
33.40498180; % LC80160302014297LGN00
53.51244184; % LC80170302013237LGN00
37.49843864; % LC80170302013285LGN00
%49.64651751; % LC80170302014096LGN00 eliminated because snow
62.96013050; % LC80170302014192LGN00
42.03161132  % LC80170302014272LGN00
];

zenith = 90-elev';

[m1,y01] = refvszenith(1,OBSmean,zenith);
[m2,y02] = refvszenith(2,OBSmean,zenith);
[m3,y03] = refvszenith(3,OBSmean,zenith);
[m4,y04] = refvszenith(4,OBSmean,zenith);
[m5,y05] = refvszenith(5,OBSmean,zenith);
[m6,y06] = refvszenith(6,OBSmean,zenith);
[m7,y07] = refvszenith(7,OBSmean,zenith);

X = [min(zenith) max(zenith)];
Y = [min(zenith)*m1+y01 max(zenith)*m1+y01;
    min(zenith)*m2+y02 max(zenith)*m2+y02;
    min(zenith)*m3+y03 max(zenith)*m3+y03;
    min(zenith)*m4+y04 max(zenith)*m4+y04;
    min(zenith)*m5+y05 max(zenith)*m5+y05;
    min(zenith)*m6+y06 max(zenith)*m6+y06;
    min(zenith)*m7+y07 max(zenith)*m7+y07];




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
    ,'band 6','band7');

%% Correct zenith angle
sat_elev = 42.03161132; % elevation angle of the image to be corrected
sat_zenith = 90 - sat_elev;
CDRzenithcorrected = [sat_zenith*m1+y01;
     sat_zenith*m2+y02;
     sat_zenith*m3+y03;
     sat_zenith*m4+y04;
     sat_zenith*m5+y05;
     sat_zenith*m6+y06
     sat_zenith*m7+y07];
 
 
figure 
fs = 15;
set(gcf,'color','white')
plot(L8bands,OBSmean)
hold on
plot(L8bands,CDRzenithcorrected,'*-r','linewidth',1.5)
legend('3262','4153','4297','3237','3285',...
    '4192','4272','zenith corrected','Location','EastOutside');
tit = sprintf('PIF Mean Reflectance, %i scenes',nscenes);
title(tit,'fontsize',fs)
xlabel('wavelength [\mum]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
axis([0.450 2.500 0 0.3])

hold on
% 427 478 546 608 659 724 831 908
m = get(gca,'ylim');
lw = 1.0;
line([L8bands(1) L8bands(1)],m,'Color','b','LineWidth',lw)
line([L8bands(2) L8bands(2)],m,'Color','g','LineWidth',lw)
line([L8bands(3) L8bands(3)],m,'Color','r','LineWidth',lw)
line([L8bands(4) L8bands(4)],m,'Color','k','LineWidth',lw)
line([L8bands(5) L8bands(5)],m,'Color','k','LineWidth',lw)
line([L8bands(6) L8bands(6)],m,'Color','k','LineWidth',lw)
line([L8bands(7) L8bands(7)],m,'Color','k','LineWidth',lw)
%% applying solar zenith correction factor in CDR PIF reflectance spectra

CDR4272 = OBSmean(:,end);

figure
fs = 15;
set(gcf,'color','white')
plot(L8bands,CDR4272)
hold on
plot(L8bands,CDRzenithcorrected,'*-r')
legend('4272;zenith = 42^\circ','4272 corrected;zenith = 42^\circ')
xlabel('wavelength [\mum]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
xlim([.4 2.5])

%%

day = [262,153,297,237,285,192,272];

figure
plot(day,OBSmean(4,:),'.')
ylim([0 .2])
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
% plot(L8bands,r,'linewidth',1.2)
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


plot(L8bands,OBSmean)
%%
% figure 
% fs = 15;
% set(gcf,'color','white')
% plot(1:6,r)
%% Extrapolation City pixel from L5
% cd /Users/javier/Desktop/Javier/PHD_RIT/LDCM/InputOutput/

% citypx = [
%     0.4430  0.102244;
%     0.4826  0.102244;
%     0.5613  0.119937;
%     0.6546  0.129334;
%     0.8646  0.155755;
%     1.6090  0.166700;
%     2.2010  0.154745];
citypx = [ L8bands' [CDRzenithcorrected(2,1); CDRzenithcorrected(2:end,1)]]; % with the correction for zenith angle equal 45

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

figure
fs = 15;
plot(L8bands,CDRzenithcorrected,'*-b')
set(gcf,'color','white')
hold on
plot(citypx(2:end,1),citypx(2:end,2),'r-*')
plot(x3,y3,'*r')

plot([.4 .7],[(m0*.4+y0) (m0*.7+y0)],'k')

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
%%
figure
fs = 15;
set(gcf,'color','white')
plot(L8bands,RrsDTROC)


Ref = [L8bands', RrsDTROC];
save('RrsDTROC131909.txt','Ref','-ascii')
