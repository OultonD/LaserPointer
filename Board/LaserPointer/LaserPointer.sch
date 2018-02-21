EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:LaserPointer-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA328-PU ATMEGA1
U 1 1 5A87319C
P 3400 2400
F 0 "ATMEGA1" H 2650 3650 50  0000 L BNN
F 1 "ATMEGA328-PU" H 3800 1000 50  0000 L BNN
F 2 "Housings_DIP:DIP-28_W7.62mm" H 3400 2400 50  0001 C CIN
F 3 "" H 3400 2400 50  0001 C CNN
	1    3400 2400
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x06 Yaw1
U 1 1 5A8731D5
P 3250 4600
F 0 "Yaw1" H 3250 4900 50  0000 C CNN
F 1 "Yaw" H 3250 4200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 3250 4600 50  0001 C CNN
F 3 "" H 3250 4600 50  0001 C CNN
	1    3250 4600
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 5A8732DE
P 6050 1850
F 0 "C1" H 6060 1920 50  0000 L CNN
F 1 "22pF" H 6060 1770 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6050 1850 50  0001 C CNN
F 3 "" H 6050 1850 50  0001 C CNN
	1    6050 1850
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C2
U 1 1 5A87333C
P 6050 2050
F 0 "C2" H 6060 2120 50  0000 L CNN
F 1 "22pF" H 6060 1970 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6050 2050 50  0001 C CNN
F 3 "" H 6050 2050 50  0001 C CNN
	1    6050 2050
	0    -1   -1   0   
$EndComp
$Comp
L Crystal XTAL1
U 1 1 5A873367
P 5550 1950
F 0 "XTAL1" H 5550 2100 50  0000 C CNN
F 1 "XTAL" H 5550 1800 50  0000 C CNN
F 2 "Crystals:Crystal_HC49-U_Vertical" H 5550 1950 50  0001 C CNN
F 3 "" H 5550 1950 50  0001 C CNN
	1    5550 1950
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x06 Pitch1
U 1 1 5A87349D
P 4250 4600
F 0 "Pitch1" H 4250 4900 50  0000 C CNN
F 1 "Pitch" H 4250 4200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 4250 4600 50  0001 C CNN
F 3 "" H 4250 4600 50  0001 C CNN
	1    4250 4600
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 Lsr1
U 1 1 5A873504
P 5250 2650
F 0 "Lsr1" H 5250 2750 50  0000 C CNN
F 1 "LASER" H 5250 2450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5250 2650 50  0001 C CNN
F 3 "" H 5250 2650 50  0001 C CNN
	1    5250 2650
	1    0    0    -1  
$EndComp
$Comp
L 74HC595 U1
U 1 1 5A873540
P 4800 6050
F 0 "U1" H 4950 6650 50  0000 C CNN
F 1 "74HC595" H 4800 5450 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 4800 6050 50  0001 C CNN
F 3 "" H 4800 6050 50  0001 C CNN
	1    4800 6050
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x08_Top_Bottom J5
U 1 1 5A873659
P 6150 5950
F 0 "J5" H 6200 6350 50  0000 C CNN
F 1 "LCD" H 6200 5450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x08_Pitch2.54mm" H 6150 5950 50  0001 C CNN
F 3 "" H 6150 5950 50  0001 C CNN
	1    6150 5950
	1    0    0    -1  
$EndComp
$Comp
L Barrel_Jack J4
U 1 1 5A873707
P 800 4650
F 0 "J4" H 800 4860 50  0000 C CNN
F 1 "Barrel_Jack" H 800 4475 50  0000 C CNN
F 2 "Connectors:BARREL_JACK" H 850 4610 50  0001 C CNN
F 3 "" H 850 4610 50  0001 C CNN
	1    800  4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2100 5950 2050
Connection ~ 5550 2100
Wire Wire Line
	5950 1800 5950 1850
Connection ~ 5550 1800
$Comp
L Conn_01x03 IR1
U 1 1 5A8C4A23
P 5250 3200
F 0 "IR1" H 5250 3400 50  0000 C CNN
F 1 "IR" H 5250 3000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5250 3200 50  0001 C CNN
F 3 "" H 5250 3200 50  0001 C CNN
	1    5250 3200
	1    0    0    -1  
