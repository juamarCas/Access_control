EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 7874 4016
encoding utf-8
Sheet 3 6
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
L Regulator_Linear:AMS1117-3.3 U?
U 1 1 604D73D7
P 3350 1050
F 0 "U?" H 3350 1292 50  0000 C CNN
F 1 "AMS1117-3.3" H 3350 1201 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3350 1250 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 3450 800 50  0001 C CNN
	1    3350 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604D894F
P 3350 1350
F 0 "#PWR?" H 3350 1100 50  0001 C CNN
F 1 "GND" H 3355 1177 50  0000 C CNN
F 2 "" H 3350 1350 50  0001 C CNN
F 3 "" H 3350 1350 50  0001 C CNN
	1    3350 1350
	1    0    0    -1  
$EndComp
Text GLabel 2850 1050 0    50   Input ~ 0
Vin
Wire Wire Line
	2850 1050 2950 1050
Text GLabel 3950 1050 2    50   Input ~ 0
Vcc
Wire Wire Line
	3650 1050 3800 1050
$Comp
L Device:C C?
U 1 1 604D98E4
P 2950 1450
F 0 "C?" H 3065 1496 50  0000 L CNN
F 1 "10uF" H 3065 1405 50  0000 L CNN
F 2 "" H 2988 1300 50  0001 C CNN
F 3 "~" H 2950 1450 50  0001 C CNN
	1    2950 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 604D9F4A
P 3800 1450
F 0 "C?" H 3915 1496 50  0000 L CNN
F 1 "10uF" H 3915 1405 50  0000 L CNN
F 2 "" H 3838 1300 50  0001 C CNN
F 3 "~" H 3800 1450 50  0001 C CNN
	1    3800 1450
	1    0    0    -1  
$EndComp
Connection ~ 2950 1050
Wire Wire Line
	2950 1050 3050 1050
Wire Wire Line
	3800 1300 3800 1050
Connection ~ 3800 1050
Wire Wire Line
	3800 1050 3950 1050
Wire Wire Line
	2950 1050 2950 1300
$Comp
L power:GND #PWR?
U 1 1 604DAF37
P 2950 1700
F 0 "#PWR?" H 2950 1450 50  0001 C CNN
F 1 "GND" H 2955 1527 50  0000 C CNN
F 2 "" H 2950 1700 50  0001 C CNN
F 3 "" H 2950 1700 50  0001 C CNN
	1    2950 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604DB2C5
P 3800 1700
F 0 "#PWR?" H 3800 1450 50  0001 C CNN
F 1 "GND" H 3805 1527 50  0000 C CNN
F 2 "" H 3800 1700 50  0001 C CNN
F 3 "" H 3800 1700 50  0001 C CNN
	1    3800 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1600 2950 1700
Wire Wire Line
	3800 1600 3800 1700
$EndSCHEMATC
