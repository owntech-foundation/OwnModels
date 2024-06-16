# Gettings started with PLECS

PLECS is a software tool for system-level simualtions of electrical circuits developed by [Plexim](https://www.plexim.com/).
It is not open-source, but it remains very accessible, which is a reason why we adopted it as one of the solutions to model our power converters.
In this section we will explain to you how to get started with PLECS and run your first simulation.

## Installing PLECS

To install PLECS, go to their website and download the [standalone package](https://www.plexim.com/download/standalone).
Choose your platform and follow the [instructions](https://www.plexim.com/support/installation_help/standalone).



!!! warning "PLECS LICENSE"
    There are three ways where you can use PLECS. Choose the one of your convenience.
    === "Trial license"
        PLECS provides a 90 days trial license for its products. Follow their [dedicated page](https://www.plexim.com/trial/standalone) to get yours.

    === "Demo mode"
        If you do not want to ask for a license, you can still use PLECS in its demo mode. You will still be able to run the simulations, but you will not be able to modify the model or save its data.

    === "JCGE 2024 special license"
        During the [JCGE 2024 conference](https://seeds-jcge24.sciencesconf.org/) we will provide you with a special license that you can get with by [clicking here](../docs/license/license.lic).

        This License will expire on **June 23rd 2024**.


Once PLECS is installed, you will see its library browser. You are now ready to start working with OwnModels.

![PLECS Library Browse](docs/Images/PLECS_library_browser.png)

## Getting the OwnModels PLECS library

This section will show you how to add the OwnTech library to your PLECS instance.

1. Go to the [OwnModels repository](https://github.com/owntech-foundation/OwnModels) of the owntech foundation github.
2. Either clone it locally (if you know how to use git) or download the

On your first time opening PLECS standalone, you will


![example of implementation of PID](Images/PID_voltage.png)
_Image : Example of implementation of PID with Owntech Blockset in Simulink_

Owntech blocksets might be useful for you if:

-    You work in fields like research and development, simulation, or other areas where Matlab/Simulink is used regularly.
-    You are interested in quickly generating and deploying code using Simulink blocksets and the Embedded Coder add-on.

!!! tip
    It is not required, but you can try to follow first this [tutorial](https://github.com/owntech-foundation/Tutorials/wiki) to become familiar with owntech hardware and software.

!!! abstract Hardware prerequisited

    - A TWIST power board
    - A 50V power supply
    - A resistive load (like an electronic load, or a variable resistive load)strike counter in the middle of the window

!!! abstract Software prerequisite

    - Matlab-Simulink
    - Embedded coder toolbox
    - [Visual Studio Code with PlatformIO](https://owntech-foundation.github.io/Documentation/core/docs/vscode_setup/)
