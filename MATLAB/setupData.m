
%% Read labels

dname = fullfile(pwd, 'UCI HAR Dataset', 'train');

t = dlmread(fullfile(dname, 'y_train.txt'));
s = dlmread(fullfile(dname, 'subject_train.txt'));

%% Read sensor data

dname = fullfile(dname, 'Inertial Signals');

ax = dlmread(fullfile(dname, 'total_acc_x_train.txt'));
ay = dlmread(fullfile(dname, 'total_acc_y_train.txt'));
az = dlmread(fullfile(dname, 'total_acc_z_train.txt'));

dataA = table(ax, ay, az, s, t);

%% Read labels

dname = fullfile(pwd, 'UCI HAR Dataset', 'test');

t = dlmread(fullfile(dname, 'y_test.txt'));
s = dlmread(fullfile(dname, 'subject_test.txt'));

%% Read sensor data

dname = fullfile(dname, 'Inertial Signals');

ax = dlmread(fullfile(dname, 'total_acc_x_test.txt'));
ay = dlmread(fullfile(dname, 'total_acc_y_test.txt'));
az = dlmread(fullfile(dname, 'total_acc_z_test.txt'));

dataB = table(ax, ay, az, s, t);

%% Set string for each labels

actLabels = {'WALKING', 'WALKING_UPSTAIRS', ...
    'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'};

%% Save data

clearvars -except dataA dataB actLabels
save 'HARdataset'
