% Calculates the mixed layer depth from shipboard cnv files.
% The mixed layer depth is the depth where the change in density
% from the surface (8 m) exceeds a threshold. 

% files are named dNBP1302001.cnv, dNBP1302002.cnv etc (cruise = 1302)

mixed_layer_threshold  =  0.02;

% Change as appropriate
cd('C:\')

% loops through the cnv files for the first 99 hydrocasts
% modify slightly for HC 100 - 140.
for i = 1:99
    basename = 'dNBP1302';
    basename2 = '.cnv';
    filename = [basename,num2str(i),basename2]; 
    
    % open file to read
    fid = fopen(filename);     
    
    % set read position to beginning of file
    fseek(fid,0,-1);                
    
    % reads over the header data 
    while strcmp(fgetl(fid),'*END*') == 0 
        % go through lines until '*END*'
    end        

    n = 1;                            
    
    while 1   % while true
        
        % read next line
        tline  =  fgetl(fid) ;                
        
        % if eof, break and finish
        if ~ischar(tline), break, end       
        
        % add data into a matrix (takes horizontal data, places it as a column)
        data(:,n)  =  sscanf(tline,'%f');
       
        % add next line to next column
        n = n+1;
    end

    fclose(fid);    % close file
    Cast_data = transpose(data); 
    %22 =  sigma t
    %23  =  sigma theta

    %find density at 8 m, 6th column is the depth data
    index = 1;
    while (Cast_data(index,6)) < 8
        index = index + 1;
    end


    surface_density = Cast_data(depth,22);

    % find the depth where 
    while (Cast_data(index,22)- surface_density) < mixed_layer_threshold
        index = index + 1;
    end

    depth = Cast_data(index,6);
    output(i,1) = depth;
end