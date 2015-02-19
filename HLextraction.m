function [Rrs,wl] = HLextraction(pathfolder,filename)

filepath = [pathfolder,filename];

fid = fopen(filepath);
c = textscan(fid,'%s','delimiter','\n');
fclose all;

idx1= [];
Rrs = [];
wl = [];
for n = 1:length(c{1})
    % find Rrs
    %         a = [];
    a = strfind(c{1}{n},'Rrs = Lw/Ed'); %finds Rrs header
    
    if ~isempty(a)
        C = textscan(c{1}{n+3},'%s');
        Rrs = [Rrs;str2double(C{1}(end))];
        
        C = textscan(c{1}{n-2},'%s');
        wl = [wl;str2double(C{1}(end-1))];
    end
end

Rrs = Rrs*pi;