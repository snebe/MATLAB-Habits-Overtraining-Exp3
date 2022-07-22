%OK, first I will try to show just the text, and comment all related with the
%images. That's why there are many commented lines
FlushEvents('keyDown')
HVpoints = numHV * actualHVvalue ;
MVpoints = numMV * actualMVvalue ;
LVpoints = numLV * actualLVvalue ;
       if counterBalancing(subjectCon,2) == 1
            colorHigh = 'blaue';
            colorMed = 'gelbe';
            colorLow = 'rote';
        elseif counterBalancing(subjectCon,2) == 2
            colorHigh = 'rote';
            colorMed = 'blaue';
            colorLow = 'gelbe';
        elseif counterBalancing(subjectCon,2) == 3
            colorHigh = 'gelbe';
            colorMed = 'rote';
            colorLow = 'blaue';
       end
exitSummary = false;
while exitSummary == false
   
Puntostotales = Screen('TextBounds', wd, ['Bisher erzielte Punkte: ' int2str(totalPoints)]);
xPuntostotales = (screenXpixels / 2) - (Puntostotales(3) / 2);
yPuntostotales = (screenYpixels / 1.4) - (Puntostotales(4) / 2);
DrawFormattedText(wd, ['Bisher erzielte Punkte: ' int2str(totalPoints)], xPuntostotales, yPuntostotales, white);

if blockType == 1

NumofDev = Screen('TextBounds', wd, ['Sie haben ' int2str(numHV) ' ' colorHigh ' Diamanten erhalten. ']);
xNumofDev = (screenXpixels / 2) - (NumofDev(3) / 2);
yNumofDev = (screenYpixels / 2.3) - (NumofDev(4) / 2);
DrawFormattedText(wd, ['Sie haben ' int2str(numHV) ' ' colorHigh ' Diamanten erhalten. '], xNumofDev, yNumofDev, white);

NumofDev1 = Screen('TextBounds', wd, ['Sie haben 0 Punkte durch ' colorHigh ' Diamanten verdient. ']);
xNumofDev1 = (screenXpixels / 2) - (NumofDev1(3) / 2);
yNumofDev1 = (screenYpixels / 2) - (NumofDev1(4) / 2);
DrawFormattedText(wd, ['Sie haben 0 Punkte durch ' colorHigh ' Diamanten verdient. '], xNumofDev1, yNumofDev1, white);

NumofDev2 = Screen('TextBounds', wd, ['Vermeiden Sie es in Zukunft, Diamanten im Wert von 0 Punkten zu gewinnen. ']);
xNumofDev2 = (screenXpixels / 2) - (NumofDev2(3) / 2);
yNumofDev2 = (screenYpixels / 1.7) - (NumofDev2(4) / 2);
DrawFormattedText(wd, ['Vermeiden Sie es in Zukunft, Diamanten im Wert von 0 Punkten zu gewinnen. '], xNumofDev2, yNumofDev2, white);

DevReminder = Screen('TextBounds', wd, ['Erinnern Sie sich daran, dass ' colorHigh ' Diamanten 0 Punkte wert waren! ']);
xDevReminder = (screenXpixels / 2) - (DevReminder(3) / 2);
yDevReminder = (screenYpixels / 2.6) - (DevReminder(4) / 2);
DrawFormattedText(wd, ['Erinnern Sie sich daran, dass ' colorHigh ' Diamanten 0 Punkte wert waren! '], xDevReminder, yDevReminder, white);
DrawFormattedText(wd, ['Drücken Sie die Leertaste, um fortzufahren. '], 'center', resultText5, white);
Screen('Flip', wd);

elseif blockType == 2

NumofDev = Screen('TextBounds', wd, ['Sie haben ' int2str(numMV) ' ' colorMed ' Diamanten erhalten. ']);
xNumofDev = (screenXpixels / 2) - (NumofDev(3) / 2);
yNumofDev = (screenYpixels / 2.3) - (NumofDev(4) / 2);
DrawFormattedText(wd, ['Sie haben ' int2str(numMV) ' ' colorMed ' Diamanten erhalten. '], xNumofDev, yNumofDev, white);

NumofDev1 = Screen('TextBounds', wd, ['Sie haben 0 Punkte durch ' colorMed ' Diamanten verdient. ']);
xNumofDev1 = (screenXpixels / 2) - (NumofDev1(3) / 2);
yNumofDev1 = (screenYpixels / 2) - (NumofDev1(4) / 2);
DrawFormattedText(wd, ['Sie haben 0 Punkte durch ' colorMed ' Diamanten verdient. '], xNumofDev1, yNumofDev1, white);

NumofDev2 = Screen('TextBounds', wd, ['Vermeiden Sie es in Zukunft, Diamanten im Wert von 0 Punkten zu gewinnen. ']);
xNumofDev2 = (screenXpixels / 2) - (NumofDev2(3) / 2);
yNumofDev2 = (screenYpixels / 1.7) - (NumofDev2(4) / 2);
DrawFormattedText(wd, ['Vermeiden Sie es in Zukunft, Diamanten im Wert von 0 Punkten zu gewinnen. '], xNumofDev2, yNumofDev2, white);

DevReminder = Screen('TextBounds', wd, ['Erinnern Sie sich daran, dass ' colorMed ' Diamanten 0 Punkte wert waren! ']);
xDevReminder = (screenXpixels / 2) - (DevReminder(3) / 2);
yDevReminder = (screenYpixels / 2.6) - (DevReminder(4) / 2);
DrawFormattedText(wd, ['Erinnern Sie sich daran, dass ' colorMed ' Diamanten 0 Punkte wert waren! '], xDevReminder, yDevReminder, white);
DrawFormattedText(wd, ['Drücken Sie die Leertaste, um fortzufahren.'], 'center', resultText5, white);
Screen('Flip', wd);

elseif blockType == 3

NumofDev2 = Screen('TextBounds', wd, ['In diesem Block behielten alle Diamanten ihren Wert.']);
xNumofDev2 = (screenXpixels / 2) - (NumofDev2(3) / 2);
yNumofDev2 = (screenYpixels / 1.7) - (NumofDev2(4) / 2);
DrawFormattedText(wd, ['In diesem Block behielten alle Diamanten ihren Wert.'], xNumofDev2, yNumofDev2, white);
DrawFormattedText(wd, ['Drücken Sie die Leertaste, um fortzufahren.'], 'center', resultText5, white);
Screen('Flip', wd);
    
end
    [keyIsDown, secs, keyCode] = KbCheck;
    if keyCode(spacebar)
        exitSummary = true;
    end
    
end
numHV = 0;
numMV = 0;
numLV = 0;

