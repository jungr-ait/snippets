# Flashing the EVB1000 UWB range modules from decawave

prequirements:
* decaWave EVK1000 (DW1000 Evaluation Kit)
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

## EVB1000 ON-BOARD RANGING APPLICATION

read section 3 of the EVK1000_User_Manual.pdf (in the EVK_SW_Package folder)
[doc](https://www.decawave.com/sites/default/files/evk1000_user_manual_v1.12.pdf)


### Read measurements via USART/USB

Try to run:
```
srceen /dev/ttyACM0 115200
```

The tag should output something like (~1.1 m distance):
```
ia255f t1620 00000428 0000039c 081a 4045 4045 a
ia255f t1620 0000042c 000003a0 081b 4045 4045 a
ia255f t1620 00000423 00000397 081c 4045 4045 a
ia255f t1620 00000402 00000376 081d 4045 4045 a
ia255f t1620 000003fd 00000371 081e 4045 4045 a

```

The anchor should output something like:
```
ia255f t1620 000003f9 0000036d 003f 4051 4051 t
ia255f t1620 0000041e 00000392 0040 4051 4051 t
ia255f t1620 00000428 0000039c 0041 4051 4051 t
ia255f t1620 00000464 000003d8 0042 4051 4051 t
ia255f t1620 00000477 000003f5 0043 4051 4051 t
ia255f t1620 0000043f 000003b3 0044 4051 4051 t
ia255f t1620 00000423 00000397 0045 4051 4051 t
ia255f t1620 000003d3 00000347 0046 4051 4051 t
ia255f t1620 000004ec 0000046a 0047 4051 4051 t
```

Format (DecaRanging_ARM_Source_Code_Guide.pdf, page 16):
```
The application also outputs some debug information over the virtual COM port. Figure 10 shows example
output from an anchor. Each TOF report starts with “i” then aXXXX and tYYYY where XXXX are the 16 LSBs of
anchor address and YYYY are the 16 LSBs of tags address. The third column is the range in mm (32 bit hex
number) after bias correction has been applied, the fourth column is the raw range in mm (32 bit hex
number). This is followed by number of ranges (16 bit hex number) and then TX and RX antenna delays (16
bit hex number). The last column is “t” for a tag and “a” for an anchor.
```
