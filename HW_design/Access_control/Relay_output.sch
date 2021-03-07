EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 5512 4331
encoding utf-8
Sheet 4 6
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
L Relay_5_pin:JQC-3FF RELAY1
U 1 1 6046C01D
P 3100 1250
F 0 "RELAY1" H 3528 1296 50  0000 L CNN
F 1 "JQC-3FF" H 3528 1205 50  0000 L CNN
F 2 "Relay_5pin:Relay" H 3700 1200 50  0001 C CNN
F 3 "" H 3700 1200 50  0001 C CNN
	1    3100 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_ALT D1
U 1 1 6046DDCE
P 2550 1250
F 0 "D1" V 2450 1050 50  0000 L CNN
F 1 "D_Schottky_ALT" V 2650 550 50  0000 L CNN
F 2 "SMD_DIODE_3.20mmx8.13mm:SMD_DIODE_3.2mmx8.13mm" H 2550 1250 50  0001 C CNN
F 3 "~" H 2550 1250 50  0001 C CNN
	1    2550 1250
	0    1    1    0   
$EndComp
Text GLabel 2850 750  1    50   Input ~ 0
Vin
Wire Wire Line
	2850 750  2850 850 
Wire Wire Line
	2550 1100 2550 850 
Wire Wire Line
	2550 850  2850 850 
Connection ~ 2850 850 
Wire Wire Line
	2850 850  2850 900 
Wire Wire Line
	2850 1600 2850 1650
Wire Wire Line
	2550 1400 2550 1650
Wire Wire Line
	2550 1650 2850 1650
Connection ~ 2850 1650
Wire Wire Line
	2850 1650 2850 1850
$Comp
L power:GND #PWR0113
U 1 1 60472962
P 2850 2350
F 0 "#PWR0113" H 2850 2100 50  0001 C CNN
F 1 "GND" H 2855 2177 50  0000 C CNN
F 2 "" H 2850 2350 50  0001 C CNN
F 3 "" H 2850 2350 50  0001 C CNN
	1    2850 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2250 2850 2350
$Comp
L Device:R R6
U 1 1 604735CF
P 2250 2050
F 0 "R6" V 2043 2050 50  0000 C CNN
F 1 "2.2k" V 2134 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2180 2050 50  0001 C CNN
F 3 "~" H 2250 2050 50  0001 C CNN
	1    2250 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 2050 2550 2050
Text GLabel 3150 1600 3    50   Input ~ 0
Vin
Text GLabel 1950 2050 0    50   Input ~ 0
GPIO16
Wire Wire Line
	1950 2050 2100 2050
Wire Wire Line
	3400 1600 3700 1600
Text GLabel 3700 1600 2    50   Input ~ 0
Rel_1_out
$Comp
L Transistor_BJT:MMBT3904 Q1
U 1 1 604C5FC3
P 2750 2050
F 0 "Q1" H 2941 2096 50  0000 L CNN
F 1 "MMBT3904" H 2941 2005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2950 1975 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 2750 2050 50  0001 L CNN
	1    2750 2050
	1    0    0    -1  
$EndComp
NoConn ~ 3300 900 
$EndSCHEMATC
