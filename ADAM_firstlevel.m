%% Start ADAM Toolbox and add Dependencies
clear;
addpath('X:\Programme\Matlab\ADAM-1.0.4\install');
run('X:\Programme\Matlab\ADAM-1.0.4\install\startup.m');

%% First Level
% configurations

eeg_filenames = {'HC101' 'HC102' 'HC103' 'HC104' 'HC105' 'HC106' ... 
    'HC107' 'HC108' 'HC110' 'HC115' 'HC116' 'HC119' 'HC120' 'HC121' ... 
    'HC123' 'HC124' 'HC125' 'HC126' 'HC127' 'HC129' 'HC132' 'HC133' ...
    'HC134' 'HC135' 'HC137' 'HC138' 'HC139' 'HC140' 'HC141' 'HC142' ...
    'HC143' 'HC144' 'HC145' 'HC148' 'HC149' 'HC150' 'HC151' 'HC153'};

% event code specifications for factor task
C1_Task = [11 12]; 
dot_upper = [21 22]; 
dot_lower = [31 32]; 

% event code specifications for factor load
load_low = [11 21 31]; 
load_high = [12 22 32]; 

% GENERAL ANALYSIS CONFIGURATION SETTINGS
cfg = [];                       % clear the config variable
cfg.datadir = 'C:\MVPA\DATA';   % this is where the raw data files are
cfg.balance_classes_method = 'oversample'; % balance classes in training set (default 'oversample')
cfg.model = 'BDM';              % backward decoding model ('BDM') 
cfg.raw_or_tfr = 'raw';         % classify raw or time frequency representations ('tfr')
cfg.nfolds = 5;                 % the number of folds to use in k-fold cross-validation
cfg.class_method = 'AUC';       % the performance measure to use (e.g. 'AUC' or 'accuracy')
cfg.crossclass = 'yes';         % whether to compute temporal generalization (yes/no)
cfg.channelpool = 'EEG';        % the channel selection to use
cfg.resample = 'no';            % downsample (useful for temporal generalization)
cfg.erp_baseline = [-.1,0];     % baseline correction in sec. ('no' for no correction)
cfg.class_type = 'linear';      % which classifier to use: 'linear' for using LDA

%%

% Low Load vs. High Load
cfg.filenames = eeg_filenames;                              % data filenames 
cfg.class_spec{1} = cond_string(load_low);                  % the first stimulus class
cfg.class_spec{2} = cond_string(load_high);                 % the second stimulus class
cfg.outputdir = 'C:\MVPA\RESULTS1\EEG_RAW\Load';            % where to save the results
adam_MVPA_firstlevel(cfg);                                  % run first level analysis
%%

% C1 Task Low Load vs. C1 Task High Load
cfg.filenames = eeg_filenames;                              % data filenames 
cfg.class_spec{1} = cond_string(C1_Task, load_low);         % the first stimulus class
cfg.class_spec{2} = cond_string(C1_Task, load_high);        % the second stimulus class
cfg.outputdir = 'C:\MVPA\RESULTS\EEG_RAW\C1_Load';          % where to save the results
adam_MVPA_firstlevel(cfg);                                  % run first level analysis


% Lower RDK Low Load vs. Lower RDK High Load
cfg.filenames = eeg_filenames;                              % data filenames 
cfg.class_spec{1} = cond_string(dot_lower, load_low);       % the first stimulus class
cfg.class_spec{2} = cond_string(dot_lower, load_high);      % the second stimulus class
cfg.outputdir = 'C:\MVPA\RESULTS\EEG_RAW\lower_RDK_Load';   % where to save the results
adam_MVPA_firstlevel(cfg);                                  % run first level analysis


% Upper RDK Low Load vs. Upper RDK High Load
cfg.filenames = eeg_filenames;                              % data filenames 
cfg.class_spec{1} = cond_string(dot_upper, load_low);       % the first stimulus class
cfg.class_spec{2} = cond_string(dot_upper, load_high);      % the second stimulus class
cfg.outputdir = 'C:\MVPA\RESULTS\EEG_RAW\upper_RDK_Load';   % where to save the results
adam_MVPA_firstlevel(cfg);                                  % run first level analysis


% C1 Task vs. Lower RDK Task
cfg.filenames = eeg_filenames;                              % data filenames 
cfg.class_spec{1} = cond_string(C1_Task);                   % the first stimulus class
cfg.class_spec{2} = cond_string(dot_lower);                 % the second stimulus class
cfg.outputdir = 'C:\MVPA\RESULTS\EEG_RAW\C1_vs_lower_RDK';  % where to save the results
adam_MVPA_firstlevel(cfg);                                  % run first level analysis


% C1 Task vs. Upper RDK Task
cfg.filenames = eeg_filenames;                              % data filenames 
cfg.class_spec{1} = cond_string(C1_Task);                   % the first stimulus class
cfg.class_spec{2} = cond_string(dot_upper);                 % the second stimulus class
cfg.outputdir = 'C:\MVPA\RESULTS\EEG_RAW\C1_vs_upper_RDK';  % where to save the results
adam_MVPA_firstlevel(cfg);                                  % run first level analysis


% Lower RDK Task vs. Upper RDK Task
cfg.filenames = eeg_filenames;                              % data filenames 
cfg.class_spec{1} = cond_string(dot_lower);                 % the first stimulus class
cfg.class_spec{2} = cond_string(dot_upper);                 % the second stimulus class
cfg.outputdir = 'C:\MVPA\RESULTS\EEG_RAW\lower_RDK_vs_upper_RDK'; % where to save the results
adam_MVPA_firstlevel(cfg);      % run first level analysis
