function IOP = extractIOPcurve(filename,folderpath)

filepath = [folderpath,filename];

fid = fopen(filepath);
c = textscan(fid,'%s','delimiter','\n');
fclose all;

curve = c{1}(11:end-1);

IOP = zeros(size(curve,1),2);

for row = 1:size(curve,1)
    IOP(row,:)= str2num(curve{row});
end

figure
fs = 15;
set(gcf,'color','white')
plot(IOP(:,1),IOP(:,2))
title(filename,'fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
% ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)