# Multivariate Pattern Analysis of Early Event-Related Potentials in Visual Attention Tasks - B.Sc. Thesis by Clara Schier (2021)
This repository contains the analysis scripts used for the multivariate pattern analysis. 
Due to repository size limitations, the raw data and the resulting (*.mat) Matlab structs are not available on GitHub.
The analysis is executed using the [Amsterdam Decoding and Modelling Toolbox](https://github.com/fahrenfort/ADAM) developed by Fahrenfort et al. (2018).

# Structure
* **DATA**: This folder contains the raw EEG data. Each file contains all trials from one participant.
* **RESULTS**: This folder contains all first-level classification results.
* **`ADAM_firstlevel.m`**: Using this MATLAB script, the RESULTS were calculated with raw DATA input.
* **`ADAM_secondlevel.m`**: Using this MATLAB script, the calculated RESULTS were analysed statistically and plotted.
* **`eeg_stats.mat`** & **`mvpa_stats.mat`**: These MATLAB structs contain the variable outputs of `ADAM_secondlevel.m`.

# Abstract
Top-down attentional modulation of early neural processing is subject to ongoing research, but findings are inconsistent. 
In line with previous studies, the effects of spatial attention, perceptual load and task relevance were examined in this thesis. 
Previous research has often focused on whether the C1, the earliest event-related potential (ERP) component in visual processing known to date, shows any attention-related effects. 
Instead, this work concentrates on exploring how early attentional manipulations influence neural processing using a multivariate pattern analysis (MVPA) approach. 
Electroencephalography (EEG) recordings from 38 participants were used to train classifiers to separate between trials of two experimental conditions to find potential differences in the underlying neural patterns. 
Decoding performance over time indicates that the earliest significant signal differences occur 31 ms before stimulus onset, which can be attributed to the manipulation of the task relevance factor. 
In contrast to univariate ERP analyses, task relevance also accounts for the largest effects over time compared to perceptual load and spatial attention.
Additionally generated temporal generalisation matrices suggest that these effects are time-specific, whereas both perceptual load and spatial attention show homogeneous effects over time. 
This study provides evidence for early modulation of neural processing by all three factors spatial attention, perceptual load and task relevance, with the observed effects of task relevance
being both the strongest and the earliest.

# References
* Fahrenfort, J. J., van Driel, J., van Gaal, S., & Olivers, C. N. L. (2018). From ERPs to MVPA Using the Amsterdam Decoding and Modeling Toolbox (ADAM). Frontiers in Neuroscience, 12. http://doi.org/10.3389/fnins.2018.00368
