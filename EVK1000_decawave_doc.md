# Flashing the EVB1000 UWB range modules from decawave

prequirements:
* Windows 7 PC
* ST-LINK V2 -> to flash the uC on the dev board.
* CooCox CoIDE -> IDE to build the firmware for the uC and to flash it with the ST-LINK V2
* download the software bundle: https://decawave.com/sites/default/files/decawave_software_package_0.exe

1. extract the SW package and navigate to `EVK_SW_Package\DecaRangingARMbased\Source_UNDER_LICENSE_ONLY\DecaRangingEVB1000_MP_rev3p05`
2. open den CooCox project `DecaRanging`
3. press F7 (build) and then press `download code to flash` 

output should be similar to: 
```
C:\Users\mydefault\Documents\decawave\EVK_SW_Package\DecaRangingARMbased\Source_UNDER_LICENSE_ONLY\DecaRangingEVB1000_MP_rev3p05>"C:/CooCox/CoIDE/bin\coflash.exe" program STM32F105RC "C:/Users/mydefault/Documents/decawave/EVK_SW_Package/DecaRangingARMbased/Source_UNDER_LICENSE_ONLY/DecaRangingEVB1000_MP_rev3p05/EVK1000/Debug/bin/EVK1000.bin" --adapter-name=ST-Link --port=SWD --adapter-clk=1000000 --erase=affected --driver="C:/CooCox/CoIDE/flash/STM32F10x_CL_256.elf"  

Erase:	 Done
Program:	 Done
Verify:	 Done
```