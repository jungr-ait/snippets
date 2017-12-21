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

The programm uses the serial interface (115200 baud, 8N1) of the board to read out data. Anchors and Tags are providing different data. Output of the modules are described in the document `DecaRangeRTLS_ARM_Source_Code_Guide.pdf`.  

Anchor[0] output:
```
mr 07 00000407 0000082b 000007a3 00000000 6cba 09 40414041 a0:0
ma 0e 00000000 000006d9 0000069c 0000026b 6cbd 51 00a0641e a0:0
mc 07 000004ec 000008ee 0000087e 00000000 6cc0 0a 00a0642b a0:0
mr 07 0000041a 00000830 000007c0 00000000 6cc0 0a 40414041 a0:0
ma 0e 00000000 000006cb 000006a5 00000282 6cc3 52 00a06482 a0:0
mc 07 000004de 00000901 000008a3 00000000 6cc6 0b 00a0648f a0:0
mr 07 0000040c 00000843 000007e5 00000000 6cc6 0b 40414041 a0:0
ma 0e 00000000 000006c6 000006a0 000002b6 6cc9 53 00a064e6 a0:0
mc 07 000004c7 000008e9 0000089a 00000000 6ccc 0c 00a064f3 a0:0
mr 07 000003f5 0000082b 000007dc 00000000 6ccc 0c 40414041 a0:0
ma 0e 00000000 000006d4 00000689 000002ac 6
```
Tag[0] output:
```
mc 07 000004b0 000008e5 00000854 00000000 2cef 15 00af89a4 t0:0
mr 07 000003d4 00000827 0000078c 00000000 2cef 15 40514051 t0:0
mc 07 000004cb 000008c4 0000089e 00000000 2cf2 16 00af8a08 t0:0
mr 07 000003f9 00000806 000007e0 00000000 2cf2 16 40514051 t0:0
mc 07 000004e7 000008f7 00000882 00000000 2cf5 17 00af8a6c t0:0
mr 07 00000415 00000839 000007c4 00000000 2cf5 17 40514051 t0:0
mc 07 000004c7 000008e9 000008a3 00000000 2cf8 18 00af8ad0 t0:0
mr 07 000003f5 0000082b 000007e5 00000000 2cf8 18 40514051 t0:0
mc 07 000004e3 000008d7 000008b6 00000000 2cfb 19 00af8b34 t0:0
mr 07 00000411 00000819 000007f8 00000000 2cfb 19 40514051 t0:0
mc 07 00000498 000008cd 00000895 00000000 2cfe 1a 00af8b98 t0:0
mr 07 000003bc 0000080f 000007d7 00000000 2cfe 1a 40514051 t0:0

```

mr - raw Tag distances, mc - corrected Tag distances, ma - Anchor distances.
