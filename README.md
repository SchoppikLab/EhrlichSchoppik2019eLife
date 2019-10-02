# EhrlichSchoppik2019eLife
Code related to 10.7554/eLife.45839.001
Instructions to use enclosed raw data and Matlab code to generate figures from 

‘A primal role for the vestibular sense in the development of coordinated locomotion’ 
by Ehrlich DE and Schoppik D in 2019 in eLife.
Department of Otolaryngology, Department of Neuroscience and Physiology, and the Neuroscience Institute, New York University School of Medicine, New York, NY 10016

Please cite this paper when the provided code is used.
Please contact us with questions at ehrlichde@gmail.com or schoppik@gmail.com.

I. Description of contents and directory architecture.
II. Instructions to generate figures from raw data.
III. Variable glossary

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I. Description of contents and directory architecture.

The provided 'Raw_Data_Unprocessed’ directory contains folders corresponding to groups or experiments: one for each developmental time-point (04dpf, 07dpf, 14dpf, and 21dpf); data from larvae with amputated pectoral fins and controls (Amputation_07dpf, Amputation_control_07dpf, Amputation_21dpf, Amputation_control_21dpf); data from larvae with cerebellar lesions and controls (CerebellarLesion, CerebellarLesionControl); data from larvae with utricle lesions and controls (OtogMutant, OtogControl); and data for each clutch (sibling group) across 48hrs for calculating clutch-specific coordination parameters (Development_48hr). Within each group folder is a subfolder for each clutch, named for the date of experimentation, containing raw data (tab delimited positions and orientations of fish with timestamps) calculated from live video feeds using LabView computer vision software (custom code available by request). 

The ‘Code’ directory contains the master script to generate figures from raw data (Generate_ES19_from_Raw_Master.m), a folder of called functions (Functions), and a circular statistics package (CircStat2012a) by Philipp Berens and Marc J. Velasco, redistributed with permission from original:
P. Berens, CircStat: A Matlab Toolbox for Circular Statistics, Journal of Statistical Software, Volume 31, Issue 10, 2009
http://www.jstatsoft.org/v31/i10

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
II. To generate figures from raw data:

Add ‘eLife_Ehrlich_Schoppik_2019’ to Matlab path with subfolders.
In the Raw_Data_Unprocessed directory run:
Generate_ES19_from_Raw_Master.m

*Please note, the simulations require many iterations to calculate smooth cost functions and may take a long time to complete. Subsections of code may be run piecemeal, but must be run in order due to dependence on preprocessing (first 2 sections of code) and interdependence between the figures (Appendix figures 1 and 2 rely on upstream analyses).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
III. Variable glossary

Swimming properties are saved in individual group and clutch folders and are defined in preprocessing code where created or appended. Brief definitions of some of these variables follow.

	AllTrajectory: concatenated trajectories (angle of instantaneous movement) from all observed and non-excluded frames (0 is horizontal), flipped about the vertical axis as needed such that 0 deg is always horizontal in the direction (left or right) the fish is pointed
	BodyAngles: Concatenated, pitch-axis postures (in deg) from all observed and non-excluded frames (0 is horizontal, positive is nose-up to horizontal).
	GrabbedTimes: concatenated time-stamps from all observed and non-excluded frames
	PropBoutAlignedAngVel: pitch-axis angular velocity during swim bouts for 750 msec preceding and 500 msec succeeding the instance of maximal translation speed
	PropBoutAlignedPitch: pitch-axis posture during swim bouts for 750 msec preceding and 500 msec succeeding the instance of maximal translation speed
	PropBoutAlignedSpeed: translation speed during swim bouts for 750 msec preceding and 500 msec succeeding the instance of maximal translation speed
	PropBoutAlignedTime: timestamps of observed swim bouts flanked with 750 msec of preceding and 500 msec of succeeding postural data, in hours
	PropBoutDisplacement: displacement across 600 msec temporally centered on each swim bout 
	PropBoutDuration: interpolated duration above 5 mm/sec translation speed for each swim bout
	PropBoutIEI: duration (in sec) between pairs of successive swim bouts	
	PropBoutTime: timestamps of observed swim bouts in hours
	TrajectoryMatchedAngles: observed pitch-axis postures corresponding to every instantaneous heading (translation direction)
	TrajectoryMatchedAngVels: observed pitch-axis angular velocities (smoothed by moving average with a span of 50 msec) corresponding to every instantaneous heading (translation direction)
	TrajectoryMatchedSpeeds: translation speeds corresponding to every instantaneous heading (translation direction)
	TrajectoryMatchedTimes: timestamps corresponding to every instantaneous heading (translation direction)