$EndComp
Text Label 4400 3600 0    60   ~ 0
Pitch1
Text Label 4400 1300 0    60   ~ 0
Pitch2
Text Label 4400 1400 0    60   ~ 0
Pitch3
Text Label 4400 1500 0    60   ~ 0
Pitch4
Text Label 4400 3200 0    60   ~ 0
Yaw1
Text Label 4400 3300 0    60   ~ 0
Yaw2
Text Label 4400 3400 0    60   ~ 0
Yaw3
Text Label 4400 3500 0    60   ~ 0
Yaw4
Text Label 3050 4500 2    60   ~ 0
Yaw1
Text Label 3050 4600 2    60   ~ 0
Yaw2
Text Label 3050 4700 2    60   ~ 0
Yaw3
Text Label 3050 4800 2    60   ~ 0
Yaw4
Text Label 4400 1800 0    60   ~ 0
SPI_SCK
Text Label 4400 1600 0    60   ~ 0
SPI_MOSI
Text Label 4400 1700 0    60   ~ 0
SPI_MISO
Text Label 4050 4500 2    60   ~ 0
Pitch1
Text Label 4050 4600 2    60   ~ 0
Pitch2
Text Label 4050 4700 2    60   ~ 0
Pitch3
Text Label 4050 4800 2    60   ~ 0
Pitch4
$Comp
L VCC #PWR01
U 1 1 5A8C7378
P 2500 1300
F 0 "#PWR01" H 2500 1150 50  0001 C CNN
F 1 "VCC" H 2500 1450 50  0000 C CNN
F 2 "" H 2500 1300 50  0001 C CNN
F 3 "" H 2500 1300 50  0001 C CNN
	1    2500 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5A8C73AD
P 2500 3600
F 0 "#PWR02" H 2500 3350 50  0001 C CNN
F 1 "GND" H 2500 3450 50  0000 C CNN
F 2 "" H 2500 3600 50  0001 C CNN
F 3 "" H 2500 3600 50  0001 C CNN
	1    2500 3600
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR03
U 1 1 5A8C745B
P 3050 4400
F 0 "#PWR03" H 3050 4250 50  0001 C CNN
F 1 "VCC" H 3050 4550 50  0000 C CNN
F 2 "" H 3050 4400 50  0001 C CNN
F 3 "" H 3050 4400 50  0001 C CNN
	1    3050 4400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5A8C7490
P 3050 4900
F 0 "#PWR04" H 3050 4650 50  0001 C CNN
F 1 "GND" H 3050 4750 50  0000 C CNN
F 2 "" H 3050 4900 50  0001 C CNN
F 3 "" H 3050 4900 50  0001 C CNN
	1    3050 4900
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR05
U 1 1 5A8C74C5
P 4050 4400
F 0 "#PWR05" H 4050 4250 50  0001 C CNN
F 1 "VCC" H 4050 4550 50  0000 C CNN
F 2 "" H 4050 4400 50  0001 C CNN
F 3 "" H 4050 4400 50  0001 C CNN
	1    4050 4400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5A8C74FA
P 4050 4900
F 0 "#PWR06" H 4050 4650 50  0001 C CNN
F 1 "GND" H 4050 4750 50  0000 C CNN
F 2 "" H 4050 4900 50  0001 C CNN
F 3 "" H 4050 4900 50  0001 C CNN
	1    4050 4900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5A8C762C
P 5050 2750
F 0 "#PWR07" H 5050 2500 50  0001 C CNN
F 1 "GND" H 5050 2600 50  0000 C CNN
F 2 "" H 5050 2750 50  0001 C CNN
F 3 "" H 5050 2750 50  0001 C CNN
	1    5050 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5A8C7677
P 5050 3200
F 0 "#PWR08" H 5050 2950 50  0001 C CNN
F 1 "GND" H 5050 3050 50  0000 C CNN
F 2 "" H 5050 3200 50  0001 C CNN
F 3 "" H 5050 3200 50  0001 C CNN
	1    5050 3200
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR09
U 1 1 5A8C76BD
P 5050 3300
F 0 "#PWR09" H 5050 3150 50  0001 C CNN
F 1 "VCC" H 5050 3450 50  0000 C CNN
F 2 "" H 5050 3300 50  0001 C CNN
F 3 "" H 5050 3300 50  0001 C CNN
	1    5050 3300
	0    -1   -1   0   
