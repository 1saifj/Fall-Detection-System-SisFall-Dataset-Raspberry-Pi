% ADL
D01=fileDatastore("adl\D01*.csv","ReadFcn",@importfile,"UniformRead",true);
D02=fileDatastore("adl\D02*.csv","ReadFcn",@importfile,"UniformRead",true);
D03=fileDatastore("adl\D03*.csv","ReadFcn",@importfile,"UniformRead",true);
D04=fileDatastore("adl\D04*.csv","ReadFcn",@importfile,"UniformRead",true);
D05=fileDatastore("adl\D05*.csv","ReadFcn",@importfile,"UniformRead",true);
D06=fileDatastore("adl\D06*.csv","ReadFcn",@importfile,"UniformRead",true);
D07=fileDatastore("adl\D07*.csv","ReadFcn",@importfile,"UniformRead",true);
D08=fileDatastore("adl\D08*.csv","ReadFcn",@importfile,"UniformRead",true);
D09=fileDatastore("adl\D09*.csv","ReadFcn",@importfile,"UniformRead",true);
D10=fileDatastore("adl\D10*.csv","ReadFcn",@importfile,"UniformRead",true);
D11=fileDatastore("adl\D11*.csv","ReadFcn",@importfile,"UniformRead",true);
D12=fileDatastore("adl\D12*.csv","ReadFcn",@importfile,"UniformRead",true);
D13=fileDatastore("adl\D13*.csv","ReadFcn",@importfile,"UniformRead",true);
D14=fileDatastore("adl\D14*.csv","ReadFcn",@importfile,"UniformRead",true);
D15=fileDatastore("adl\D15*.csv","ReadFcn",@importfile,"UniformRead",true);
D16=fileDatastore("adl\D16*.csv","ReadFcn",@importfile,"UniformRead",true);
D17=fileDatastore("adl\D17*.csv","ReadFcn",@importfile,"UniformRead",true);
D18=fileDatastore("adl\D18*.csv","ReadFcn",@importfile,"UniformRead",true);
D19=fileDatastore("adl\D19*.csv","ReadFcn",@importfile,"UniformRead",true);


F01=fileDatastore("fall\F01*.csv","ReadFcn",@importfile,"UniformRead",true);
F02=fileDatastore("fall\F02*.csv","ReadFcn",@importfile,"UniformRead",true);
F03=fileDatastore("fall\F03*.csv","ReadFcn",@importfile,"UniformRead",true);
F04=fileDatastore("fall\F04*.csv","ReadFcn",@importfile,"UniformRead",true);
F05=fileDatastore("fall\F05*.csv","ReadFcn",@importfile,"UniformRead",true);
F06=fileDatastore("fall\F06*.csv","ReadFcn",@importfile,"UniformRead",true);
F07=fileDatastore("fall\F07*.csv","ReadFcn",@importfile,"UniformRead",true);
F08=fileDatastore("fall\F08*.csv","ReadFcn",@importfile,"UniformRead",true);
F09=fileDatastore("fall\F09*.csv","ReadFcn",@importfile,"UniformRead",true);
F10=fileDatastore("fall\F10*.csv","ReadFcn",@importfile,"UniformRead",true);
F11=fileDatastore("fall\F11*.csv","ReadFcn",@importfile,"UniformRead",true);
F12=fileDatastore("fall\F12*.csv","ReadFcn",@importfile,"UniformRead",true);
F13=fileDatastore("fall\F13*.csv","ReadFcn",@importfile,"UniformRead",true);
F14=fileDatastore("fall\F14*.csv","ReadFcn",@importfile,"UniformRead",true);
F15=fileDatastore("fall\F15*.csv","ReadFcn",@importfile,"UniformRead",true);



RD01 = readall(D01);
RD02 = readall(D02);
RD03 = readall(D03);
RD04 = readall(D04);
RD05=  readall(D05);
RD06 = readall(D06);
RD07 = readall(D07);
RD08 = readall(D08);
RD09 = readall(D09);
RD10 = readall(D10);
RD11 = readall(D11);
RD12 = readall(D12);
RD13 = readall(D13);
RD14 = readall(D14);
RD15 = readall(D15);
RD16 = readall(D16);
RD17 = readall(D17);
RD18 = readall(D18);
RD19 = readall(D19);



RF01 = readall(F01);
RF02 = readall(F02);
RF03 = readall(F03);
RF04 = readall(F04);
RF05 = readall(F05);
RF06 = readall(F06);
RF07 = readall(F07);
RF08 = readall(F08);
RF09 = readall(F09);
RF10 = readall(F10);
RF11 = readall(F11);
RF12 = readall(F12);
RF13 = readall(F13);
RF14 = readall(F14);
RF15 = readall(F15);




%1
ACTIVITY = [];
ACTIVITY(1:size(RD01,1),:) = 1;
RD01 = addvars(RD01,ACTIVITY);
writetable(RD01,'RD01.csv') 

%2
ACTIVITY = [];
ACTIVITY(1:size(RD02,1),:) = 1;
RD02 = addvars(RD02,ACTIVITY);
writetable(RD02,'RD02.csv') 
%3
ACTIVITY = [];
ACTIVITY(1:size(RD03,1),:) = 1;
RD03 = addvars(RD03,ACTIVITY);
writetable(RD03,'RD03.csv') 

