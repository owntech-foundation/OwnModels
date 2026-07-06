%% Clean everything
clear all; clc; 
% close all;

%% User configuration

quick_sim = true;  %  true : simulation for [user choice] data acquisition / false : simulation for 500 data acquisition
data_save = false ; % true : save in a .mat file the following data : duty / VHigh / V1Low / V2Low / IHigh / I1Low / I2Low
constant_duty = true;  % false : duty cycle reference will change each simulation [0.1, 0.2 ... 0.9] when quick_sim == false
constant_src_V = true; % false : vhigh reference will change each simulation [24, 48, 72] when quick_sim == false

load_leg1 = true; % true : load is linked to leg 1 / false : load is linked to leg 2
duty_switch = true; % true : change of the duty cycle during the simulation for a small period / false : constant duty cycle during simulation
power_losses = true; % true : takes into account power losses from the MOSFETs / false : no power losses

isInterleaved = true; % true : 180° phase shift between leg 1 and leg 2 / false : 0° phase shift

%% Setup depending on user configuration

if(~constant_src_V)
    source_V_tab = 24:24:72; %source voltage [V] - simulation for several VHigh
    loop_sim_src_V = length(source_V_tab);
else
    source_V = 24;  %source voltage [V] - user value
    loop_sim_src_V = 1;
end

if(~constant_duty)
    duty_tab = 0.1:0.1:0.9;    %switching cycle - simulation for several duty cycle
    loop_sim_duty = length(duty_tab);
else
    duty_cycle = 0.5;  %switching cycle - user value
    loop_sim_duty = 1;
end

if(~quick_sim)
    RECORD_SIZE = 500;  %number of data sampled - used to plot data with Core-Main
else
    RECORD_SIZE = 100;   %number of data sampled - user value
end

if(~isInterleaved)
    twist_phase_shift_leg_2_deg = 0; %no phase shift
else
    twist_phase_shift_leg_2_deg = 180; %interleaved phase shift
end

%% Simulation configuration

% Initialize times and frequencies
twist_freq_data_sampling = 20e3; %data sampling frequency
twist_data_sampling_period = 1/twist_freq_data_sampling; %data sampling delay
twist_data_acquisition_delay = 50e-9; %data acquisition at the peak of the carry

sim_time = RECORD_SIZE*twist_data_sampling_period; %overall simulation time

% Initialize the source parameters
source_R = 0.1; %source internal resistance [Ohm]
source_L = 5e-6; %source internal inductance [H]

% Intialize the load parameters
load_R = 10; %load resistance [Ohm]
load_switch_R = 1e-6; %linked switch resistance [Ohm]

%% Initialize twist parameters

run("twist_parameters.m");

%% Start simulink simulation

tic

open('owntech_model_simscape.slx');

if(~quick_sim)
    for src_V_index=1:loop_sim_src_V
        for duty_index=1:loop_sim_duty

            if(~constant_src_V)
                source_V = source_V_tab(src_V_index);
            end

            if(~constant_duty)
                duty_cycle = duty_tab(duty_index);    
            end

            sim('owntech_model_simscape.slx');
            
            if(data_save == true)
                % Data output save
                results = ans;
                duty_name = string(duty_cycle*100);
                src_V_name = string(source_V);
                save('results_SIMSC_duty'+duty_name+'%_VHigh'+src_V_name,'results');
            end
        end
    end
else
    sim('owntech_model_simscape.slx');
    
    if(data_save == true)
        % Data output save
        results = ans;
        duty_name = string(duty_cycle*100);
        src_V_name = string(source_V);
        save('results_SIMSC_duty'+duty_name+'%_VHigh'+src_V_name,'results');
    end
end

toc


