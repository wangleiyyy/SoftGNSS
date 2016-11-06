clear; close all; clc;
format ('compact');
format ('long', 'g');
%--- Include folders with functions ---------------------------------------
addpath include             % The software receiver functions
addpath geoFunctions        % Position calculation related functions

settings = initSettings();
fileNameStr = settings.fileName;
[fid, message] = fopen(fileNameStr, 'rb');

fseek(fid, settings.skipNumberOfBytes, 'bof');    

% Find number of samples per spreading code
samplesPerCode = round(settings.samplingFreq / ...
                       (settings.codeFreqBasis / settings.codeLength));

% Read 10ms of signal
[data, count] = fread(fid, [1, 10*samplesPerCode], settings.dataType);

fclose(fid);

 %--- Initialization ---------------------------------------------------
    figure(100);
    clf(100);
    
    timeScale = 0 : 1/settings.samplingFreq : 5e-3;    
    
    %--- Time domain plot -------------------------------------------------
    subplot(2, 2, 1);
    plot(1000 * timeScale(1:round(samplesPerCode/50)), ...
         data(1:round(samplesPerCode/50)));
     
    axis tight;
    grid on;
    title ('Time domain plot');
    xlabel('Time (ms)'); ylabel('Amplitude');
    
    %--- Frequency domain plot --------------------------------------------
    subplot(2,2,2);
    pwelch(data-mean(data), 16384, 1024, 2048, settings.samplingFreq/1e6)
    
    axis tight;
    grid on;
    title ('Frequency domain plot');
    xlabel('Frequency (MHz)'); ylabel('Magnitude');
    
    %--- Histogram --------------------------------------------------------
    subplot(2, 2, 3.5);
    hist(data, -128:128)
    
    dmax = max(abs(data)) + 1;
    axis tight;
    adata = axis;
    axis([-dmax dmax adata(3) adata(4)]);
    grid on;
    title ('Histogram'); 
    xlabel('Bin'); ylabel('Number in bin');