$EndComp
Text Label 4400 2150 0    60   ~ 0
LCD_SS
Text Label 4400 2250 0    60   ~ 0
uSD_SS
Text Label 4100 5600 2    60   ~ 0
SPI_MOSI
Text Label 4100 5800 2    60   ~ 0
SPI_SCK
Text Label 4100 6100 2    60   ~ 0
LCD_SS
$Comp
L POT_TRIM RV1
U 1 1 5A8C7B04
P 6200 5200
F 0 "RV1" V 6025 5200 50  0000 C CNN
F 1 "POT_TRIM" V 6100 5200 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Piher_PT-10h2.5_Vertical_Px2.5mm_Py5.0mm" H 6200 5200 50  0001 C CNN
F 3 "" H 6200 5200 50  0001 C CNN
	1    6200 5200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR010
U 1 1 5A8C7CEC
P 5950 5650
F 0 "#PWR010" H 5950 5400 50  0001 C CNN
F 1 "GND" H 5950 5500 50  0000 C CNN
F 2 "" H 5950 5650 50  0001 C CNN
F 3 "" H 5950 5650 50  0001 C CNN
	1    5950 5650
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR011
U 1 1 5A8C7D24
P 5950 5750
F 0 "#PWR011" H 5950 5600 50  0001 C CNN
F 1 "VCC" H 5950 5900 50  0000 C CNN
F 2 "" H 5950 5750 50  0001 C CNN
F 3 "" H 5950 5750 50  0001 C CNN
	1    5950 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 5950 5750 5950
Wire Wire Line
	5750 5950 5750 5700
Wire Wire Line
	5750 5700 5500 5700
NoConn ~ 5500 5800
NoConn ~ 5950 6250
NoConn ~ 5950 6350
NoConn ~ 6450 5650
NoConn ~ 6450 5750
Wire Wire Line
	5500 5900 5700 5900
Wire Wire Line
	5700 5900 5700 6150
Wire Wire Line
	5700 6150 5950 6150
Text Label 5500 6000 0    60   ~ 0
LCD4
Text Label 5500 6100 0    60   ~ 0
LCD5
Text Label 5500 6200 0    60   ~ 0
LCD6
Text Label 5500 6300 0    60   ~ 0
LCD7
Text Label 6450 5850 0    60   ~ 0
LCD4
Text Label 6450 5950 0    60   ~ 0
LCD5
Text Label 6450 6050 0    60   ~ 0
LCD6
Text Label 6450 6150 0    60   ~ 0
LCD7
$Comp
L VCC #PWR012
U 1 1 5A8C82E8
P 6450 6250
F 0 "#PWR012" H 6450 6100 50  0001 C CNN
F 1 "VCC" H 6450 6400 50  0000 C CNN
F 2 "" H 6450 6250 50  0001 C CNN
F 3 "" H 6450 6250 50  0001 C CNN
	1    6450 6250
	0    1    1    0   
$EndComp
$Comp
L GND #PWR013
U 1 1 5A8C8350
P 6450 6350
F 0 "#PWR013" H 6450 6100 50  0001 C CNN
F 1 "GND" H 6450 6200 50  0000 C CNN
F 2 "" H 6450 6350 50  0001 C CNN
F 3 "" H 6450 6350 50  0001 C CNN
	1    6450 6350
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR014
U 1 1 5A8C8388
P 5950 6050
F 0 "#PWR014" H 5950 5800 50  0001 C CNN
F 1 "GND" H 5950 5900 50  0000 C CNN
F 2 "" H 5950 6050 50  0001 C CNN
F 3 "" H 5950 6050 50  0001 C CNN
	1    5950 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 5850 5950 5350
Wire Wire Line
	5950 5350 6200 5350
