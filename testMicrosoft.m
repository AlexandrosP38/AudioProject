Frequency = 44100 ; 
nBits = 16 ; 
nChannels = 1 ; 
ID = -1; % default audio input device 
recObj = audiorecorder(Frequency,nBits,nChannels,ID);
disp('Start speaking.')
recordblocking(recObj,8);
disp('End of Recording.');
myRecording = getaudiodata(recObj);
recordedAudio = 'testAudio.wav';
audiowrite(recordedAudio,myRecording,Frequency);

speechObject = speechClient('Microsoft','language','el-GR');
[y,Fs] = audioread('testAudio.wav');
%soundsc(y, fs)
outInfo = speech2text(speechObject,y,Fs)
writetable(outInfo,'testOut.txt','WriteMode','Append','WriteRowNames',true)  
type 'testOut.txt'

