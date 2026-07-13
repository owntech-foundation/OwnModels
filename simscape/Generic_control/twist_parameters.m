%% Initialize twist parameters

%Low side parameters
twist_low_side_L = 33e-6;
twist_low_side_rL = 10e-3;
twist_low_side_C = 47e-6 + 3*4.7e-6;
twist_low_side_rC = 350e-3;
twist_low_side_adc_R = 150e3+470;

%High side parameters
twist_high_side_C = 33e-6*4 + 4.7e-6*12;
twist_high_side_rC = 0.1;
twist_high_side_adc_R = 330e3+5.6e3;

%High side feeder current
load('feeder_current.mat');
feeder_VHigh_min = 12;
feeder_VHigh_spacing = 6;
feeder_duty_min = 0.1;
feeder_duty_spacing = 0.4;

%MOSFET parameters
twist_FET_Ron = 0.025;
twist_FET_Rd = 0.01;
twist_FET_Vf = 1.2;
twist_FET_Rs = 1e5;
twist_FET_Cs = inf;

%Schottky diode parameters
twist_shottky_Ron = 0.35;
twist_shottky_Vf = 0.75;
twist_shottky_Rs = 1e5;
twist_shottky_Cs = inf;

%PWM generation
twist_freq_switching = 200e3; %carry switching frequency
twist_period_switching = 1/twist_freq_switching; %carry switching period
twist_pwm_resolution = 100e-9; %resolution of the PWM generator - increasing it reduces simulation time
twist_duty_cycle_min = 0.03; %minimum duty cycle
twist_duty_cycle_max = 0.9; %maximum duty cycle
twist_dead_time = 200e-9; %duty cycle positive dead time

%Duty cycle ramp input and pertubation
duty_step = 0.1; %ramp input increase
duty_switch_on_time = sim_time*0.5; %perturbation start time
duty_switch_off_time = sim_time*0.6; %perturbation stop time
duty_switch_step = 0.1; %perturbation value