$Comp
L VCC #PWR015
U 1 1 5A8C83DB
P 6050 5200
F 0 "#PWR015" H 6050 5050 50  0001 C CNN
F 1 "VCC" H 6050 5350 50  0000 C CNN
F 2 "" H 6050 5200 50  0001 C CNN
F 3 "" H 6050 5200 50  0001 C CNN
	1    6050 5200
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR016
U 1 1 5A8C8413
P 6350 5200
F 0 "#PWR016" H 6350 4950 50  0001 C CNN
F 1 "GND" H 6350 5050 50  0000 C CNN
F 2 "" H 6350 5200 50  0001 C CNN
F 3 "" H 6350 5200 50  0001 C CNN
	1    6350 5200
	0    -1   -1   0   
$EndComp
NoConn ~ 5500 5600
NoConn ~ 5500 6500
$Comp
L GND #PWR017
U 1 1 5A8C856B
P 4100 6200
F 0 "#PWR017" H 4100 5950 50  0001 C CNN
F 1 "GND" H 4100 6050 50  0000 C CNN
F 2 "" H 4100 6200 50  0001 C CNN
F 3 "" H 4100 6200 50  0001 C CNN
	1    4100 6200
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR018
U 1 1 5A8C85A3
P 4100 5900
F 0 "#PWR018" H 4100 5750 50  0001 C CNN
F 1 "VCC" H 4100 6050 50  0000 C CNN
F 2 "" H 4100 5900 50  0001 C CNN
F 3 "" H 4100 5900 50  0001 C CNN
	1    4100 5900
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x07 uSD1
U 1 1 5A8C892F
P 5050 4600
F 0 "uSD1" H 5050 5000 50  0000 C CNN
F 1 "uSD" H 5050 4200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07_Pitch2.54mm" H 5050 4600 50  0001 C CNN
F 3 "" H 5050 4600 50  0001 C CNN
	1    5050 4600
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR019
U 1 1 5A8C89F0
P 4850 4300
F 0 "#PWR019" H 4850 4150 50  0001 C CNN
F 1 "VCC" H 4850 4450 50  0000 C CNN
F 2 "" H 4850 4300 50  0001 C CNN
F 3 "" H 4850 4300 50  0001 C CNN
	1    4850 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 5A8C8A2B
P 4850 4900
F 0 "#PWR020" H 4850 4650 50  0001 C CNN
F 1 "GND" H 4850 4750 50  0000 C CNN
F 2 "" H 4850 4900 50  0001 C CNN
F 3 "" H 4850 4900 50  0001 C CNN
	1    4850 4900
	1    0    0    -1  
$EndComp
NoConn ~ 4850 4800
Text Label 4850 4400 2    60   ~ 0
uSD_SS
Text Label 4850 4500 2    60   ~ 0
SPI_MOSI
Text Label 4850 4600 2    60   ~ 0
SPI_MISO
Text Label 4850 4700 2    60   ~ 0
SPI_SCK
$Comp
L GND #PWR021
U 1 1 5A8C910F
P 1100 4750
F 0 "#PWR021" H 1100 4500 50  0001 C CNN
F 1 "GND" H 1100 4600 50  0000 C CNN
F 2 "" H 1100 4750 50  0001 C CNN
F 3 "" H 1100 4750 50  0001 C CNN
	1    1100 4750
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG022
U 1 1 5A8C9185
P 1100 4750
F 0 "#FLG022" H 1100 4825 50  0001 C CNN
F 1 "PWR_FLAG" H 1100 4900 50  0000 C CNN
F 2 "" H 1100 4750 50  0001 C CNN
F 3 "" H 1100 4750 50  0001 C CNN
	1    1100 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 1900 5300 1900
Wire Wire Line
	5300 1900 5300 1800
Wire Wire Line
	5300 1800 5950 1800
Wire Wire Line
	4400 2000 5300 2000
Wire Wire Line
	5300 2000 5300 2100
Wire Wire Line
	5300 2100 5950 2100
$Comp
L GND #PWR023
U 1 1 5A8C942B
P 6150 2050
F 0 "#PWR023" H 6150 1800 50  0001 C CNN
F 1 "GND" H 6150 1900 50  0000 C CNN
F 2 "" H 6150 2050 50  0001 C CNN
F 3 "" H 6150 2050 50  0001 C CNN
	1    6150 2050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR024
