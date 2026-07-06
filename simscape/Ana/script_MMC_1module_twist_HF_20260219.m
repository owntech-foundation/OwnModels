%% Clean everything
clear all; clc; 
% close all;

%% Sequence and Twist configuration

data_save = false; % true : save in a .mat file the following data : duty / VHigh / V1Low / V2Low / IHigh / I1Low / I2Low
power_losses = false; % true : takes into account power losses from the MOSFETs / false : no power losses
isInterleaved = false; % true : 180° phase shift between leg 1 and leg 2 / false : 0° phase shift
isC1low1Active = false;
isC2low1Active = false;
is6VExternallySupplied = false;
isFeederJumperOpen = false;


%% Simulation configuration

latest_sim_name = 'MMC_1module_twist_HF_20260219.slx'; %Version with modifications: Power supply characteristics, Feeder, Feeder threshold

latest_test_parameters = "test_parameters.m";
latest_twist_parameters = "twist_parameters.m";

sim_time = 1; %overall simulation time
t_init_sim = -0.01; % [s] Simulation start time
Ts = 1e-6; % [s] Simulation sample period

%Sequence variables - HF sequence
t1 = 0.35;
t2 = 0.38;
t3 = 0.8;
t4 = 0.83;
Vdc_off_time = 0.45; %[s] time where VDC = 0V
Vdc_on_time = 0; %[s] time where VDC = 40V
f_HF_test = 1e3; %[Hz] high frequency test frequency

%% Setup depending on user configuration

if(~isInterleaved)
    twist_phase_shift_leg_2_deg = 0; %no phase shift
else
    twist_phase_shift_leg_2_deg = 180; %interleaved phase shift
end

if(~isC1low1Active)
    C1low1_active = 0;
else
    C1low1_active = 1;
end

if(~isC2low1Active)
    C2low1_active = 0;
else
    C2low1_active = 1;
end

%% Initialize test parameters

run(latest_test_parameters);
%% Initialize twist parameters

run(latest_twist_parameters);
source_V = 0;  %source voltage [V] - inicial module capacitor voltage

if(is6VExternallySupplied == false)
    feeder_current_lower_rate_limit = -300;
else
    feeder_current_lower_rate_limit = -10;

end


%% Start simulink simulation

tic

open(latest_sim_name);
sim(latest_sim_name);
    
if(data_save == true)
    % Data output save
    results = ans;
    VDC_name = string(VDC);
    if(is6VExternallySupplied == false)
        if(isC1low1Active == true)
            save('sim_results/20251006/haute_frequence/results_SIM_VDC'+VDC_name+'V_'+Rdec+'Ohms_Haute_Frequence'+round(f_HF_test)+'Hz_feeder_avecC1low','results');
        else
            save('sim_results/20251006/haute_frequence/results_SIM_VDC'+VDC_name+'V_'+Rdec+'Ohms_Haute_Frequence'+round(f_HF_test)+'Hz_feeder_sansC1lowelec','results');
        end
    else
        if(isFeederJumperOpen == true)
            if(isC1low1Active == true)
                save('sim_results/20251006/haute_frequence/results_SIM_VDC'+VDC_name+'V_'+Rdec+'Ohms_Haute_Frequence'+round(f_HF_test)+'Hz_6Vext_avecC1low_jumperopen','results');
            else
                save('sim_results/20251006/haute_frequence/results_SIM_VDC'+VDC_name+'V_'+Rdec+'Ohms_Haute_Frequence'+round(f_HF_test)+'Hz_6Vext_sansC1lowelec_jumperopen','results');
            end
        else
            if(isC1low1Active == true)
                save('sim_results/20251006/haute_frequence/results_SIM_VDC'+VDC_name+'V_'+Rdec+'Ohms_Haute_Frequence'+round(f_HF_test)+'Hz_6Vext_avecC1low','results');
            else
                save('sim_results/20251006/haute_frequence/results_SIM_VDC'+VDC_name+'V_'+Rdec+'Ohms_Haute_Frequence'+round(f_HF_test)+'Hz_6Vext_sansC1lowelec','results');
            end
        end
        
    end
end

toc


