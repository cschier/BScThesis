%% DISCLAIMER
% All configurations and analysis scripts were adopted from the tutorial-style 
% manuscript explaining the use of the ADAM toolbox by Fahrenfort et al. (2018) 
% and adjusted for to means of the present analysis.

%% Start Toolbox and add dependencies
clear;
addpath('X:\Programme\Matlab\ADAM-1.0.4\install');
run('X:\Programme\Matlab\ADAM-1.0.4\install\startup.m');


%% Second Level
% 1 - Diagonal Decoding
% 2 - Temporal Generalisation


%% 1.1 COMPUTE DIAGONAL DECODING, ALL EEG COMPARISONS

cfg = [];                                   % clear the config variable
cfg.startdir = 'C:\MVPA\RESULTS';           % path to first level results 
cfg.mpcompcor_method = 'cluster_based';     % 'fdr' or 'cluster_based'
cfg.reduce_dims = 'diag';                   % 'diag' means train and test on the same points, i.e. no temporal generalisation
cfg.plotsubjects = false;                   % whether to plot single subject results

cfg.plot_order = {'Load' 'C1_Load' 'lower_RDK_Load' 'upper_RDK_Load' 'C1_vs_lower_RDK' 'C1_vs_upper_RDK' 'lower_RDK_vs_upper_RDK'};

mvpa_stats = adam_compute_group_MVPA(cfg);  % compute diagonal decoding


%% 1.2 PLOT DIAGONAL DECODING FOR EEG COMPARISONS
% only works on matlab 2014b or higher

cfg = [];                                   % clear the config variable
cfg.singleplot = false;                     % put all patterns in a single plot (true) or separate plots (false)
cfg.acclim = [0.45 0.75];                   % specify y-axis limits
adam_plot_MVPA(cfg, mvpa_stats);            % actual plotting


%% 2.1 COMPUTE ALL TEMPORAL GENERALIZATION MATRICES
% i.e. compute the stability of neural activity over time
% temporal generalisation matrices display how well classification
% performance for a given time generalises to all other time samples

cfg = [];                                   % clear the config variable
cfg.startdir = 'C:\MVPA\RESULTS';           % path to first level results 
cfg.mpcompcor_method = 'cluster_based';     % 'fdr' or 'cluster_based'
cfg.iterations = 250;                       % reduce the number of iterations to save time
cfg.plot_order = {'Load' 'C1_Load' 'lower_RDK_Load' 'upper_RDK_Load' 'C1_vs_lower_RDK' 'C1_vs_upper_RDK' 'lower_RDK_vs_upper_RDK'};

eeg_stats = adam_compute_group_MVPA(cfg);   % select RAW_EEG when dialog appears


%% 2.2 PLOT ALL TEMPORAL GENERALIZATION MATRICES
cfg = [];                                   % clear the config variable
cfg.acclim = [0.32 0.68];                   % specify the AUC limits if necessary
adam_plot_MVPA(cfg, eeg_stats);             % actual plotting of all matrices