U 1 1 5A8C9466
P 6150 1850
F 0 "#PWR024" H 6150 1600 50  0001 C CNN
F 1 "GND" H 6150 1700 50  0000 C CNN
F 2 "" H 6150 1850 50  0001 C CNN
F 3 "" H 6150 1850 50  0001 C CNN
	1    6150 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4400 3100 5050 3100
Wire Wire Line
	4400 2650 5050 2650
NoConn ~ 4400 2900
NoConn ~ 4400 3000
$Comp
L R R1
U 1 1 5A8C95D9
P 4550 2750
F 0 "R1" V 4630 2750 50  0000 C CNN
F 1 "10k" V 4550 2750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4480 2750 50  0001 C CNN
F 3 "" H 4550 2750 50  0001 C CNN
	1    4550 2750
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR025
U 1 1 5A8C9656
P 4700 2750
F 0 "#PWR025" H 4700 2600 50  0001 C CNN
F 1 "VCC" H 4700 2900 50  0000 C CNN
F 2 "" H 4700 2750 50  0001 C CNN
F 3 "" H 4700 2750 50  0001 C CNN
	1    4700 2750
	0    1    1    0   
$EndComp
$Comp
L Conn_01x02 J3
U 1 1 5A8C96B5
P 5800 2550
F 0 "J3" H 5800 2650 50  0000 C CNN
F 1 "S3" H 5800 2350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5800 2550 50  0001 C CNN
F 3 "" H 5800 2550 50  0001 C CNN
	1    5800 2550
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J2
U 1 1 5A8C9710
P 6350 2450
F 0 "J2" H 6350 2550 50  0000 C CNN
F 1 "S2" H 6350 2250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 6350 2450 50  0001 C CNN
F 3 "" H 6350 2450 50  0001 C CNN
	1    6350 2450
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J1
U 1 1 5A8C9759
P 6900 2350
F 0 "J1" H 6900 2450 50  0000 C CNN
F 1 "S1" H 6900 2150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 6900 2350 50  0001 C CNN
F 3 "" H 6900 2350 50  0001 C CNN
	1    6900 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 5A8C97A9
P 5600 2650
F 0 "#PWR026" H 5600 2400 50  0001 C CNN
F 1 "GND" H 5600 2500 50  0000 C CNN
F 2 "" H 5600 2650 50  0001 C CNN
F 3 "" H 5600 2650 50  0001 C CNN
	1    5600 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 5A8C97F0
P 6150 2550
F 0 "#PWR027" H 6150 2300 50  0001 C CNN
F 1 "GND" H 6150 2400 50  0000 C CNN
F 2 "" H 6150 2550 50  0001 C CNN
F 3 "" H 6150 2550 50  0001 C CNN
	1    6150 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 5A8C9837
P 6700 2450
F 0 "#PWR028" H 6700 2200 50  0001 C CNN
F 1 "GND" H 6700 2300 50  0000 C CNN
F 2 "" H 6700 2450 50  0001 C CNN
F 3 "" H 6700 2450 50  0001 C CNN
	1    6700 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2550 5600 2550
Wire Wire Line
	4400 2450 6150 2450
Wire Wire Line
	4400 2350 6700 2350
$Comp
L VCC #PWR029
U 1 1 5A8CBD31
P 2500 1600
F 0 "#PWR029" H 2500 1450 50  0001 C CNN
F 1 "VCC" H 2500 1750 50  0000 C CNN
F 2 "" H 2500 1600 50  0001 C CNN
F 3 "" H 2500 1600 50  0001 C CNN
	1    2500 1600
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR030
U 1 1 5A8CBD78
P 2500 1900
F 0 "#PWR030" H 2500 1750 50  0001 C CNN
F 1 "VCC" H 2500 2050 50  0000 C CNN
F 2 "" H 2500 1900 50  0001 C CNN
F 3 "" H 2500 1900 50  0001 C CNN
	1    2500 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 5A8CBDBF
P 1100 4650
F 0 "#PWR031" H 1100 4400 50  0001 C CNN
F 1 "GND" H 1100 4500 50  0000 C CNN
F 2 "" H 1100 4650 50  0001 C CNN
F 3 "" H 1100 4650 50  0001 C CNN
	1    1100 4650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR032
