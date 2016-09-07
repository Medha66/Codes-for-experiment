function p = training(p)

% Give feedback during training
p.feedback = 1;

% Initial instruction
text = ['Thank you for you participation in the current study!\n\nWe are interested in people''s ability to make quick perceptual decisions.'...
    '\n\nIf at any point you have questions, please stop and ask the experimenter.'...
    '\n\nPress any key to continue.'];
DrawFormattedText(p.window, text, 300, 'center', 255, p.wrapat); 
Screen('Flip',p.window);
WaitSecs(1);
KbWait;

% Initial task instruction
text = ['In this study you will see quickly presented gratings. Your job will be to indicate the tilt of the grating '...
    '(either left or right, that is, oriented like \ or like /). The task will gradually become harder as you progress.' ...
    '\n\nAfter giving your response, you''d need to indicate your confidence on a 1-4 scale, where 1 is low confidence '...
    'and 4 is high confidence. Respond using the keys 1-4 on the keyboard. '...
    '\n\nPress any key to start a practice block.'];
DrawFormattedText(p.window, text, 300, 'center', 255, p.wrapat);
Screen('Flip',p.window);
WaitSecs(1);
KbWait;

% Give practice
p.contrast = .4;
p.practice{1} = one_block(p, 5);
p.contrast = .25;
p.practice{2} = one_block(p, 5);
p.contrast = .15;
p.practice{3} = one_block(p, 5);
WaitSecs(.5);


% Give instruction
text = ['In the actual experiment the contrast will be a lot lower but at a '...
    'level where you''d still be able to guess the correct answer most of the time.'...
    '\n\nPress any key to continue with the next practice block with lower contrasts.'];
DrawFormattedText(p.window, text, 300, 'center', 255, p.wrapat);
Screen('Flip',p.window);
WaitSecs(1);
KbWait;

% More practice
p.contrast = .1;
p.practice{4} = one_block(p, 10);
p.contrast = .06;
p.practice{5} = one_block(p, 10);
p.contrast = .04;
p.practice{6} = one_block(p, 10);
WaitSecs(.5);

% Staircase
p.feedback = 0;
text = ['Good. During the actual experiment you won''t be given feedback after each trial. '...
    'You will now experience a block of trials without feedback to get used to not receiving feedback.'...
    '\n\nRemember to:'...
    '\n- Use the whole confidence scale as much as possible. '...
    '\n- Always fixate on the small fixation circle and not move your eyes around. '...
    '\n- Do your best!'...
    '\n\nPress any key to continue with the final practice block.'];
DrawFormattedText(p.window, text, 300, 'center', 255, p.wrapat);
Screen('Flip',p.window);
WaitSecs(1);
KbWait;
p.feedback = 0;
p.practice{7} = one_block_staircase(p, 100);
p.contrast = p.practice{7}.contrastToUse;
