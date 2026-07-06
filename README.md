# OwnModels

`OwnModels` gathers OwnTech simulation models for two toolchains:

- `plecs/` for PLECS-based models and reusable library blocks
- `simscape/` for MATLAB/Simulink/Simscape-based models

## Repository layout

### `plecs/`

This folder contains the current PLECS assets in the repository:

- [`plecs/owntech-lib/Owntech_lib.plecs`](plecs/owntech-lib/Owntech_lib.plecs): reusable OwnTech PLECS library
- [`plecs/Open loop/Twist_open_loop.plecs`](<plecs/Open loop/Twist_open_loop.plecs>): open-loop switched example
- [`plecs/Voltage Mode Buck/Twist_voltage_mode_buck.plecs`](<plecs/Voltage Mode Buck/Twist_voltage_mode_buck.plecs>): closed-loop switched buck model
- [`plecs/Voltage Mode Buck/Twist_voltage_mode_buck_AVG.plecs`](<plecs/Voltage Mode Buck/Twist_voltage_mode_buck_AVG.plecs>): averaged closed-loop buck model
- [`plecs/docs/`](plecs/docs/): PLECS setup and example documentation, with screenshots and license file

Folder-level notes are available in:

- [`plecs/owntech-lib/README.md`](plecs/owntech-lib/README.md)
- [`plecs/Open loop/README.md`](<plecs/Open loop/README.md>)
- [`plecs/Voltage Mode Buck/README.md`](<plecs/Voltage Mode Buck/README.md>)

### `simscape/`

This folder contains the current Simscape model and its supporting data:

- [`simscape/owntech_model_simscape.slx`](simscape/owntech_model_simscape.slx): Simulink/Simscape buck-converter model
- [`simscape/script_owntech_model.m`](simscape/script_owntech_model.m): main MATLAB entry point used to configure and run simulations
- [`simscape/twist_parameters.m`](simscape/twist_parameters.m): electrical and control parameters used by the model
- [`simscape/feeder_current.mat`](simscape/feeder_current.mat): feeder-current dataset loaded by the parameter script
- [`simscape/README.md`](simscape/README.md): local usage notes for the Simscape model

## Documentation

The repository documentation is now stored under [`plecs/docs/`](plecs/docs/) and currently focuses on the PLECS workflow:

- [`plecs/docs/getting_started.md`](plecs/docs/getting_started.md): install PLECS and register the OwnTech library
- [`plecs/docs/first_example.md`](plecs/docs/first_example.md): run the open-loop PLECS example
- [`plecs/docs/voltage_mode_simulation.md`](plecs/docs/voltage_mode_simulation.md): run the closed-loop switched and averaged voltage-mode buck examples

Supporting screenshots for these guides are stored in [`plecs/docs/Images/`](plecs/docs/Images/).

## Quick start

### PLECS

1. Install PLECS Standalone.
2. Add [`plecs/owntech-lib/`](plecs/owntech-lib/) to the PLECS library/search path and load [`Owntech_lib.plecs`](plecs/owntech-lib/Owntech_lib.plecs).
3. Use the setup and walkthrough guides in [`plecs/docs/`](plecs/docs/).
4. Open one of the example models from [`plecs/Open loop/`](<plecs/Open loop/>) or [`plecs/Voltage Mode Buck/`](<plecs/Voltage Mode Buck/>).

### Simscape

1. Open MATLAB with Simulink and Simscape available.
2. Run [`simscape/script_owntech_model.m`](simscape/script_owntech_model.m).
3. Adjust the user configuration in `script_owntech_model.m` and the model constants in `twist_parameters.m` as needed.

## License

The repository is distributed under the GNU Lesser General Public License v2.1. See [`LICENSE`](LICENSE).
