function Labels = createLabel(ds)
    [numFiles , ~] = size(ds.Files);
    Labels = [];
    for i = 1 : numFiles
        [~,name,~] = fileparts(ds.Files{i});
        Labels = [Labels; class(id == str2num(name))];
    end
end