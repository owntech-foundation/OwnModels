%% Initialize twist parameters

%Low side parameters
twist_low_side_L = 33e-6;
twist_low_side_rL = 20e-3; %Modified
twist_low_side_C = 47e-6 + 3*4.7e-6;
twist_low_side_C_electrolytic = 47e-6;
twist_low_side_C_ceramic = 3*4.7e-6;
twist_low_side_rC = 700e-3;
twist_low_side_rC_ceramic = 0;
twist_low_side_adc_R = 150e3+470;

%High side parameters
twist_high_side_C = 33e-6*4 + 4.7e-6*12;
twist_high_side_rC = 0.1;
twist_high_side_adc_R = 1/(1/2e6 + 1/2e6 + 1/(330e3+5.6e3));
twist_high_side_feeder_R = 47e3+4.7e3;
R_parallel = 1/(1/twist_high_side_adc_R + 1/twist_high_side_feeder_R);
tau_VCC = 0.204;
tau_desactive = 0.2;
twist_R_VCC = (tau_VCC/twist_high_side_C  - twist_high_side_rC)/(1-(tau_VCC/twist_high_side_C - twist_high_side_rC)/R_parallel);

%High side feeder current
load('feeder_current.mat');
feeder_VHigh_min = 12;
feeder_VHigh_spacing = 6;
feeder_duty_min = 0.1;
feeder_duty_spacing = 0.4;
feeder_Vth_stop = 8.9;
feeder_Vth_start = 9.7;
feeder_current_upper_rate_limit = 0.386/(20e-3);
feeder_current_lower_rate_limit = -500;

%MOSFET parameters
twist_FET_Ron = 0.016;
twist_FET_Lon = 0;
twist_FET_Rd = 0.006;
twist_FET_Vf = 0.7;
twist_FET_Rs = 1e10;
twist_FET_Cs = inf;
twist_FET_Clow_Ron = 220e-3; 
twist_FET_Clow_Rd = 45e-3; %Modified
twist_FET_Clow_Vf = 0.7; %Modified


%Schottky diode parameters
twist_shottky_Ron = 0.48; %Modified
twist_shottky_Vf = 0.28; %Modified
twist_shottky_Rs = 1e10;
twist_shottky_Cs = inf;

%PWM generation
twist_freq_switching = 200e3; %carry switching frequency
twist_period_switching = 1/twist_freq_switching; %carry switching period
twist_pwm_resolution = 100e-9; %resolution of the PWM generator - increasing it reduces simulation time
twist_duty_cycle_min = 0; %minimum duty cycle
twist_duty_cycle_max = 1; %maximum duty cycle
twist_dead_time = 200e-9; %duty cycle positive dead time

% Initialize times and frequencies
twist_freq_data_sampling = 20e3; %data sampling frequency
twist_data_sampling_period = 1/twist_freq_data_sampling; %data sampling delay
twist_data_acquisition_delay = 50e-9; %data acquisition at the peak of the carry