%4
ACTIVITY = [];
ACTIVITY(1:size(RD04,1),:) = 1;
RD04 = addvars(RD04,ACTIVITY);
writetable(RD04,'RD04.csv') 

ACTIVITY = [];
ACTIVITY(1:size(RD05,1),:) = 1;
RD05 = addvars(RD05,ACTIVITY);
writetable(RD05,'RD05.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RD06,1),:) = 1;
RD06 = addvars(RD06,ACTIVITY);
writetable(RD06,'RD06.csv') 



ACTIVITY = [];
ACTIVITY(1:size(RD07,1),:) = 1;
RD07 = addvars(RD07,ACTIVITY);
writetable(RD07,'RD07.csv') 

ACTIVITY = [];
ACTIVITY(1:size(RD08,1),:) = 1;
RD08 = addvars(RD08,ACTIVITY);
writetable(RD08,'RD08.csv') 

ACTIVITY = [];
ACTIVITY(1:size(RD09,1),:) = 1;
RD09 = addvars(RD09,ACTIVITY);
writetable(RD09,'RD09.csv') 

ACTIVITY = [];
ACTIVITY(1:size(RD10,1),:) = 1;
RD10 = addvars(RD10,ACTIVITY);
writetable(RD10,'RD10.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RD11,1),:) = 1;
RD11 = addvars(RD11,ACTIVITY);
writetable(RD11,'RD11.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RD12,1),:) = 1;
RD12 = addvars(RD12,ACTIVITY);
writetable(RD12,'RD12.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RD13,1),:) = 1;
RD13 = addvars(RD13,ACTIVITY);
writetable(RD13,'RD13.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RD14,1),:) = 1;
RD14 = addvars(RD14,ACTIVITY);
writetable(RD14,'RD14.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RD15,1),:) = 1;
RD15 = addvars(RD15,ACTIVITY);
writetable(RD15,'RD15.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RD16,1),:) = 1;
RD16 = addvars(RD16,ACTIVITY);
writetable(RD16,'RD16.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RD17,1),:) = 1;
RD17 = addvars(RD17,ACTIVITY);
writetable(RD17,'RD17.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RD18,1),:) = 1;
RD18 = addvars(RD18,ACTIVITY);
writetable(RD18,'RD18.csv') 

ACTIVITY = [];
ACTIVITY(1:size(RD19,1),:) = 1;
RD19 = addvars(RD19,ACTIVITY);
writetable(RD19,'RD19.csv') 

%%%%%%%%%%%5


ACTIVITY = [];
ACTIVITY(1:size(RF01,1),:) = 2;
RF01 = addvars(RF01,ACTIVITY);
writetable(RF01,'RF01.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RF02,1),:) = 2;
RF02 = addvars(RF02,ACTIVITY);
writetable(RF02,'RF02.csv') 

ACTIVITY = [];
ACTIVITY(1:size(RF03,1),:) = 2;
RF03 = addvars(RF03,ACTIVITY);
writetable(RF03,'RF03.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RF04,1),:) = 2;
RF04 = addvars(RF04,ACTIVITY);
writetable(RF04,'RF04.csv') 

ACTIVITY = [];
ACTIVITY(1:size(RF05,1),:) = 2;
RF05 = addvars(RF05,ACTIVITY);
writetable(RF05,'RF05.csv') 

ACTIVITY = [];
ACTIVITY(1:size(RF06,1),:) = 2;
RF06 = addvars(RF06,ACTIVITY);
writetable(RF06,'RF06.csv') 

ACTIVITY = [];
ACTIVITY(1:size(RF07,1),:) = 2;
RF07 = addvars(RF07,ACTIVITY);
writetable(RF07,'RF07.csv') 

ACTIVITY = [];
ACTIVITY(1:size(RF08,1),:) = 2;
RF08 = addvars(RF08,ACTIVITY);
writetable(RF08,'RF08.csv') 

ACTIVITY = [];
ACTIVITY(1:size(RF09,1),:) = 2;
RF09 = addvars(RF09,ACTIVITY);
writetable(RF09,'RF09.csv') 




ACTIVITY = [];
ACTIVITY(1:size(RF10,1),:) = 2;
RF10 = addvars(RF10,ACTIVITY);
writetable(RF10,'RF10.csv') 



ACTIVITY = [];
ACTIVITY(1:size(RF11,1),:) = 2;
RF11 = addvars(RF11,ACTIVITY);
writetable(RF11,'RF11.csv') 



ACTIVITY = [];
ACTIVITY(1:size(RF12,1),:) = 2;
RF12 = addvars(RF12,ACTIVITY);
writetable(RF12,'RF12.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RF13,1),:) = 2;
RF13 = addvars(RF13,ACTIVITY);
writetable(RF13,'RF13.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RF14,1),:) = 2;
RF14 = addvars(RF14,ACTIVITY);
writetable(RF14,'RF14.csv') 


ACTIVITY = [];
ACTIVITY(1:size(RF15,1),:) = 2;
RF15 = addvars(RF15,ACTIVITY);
writetable(RF15,'RF15.csv') 



compADL=datastore("RD*.csv");
compFALL=datastore("RF*.csv");
compA = readall(compADL);
compF = readall(compFALL);
compDataset=[compA;compF];
writetable(compDataset,'SISFALL_binaryCLASS.csv'); 

