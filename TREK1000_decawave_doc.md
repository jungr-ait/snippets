# TREK1000 decawave development kit

download the source code from:
https://www.decawave.com/sites/default/files/decawave_trek.exe

download the PC application:
https://decawave.com/sites/default/files/decawave_trek1000_arm2.25mx_pc3.8_2.zip


## Hardware setup 

The kit is shipped with 4 modules. So three of them must be configured as `Anchors` with the IDs 0-3. An the `Tag` can be set from 0-7. Refere to the documentation for the 8-pol dipswitch `SW4`.  The `EVB1000` modules should be flashed with the `DecaRangeRTLS_AMR_Source_Code` in the version `2.6`. 

## Run the position demo

On Windows the app `DecaRangeRTLS` can be used to visualize the positions of the Anchors and the Tag. You have two options: A) the relative position of the Anchors are measured manually. So you need to specify that information in the Anchor section and only need to connect the Tag with the PC. The Anchors can be powered via a USB power adapter. B) You place the Anchors randomly, select `Use Auto - Positionng` and connect both an Anchor and a Tag with the PC. The other Anchors can be powered via a USB power adapter. Then the app will calculate the position of the Anchors for you. 

If you power the modules, check if the firmware version correct (2.6). If no LEDs are on of if the display is empty something is wrong -> pls. refer to the manual.
