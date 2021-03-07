EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 5512 4331
encoding utf-8
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1400 900  0    50   Input ~ 0
GPIO05
$Comp
L Device:R R7
U 1 1 604CCEB8
P 1650 900
F 0 "R7" V 1443 900 50  0000 C CNN
F 1 "220" V 1534 900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1580 900 50  0001 C CNN
F 3 "~" H 1650 900 50  0001 C CNN
	1    1650 900 
	0    1    1    0   
$EndComp
$Comp
L Device:LED D2
U 1 1 604CD3A3
P 1950 1100
F 0 "D2" V 1989 982 50  0000 R CNN
F 1 "LED" V 1898 982 50  0000 R CNN
F 2 "Diode_SMD:D_1206_3216Metric" H 1950 1100 50  0001 C CNN
F 3 "~" H 1950 1100 50  0001 C CNN
	1    1950 1100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1400 900  1500 900 
Wire Wire Line
	1800 900  1950 900 
Wire Wire Line
	1950 900  1950 950 
$Comp
L power:GND #PWR0116
U 1 1 604CDD45
P 1950 1250
F 0 "#PWR0116" H 1950 1000 50  0001 C CNN
F 1 "GND" H 1955 1077 50  0000 C CNN
F 2 "" H 1950 1250 50  0001 C CNN
F 3 "" H 1950 1250 50  0001 C CNN
	1    1950 1250
	1    0    0    -1  
$EndComp
Text GLabel 1350 1700 0    50   Input ~ 0
GPIO15
$Comp
L Device:R R8
U 1 1 604CE252
P 1650 1700
F 0 "R8" V 1443 1700 50  0000 C CNN
F 1 "220" V 1534 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1580 1700 50  0001 C CNN
F 3 "~" H 1650 1700 50  0001 C CNN
	1    1650 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 1700 1500 1700
$Comp
L Device:LED D3
U 1 1 604CE6D4
P 1950 2000
F 0 "D3" V 1989 1882 50  0000 R CNN
F 1 "LED" V 1898 1882 50  0000 R CNN
F 2 "Diode_SMD:D_1206_3216Metric" H 1950 2000 50  0001 C CNN
F 3 "~" H 1950 2000 50  0001 C CNN
	1    1950 2000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 1700 1950 1700
Wire Wire Line
	1950 1700 1950 1850
$Comp
L power:GND #PWR0117
U 1 1 604CF024
P 1950 2150
F 0 "#PWR0117" H 1950 1900 50  0001 C CNN
F 1 "GND" H 1955 1977 50  0000 C CNN
F 2 "" H 1950 2150 50  0001 C CNN
F 3 "" H 1950 2150 50  0001 C CNN
	1    1950 2150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