U 1 1 5A8CBE7D
P 2500 3500
F 0 "#PWR032" H 2500 3250 50  0001 C CNN
F 1 "GND" H 2500 3350 50  0000 C CNN
F 2 "" H 2500 3500 50  0001 C CNN
F 3 "" H 2500 3500 50  0001 C CNN
	1    2500 3500
	-1   0    0    1   
$EndComp
$Comp
L LED D1
U 1 1 5A8C73D3
P 950 3750
F 0 "D1" H 950 3850 50  0000 C CNN
F 1 "LED" H 950 3650 50  0000 C CNN
F 2 "LEDs:LED_0603_HandSoldering" H 950 3750 50  0001 C CNN
F 3 "" H 950 3750 50  0001 C CNN
	1    950  3750
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 5A8C743C
P 950 4200
F 0 "C3" H 975 4300 50  0000 L CNN
F 1 "CP" H 975 4100 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.00mm" H 988 4050 50  0001 C CNN
F 3 "" H 950 4200 50  0001 C CNN
	1    950  4200
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 5A8C74C1
P 950 3950
F 0 "R2" V 1030 3950 50  0000 C CNN
F 1 "R" V 950 3950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 880 3950 50  0001 C CNN
F 3 "" H 950 3950 50  0001 C CNN
	1    950  3950
	0    1    1    0   
$EndComp
Wire Wire Line
	800  3950 800  3850
Wire Wire Line
	800  3850 1100 3850
Wire Wire Line
	1100 3850 1100 3750
$Comp
L GND #PWR033
U 1 1 5A8C794F
P 1100 4200
F 0 "#PWR033" H 1100 3950 50  0001 C CNN
F 1 "GND" H 1100 4050 50  0000 C CNN
F 2 "" H 1100 4200 50  0001 C CNN
F 3 "" H 1100 4200 50  0001 C CNN
	1    1100 4200
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR034
U 1 1 5A8C799F
P 800 3750
F 0 "#PWR034" H 800 3500 50  0001 C CNN
F 1 "GND" H 800 3600 50  0000 C CNN
F 2 "" H 800 3750 50  0001 C CNN
F 3 "" H 800 3750 50  0001 C CNN
	1    800  3750
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR035
U 1 1 5A8C7AA7
P 800 4200
F 0 "#PWR035" H 800 4050 50  0001 C CNN
F 1 "VCC" H 800 4350 50  0000 C CNN
F 2 "" H 800 4200 50  0001 C CNN
F 3 "" H 800 4200 50  0001 C CNN
	1    800  4200
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR036
U 1 1 5A8C7AF7
P 1100 3950
F 0 "#PWR036" H 1100 3800 50  0001 C CNN
F 1 "VCC" H 1100 4100 50  0000 C CNN
F 2 "" H 1100 3950 50  0001 C CNN
F 3 "" H 1100 3950 50  0001 C CNN
	1    1100 3950
	0    1    1    0   
$EndComp
$Comp
L Conn_01x02 J6
U 1 1 5A8C7D54
P 1800 4550
F 0 "J6" H 1800 4650 50  0000 C CNN
F 1 "PWR_SW" H 1800 4350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1800 4550 50  0001 C CNN
F 3 "" H 1800 4550 50  0001 C CNN
	1    1800 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 4550 1600 4550
$Comp
L VCC #PWR037
U 1 1 5A8C7E1A
P 1600 4650
F 0 "#PWR037" H 1600 4500 50  0001 C CNN
F 1 "VCC" H 1600 4800 50  0000 C CNN
F 2 "" H 1600 4650 50  0001 C CNN
F 3 "" H 1600 4650 50  0001 C CNN
	1    1600 4650
	0    -1   -1   0   
$EndComp
$Comp
L PWR_FLAG #FLG038
U 1 1 5A8C7E6D
P 1100 4550
F 0 "#FLG038" H 1100 4625 50  0001 C CNN
F 1 "PWR_FLAG" H 1100 4700 50  0000 C CNN
F 2 "" H 1100 4550 50  0001 C CNN
F 3 "" H 1100 4550 50  0001 C CNN
	1    1100 4550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
