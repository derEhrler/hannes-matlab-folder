%% copy in folder with the text files of the measurments, change initial parameters
%% initial parameters
element = 'Ge';
voltage = '+-100mV_50m_';
unit = 'nm.txt';
wavelengthBegin = 475;
wavelengthEnd = 1100;
wavelengthStep = 25;
maxNumberOfMeasurments = 41;

%%
numberOfFiles = (wavelengthEnd-wavelengthBegin)/wavelengthStep + 1;
data = zeros(maxNumberOfMeasurments,3,numberOfFiles);

k = 1;
for  i = wavelengthBegin:wavelengthStep:wavelengthEnd  
    s = strcat(element,voltage,int2str(i),unit);
    fid = fopen(s,'r');
    c = textscan(fid, '%f%f%f','HeaderLines',6);
    fclose(fid);
    c = cell2mat(c);
    [m,n] = size(c);
    data(1:m,:,k) = c;
    k = k + 1;
end

for i = 1:numberOfFiles
    plot(data(:,1,i),data(:,3,i),'-o');
    hold on;
end

%plot(data(:,1,numberOfFiles),data(:,1,numberOfFiles));

grid on

title('920-181-04 Chip 20 (475nm-1100nm)')
xlabel('Spannung in mV')
ylabel('Strom in A')

xline(0)
yline(0)



