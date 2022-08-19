% Clear the workspace
% close all;
% clear all;
% sca;
% currentfolder=pwd;
% Each participant has a unique ID number, from 1 to N. This number will
% set the correct stimuli etc depending on counterbalancing. Depending on
% the session (which the program ask at the beginning), the program will be
% slightly different BUT all the specifics depending on counterbalacing
% will be constant for each participant.
% IMPORTANT: For each session the NAME of the data file is going to change.
% So data files will look like DATA_23_1_2 (first the subject, then the group
% (time pressure) and then the session)

%         DATA.sub = input('Geben Sie die Probandennummer ein ---> ');
        DATA.group = 2; %input('¿Overtr (No=1/Sí=2)? ---> ');       
        DATA.ses = session;

%      if session == 1
%         DATA.age = input('Wie alt sind Sie? (Zahlen verwenden) ---> ');
%         DATA.sex = input ('Sind Sie männlich/weiblich/anderes? ---> ', 's'); 
%         DATA.hand = input ('Sind Sie rechts- oder linkshändig? ---> ','s');
%         DATA.smoke = input ('Rauchen Sie(j/n)? ---> ','s');
%      end
% Check to see if subject data file already exists.
if session > 2
    previous_session = session - 1;
    fileName = ['data/Luque_data_', (num2str(previous_session)), '_', subj_ID, '.mat'];
    if exist(fileName, 'file') == 0
         button = questdlg('Es gibt keinen Datensatz zu diesem SUBJEKT aus der vorherigen Sitzung. Sind Sie sicher, dass Sie fortfahren möchten?','Error sujeto','Yes','No','No');
         switch button
               case 'Yes'
                   quit cancel;
                case 'No'
                   return;
         end
    else 
        load(fileName,'subjectCon')
    end
end

alienSetup

distances

%----------------------------------------------------------------------
%                     EXPE information
%----------------------------------------------------------------------


% Define the trial-by-trial matrix
trialsxblock = 48; %4 cues x 12 trials (I am not including free election trials here)
normalBlocks = 9;
PreTrainingBlocks = 0;
numBlocks = normalBlocks + PreTrainingBlocks;  
numTrials = numBlocks*trialsxblock;
DATA.trial_data = nan(numTrials, 10); %10 is the number of columns %CAUTION: Am I considering  the free election trials here?


% Payoff
lowPoints = 5;
mediumPoints = 10;
highPoints = 100;
totalPoints = 0;

% Time Pressure
LowPressure = 4;
HighPressure = 0.5; %half a second for responding.
TimeCue1 = 0.8;
TimeCue2 = 0.5;
TimeCue3 = 0.2;

%--------------------------Table for counterbalance---------------------
if session == 2 
    counterBalancing_script
end
%-----------------------------------------------------------------------

%--------------------------Read in Stimuli------------------------------
read_stim
%-----------------------------------------------------------------------

%--------------------------Create the trial structure-------------------
trial_structure
%-----------------------------------------------------------------------
%--------------------------Instructions-beginning-------------------
instructions
%-----------------------------------------------------------------------

WaitSecs(2.5);

%--------------------------trialbytrial experiment---------------------
experiment
%-----------------------------------------------------------------------

nextScreen = 0;
WaitSecs(0.25);
fileNamefinal = ['data/Luque_data_', (num2str(session)), '_', subj_ID, '.mat'];
save(fileNamefinal);

while nextScreen == 0
    DrawFormattedText(wd, ['Sie sind fertig!'], 'center', resultText1, white);
    DrawFormattedText(wd, ['Gesamtpunktzahl: ' int2str(totalPoints)],'center', resultText3, white);
    DrawFormattedText(wd, ['Drücken Sie die Leertaste, um das Experiment zu beenden.'], 'center', resultText5, white);
    Screen('Flip', wd);    
    [keyIsDown, secs, keyCode] = KbCheck; %Check for response
    if keyCode(spacebar)
        nextScreen = 1;
    end  
end

WaitSecs(1);
    Screen('CloseAll')