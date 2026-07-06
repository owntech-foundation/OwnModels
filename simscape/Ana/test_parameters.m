%% 1 module sim

% External parameters
R = 15; %load resistance [Ohm]
VDC = 40; %power supply voltage [V]
Rdec = 15; %resistance for discharging capacitor phase having 4 A [Ohm]

%Power supply model
power_supply_rC_up = 0.1;
power_supply_rC_down = 7.016e-2;
power_supply_C = 62.71e-2;