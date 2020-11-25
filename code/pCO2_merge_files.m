% This script takes the pCO2 files from individual cruises and merges them
% into a single file

% change as appropriate
dir_content = dir('C:\*1.*');
A = {dir_content.name};

init = char(A(1));
output=xlsread(init);

for i = 2:length(A)
    init2 = char(A(i));
    input = xlsread(init2);
    output = vertcat(output,input);
end

filename = 'pCO2merged.xlsx';
xlswrite(filename,output)