EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 5512 4331
encoding utf-8
Sheet 5 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x01_Male J4
U 1 1 604B4117
P 2650 1550
F 0 "J4" V 2712 1594 50  0000 L CNN
F 1 "RX" V 2550 1500 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 2650 1550 50  0001 C CNN
F 3 "~" H 2650 1550 50  0001 C CNN
	1    2650 1550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J5
U 1 1 604B4DB0
P 2950 1550
F 0 "J5" V 3012 1594 50  0000 L CNN
F 1 "TX" V 2850 1500 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 2950 1550 50  0001 C CNN
F 3 "~" H 2950 1550 50  0001 C CNN
	1    2950 1550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J6
U 1 1 604B4F68
P 3250 1550
F 0 "J6" V 3312 1594 50  0000 L CNN
F 1 "Vcc" V 3150 1450 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3250 1550 50  0001 C CNN
F 3 "~" H 3250 1550 50  0001 C CNN
	1    3250 1550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J7
U 1 1 604B51E5
P 3550 1550
F 0 "J7" V 3612 1594 50  0000 L CNN
F 1 "NC" V 3450 1500 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3550 1550 50  0001 C CNN
F 3 "~" H 3550 1550 50  0001 C CNN
	1    3550 1550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J8
U 1 1 604B553F
P 3850 1550
F 0 "J8" V 3912 1594 50  0000 L CNN
F 1 "GND" V 3750 1500 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3850 1550 50  0001 C CNN
F 3 "~" H 3850 1550 50  0001 C CNN
	1    3850 1550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 604B57DC
P 2350 1550
F 0 "J3" V 2412 1594 50  0000 L CNN
F 1 "NC" V 2250 1500 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 2350 1550 50  0001 C CNN
F 3 "~" H 2350 1550 50  0001 C CNN
	1    2350 1550
	0    1    1    0   
$EndComp
Text GLabel 2650 1750 3    50   Input ~ 0
RX
Text GLabel 2950 1750 3    50   Input ~ 0
TX
Text GLabel 3250 1750 3    50   Input ~ 0
Vcc
$Comp
L power:GND #PWR0114
U 1 1 604B6471
P 3850 1750
F 0 "#PWR0114" H 3850 1500 50  0001 C CNN
F 1 "GND" H 3855 1577 50  0000 C CNN
F 2 "" H 3850 1750 50  0001 C CNN
F 3 "" H 3850 1750 50  0001 C CNN
	1    3850 1750
	1    0    0    -1  
$EndComp
NoConn ~ 2350 1750
NoConn ~ 3550 1750
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 6053A58C
P 1000 1000
F 0 "J2" H 1108 1181 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1108 1090 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1000 1000 50  0001 C CNN
F 3 "~" H 1000 1000 50  0001 C CNN
	1    1000 1000
	1    0    0    -1  
$EndComp
Text GLabel 1200 1000 2    50   Input ~ 0
GPIO00
$Comp
L power:GND #PWR0115
U 1 1 6053AFF9
P 1200 1100
F 0 "#PWR0115" H 1200 850 50  0001 C CNN
F 1 "GND" H 1205 927 50  0000 C CNN
F 2 "" H 1200 1100 50  0001 C CNN
F 3 "" H 1200 1100 50  0001 C CNN
	1    1200 1100
	1    0    0    -1  
$EndComp
Text Notes 800  750  0    50   ~ 0
Short to program
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 60465C33
P 1000 2000
F 0 "J9" H 1108 2181 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1108 2090 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1000 2000 50  0001 C CNN
F 3 "~" H 1000 2000 50  0001 C CNN
	1    1000 2000
	1    0    0    -1  
$EndComp
Text GLabel 1200 2000 2    50   Input ~ 0
EN
Text GLabel 1200 2100 2    50   Input ~ 0
Vcc
Text Notes 800  1750 0    50   ~ 0
Short to program
$EndSCHEMATC
