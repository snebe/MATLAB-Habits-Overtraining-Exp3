% There are 24 different counterbalancing conditions, 3 factors (columns): 
% (column 1)The image used as cues (4 different conditions)
% (column 2)The image used as outcome (3 different conditions)
% (column 3)The position of the two different Aliens (green / orange) on the screen (2 different conditions)
subjectCon = randi(24);
% if subjectCon > 24
%     subjectCon = rem(subjectCon, 24);
% end
% if subjectCon == 0
%     subjectCon = 24;
% end
  %Cookies, Diamonds, Aliens position%%
counterBalancing = [1,1,1;...
      2,1,1;...
      3,1,1;...
      4,1,1;...      
      1,2,1;...
      2,2,1;...
      3,2,1;...
      4,2,1;...      
      1,3,1;...
      2,3,1;...
      3,3,1;...
      4,3,1;...      
      1,1,2;...
      2,1,2;...
      3,1,2;...
      4,1,2;...      
      1,2,2;...
      2,2,2;...
      3,2,2;...
      4,2,2;...      
      1,3,2;...
      2,3,2;...
      3,3,2;...
      4,3,2];


