cd /Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout
%% script to plot different HL outputs

pathfolder = '/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/';


%% chl dpf = FFbb026; mineral = FFbb028
filename = 'Pdark091913old.txt';
[Rrsold,wlold] = HLextraction(pathfolder,filename);

% chl,mineral = avgpar
filename = 'PDarkPixel091913.txt';
[Rrsavgpar,wlavgpar] = HLextraction(pathfolder,filename);

% chl dpf = FFbb002; mineral = FFbb002
filename = 'Pdark091913FFbb002.txt';
[RrsFFbb002,wlFFbb002] = HLextraction(pathfolder,filename);

% chl dpf = FFbb002; mineral = FFbb002;cdom(440)=0.116
filename = 'Pdark091913cdp116.txt';
[Rrscdp116,wlcdp116] = HLextraction(pathfolder,filename);


figure
fs = 15;
set(gcf,'color','white')
plot(wlold,Rrsold,'r')
hold on
plot(wlavgpar,Rrsavgpar,'b')
plot(wlFFbb002,RrsFFbb002,'k');
plot(wlcdp116,Rrscdp116,'g');
plot(wlFFbb0001,RrsFFbb0001,'--r')
legend('old','avgpar','FFbb002','CDOM \gamma=0.116','PFFbb0001.txt')
title('HL output','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('Rrs','fontsize',fs)
set(gca,'fontsize',fs)
% xlim([400 900])

%% chl dpf = FFbb0001; mineral = FFbb0001;cdom(440)=0.1151 - 03/03/14
filename = 'PFFbb0001.txt';
[RrsFFbb0001,wlFFbb0001] = HLextraction(pathfolder,filename);

filename = 'PFFbb0001_2.txt'; % with incorrect scattering
[RrsFFbb0001_2,wlFFbb0001_2] = HLextraction(pathfolder,filename);

filename = 'PFFbb0001_3.txt'; % with correct scattering
[RrsFFbb0001_3,wlFFbb0001_3] = HLextraction(pathfolder,filename);

filename = 'PFFbb022_roloscat.txt'; % from Rolo's scatterinf
[RrsFFbb0001_roloscat,wlFFbb0001_roloscat] = HLextraction(pathfolder,filename);

filename = 'PFFbb022_differentFFbbEL.txt'; % Chl:FFbb001.dpf;SM:FFbb022.dpf in EL
[RrsFFbb0001_diffFFbbEL,wlFFbb0001_diffFFbbEL] = HLextraction(pathfolder,filename);


filename = 'PFFbb022_differentFFbbHL.txt'; % Chl:FFbb001.dpf;SM:FFbb022.dpf in HL
[RrsFFbb0001_diffFFbbHL,wlFFbb0001_diffFFbbHL] = HLextraction(pathfolder,filename);


figure
fs = 15;
set(gcf,'color','white')
plot(wlFFbb0001,RrsFFbb0001,'r')
hold on
plot(wlFFbb0001_2,RrsFFbb0001_2,'--r')
plot(wlFFbb0001_3,RrsFFbb0001_3,'--b')
plot(wlFFbb0001_roloscat,RrsFFbb0001_roloscat,'--g')
plot(wlFFbb0001_diffFFbbEL,RrsFFbb0001_diffFFbbEL,'c')
plot(wlFFbb0001_diffFFbbEL,RrsFFbb0001_diffFFbbHL,'.c')

legend('PFFbb0001.txt','PFFbb0001.txt_2','PFFbb0001.txt_3','roloscat','diffFFbb','diffFFbbHL')
title('HL output','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('Rrs','fontsize',fs)
set(gca,'fontsize',fs)
% xlim([400 900])
%% see if CHL b* change with two different models
filename = 'PFFbb_01.txt';
[RrsFFbb_01,wlFFbb_01] = HLextraction(pathfolder,filename);

filename = 'PFFbb_02.txt';
[RrsFFbb_02,wlFFbb_02] = HLextraction(pathfolder,filename);

filename = 'PFFbb_LONGS.txt';
[RrsFFbb_LONGS,wlFFbb_LONGS] = HLextraction(pathfolder,filename);

filename = 'PFFbb_LONGS_CDOMfit.txt';
[RrsFFbb_LONGS_CDOMfit,wlFFbb_LONGS_CDOMfit] = HLextraction(pathfolder,filename);

filename = 'PFFbb_LONGS_012012.txt';
[RrsFFbb_LONGS_012012,wlFFbb_LONGS_012012] = HLextraction(pathfolder,filename);


figure
fs = 15;
set(gcf,'color','white')
plot(wlFFbb_01,RrsFFbb_01,'k')
hold on
plot(wlFFbb_02,RrsFFbb_02,'r')
plot(wlFFbb_LONGS,RrsFFbb_LONGS,'b')
plot(wlFFbb_LONGS_CDOMfit,RrsFFbb_LONGS_CDOMfit,'--b')
plot(wlFFbb_LONGS_012012,RrsFFbb_LONGS_012012,'->b')



legend('PFFbb\_01.txt','PFFbb\_02.txt','PFFbb\_LONGS.txt','PFFbb\_LONGS\_CDOMfit.txt','012012')
title('HL output','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('Rrs','fontsize',fs)
set(gca,'fontsize',fs)

%% two different astar method
filename = 'PFFbb_ONTNS_Cristy.txt';
[RrsFFbb_01,wlFFbb_01] = HLextraction(pathfolder,filename);

filename = 'PFFbb_ONTNS_10200HC.txt';
[RrsFFbb_02,wlFFbb_02] = HLextraction(pathfolder,filename);

filename = 'PFFbb_ONTNS_SMRIT.txt';
[RrsFFbb_03,wlFFbb_03] = HLextraction(pathfolder,filename);

filename = 'PFFbb_ONTNS_SMRIT2.txt';
[RrsFFbb_04,wlFFbb_04] = HLextraction(pathfolder,filename);

filename = 'PFFbb_ONTNS_SMRIT3.txt';
[RrsFFbb_05,wlFFbb_05] = HLextraction(pathfolder,filename);

filename = 'PFFbb_ONTNS_SMRIT4.txt';
[RrsFFbb_06,wlFFbb_06] = HLextraction(pathfolder,filename);

filename = 'PFFbb_ONTNS_SMRIT5.txt';
[RrsFFbb_07,wlFFbb_07] = HLextraction(pathfolder,filename);

figure
fs = 15;
set(gcf,'color','white')
plot(wlFFbb_01,RrsFFbb_01,'k')
hold on
plot(wlFFbb_02,RrsFFbb_02,'r')
plot(wlFFbb_03,RrsFFbb_03,'--r')
plot(wlFFbb_04,RrsFFbb_04,'--k')
plot(wlFFbb_05,RrsFFbb_05,'-.k')
plot(wlFFbb_06,RrsFFbb_06,'-.g')
plot(wlFFbb_07,RrsFFbb_07,'g')


legend('CHL:Cristy;SM:County','CHL:10200HC;SM:County',...
    'CHL:10200HC;SM: RIT','CHL:Cristy;SM: RIT','CHL:Cristy;SM: RIT .1 [mg/L]')
title('HL output','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('Rrs','fontsize',fs)
set(gca,'fontsize',fs)
%% Compare shape

ONTNSRefnooffset = ONTNSRef-ONTNSRef(wavelengthSVC==.8468);

figure
plot(wlFFbb_05,RrsFFbb_05./max(RrsFFbb_05),'-.k')
hold on
plot(wavelengthSVC*1000,ONTNSRefnooffset./max(ONTNSRefnooffset),'g')
plot(wlFFbb_01,RrsFFbb_01./max(RrsFFbb_01),'k')
plot(wlFFbb_06,RrsFFbb_06./max(RrsFFbb_06),'--g')

%% two different astar method
filename = 'PFFbb_ONTNS_SMRIT6.txt';
[RrsFFbb_06,wlFFbb_06] = HLextraction(pathfolder,filename);

filename = 'PFFbb_ONTNS_SMRIT7.txt';
[RrsFFbb_07,wlFFbb_07] = HLextraction(pathfolder,filename);

figure
fs = 15;
set(gcf,'color','white')
plot(wlFFbb_06,RrsFFbb_06,'k')
hold on
plot(wlFFbb_07,RrsFFbb_07,'r')


legend('CHL:Cristy,0.48;SM:RIT,0.1','CHL:10200HC,1.01;SM:RIT,0.1')
title('HL output','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('Rrs','fontsize',fs)
set(gca,'fontsize',fs)
%% Compare shape

ONTNSRefnooffset = ONTNSRef-ONTNSRef(wavelengthSVC==.8468);

figure
plot(wlFFbb_06,RrsFFbb_06./max(RrsFFbb_06),'-.k')
hold on
plot(wavelengthSVC*1000,ONTNSRefnooffset./max(ONTNSRefnooffset),'g')
plot(wlFFbb_07,RrsFFbb_07./max(RrsFFbb_07),'k')


