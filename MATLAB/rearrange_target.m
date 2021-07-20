function targetData = rearrange_target(data)
targetData=data.matType;
targetData=categorical(cellstr(targetData));
end