EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
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
L ESP_8366_CUSTOM:ESP-12E U?
U 1 1 60363FD8
P 2100 1500
F 0 "U?" H 2100 2265 50  0000 C CNN
F 1 "ESP-12E" H 2100 2174 50  0000 C CNN
F 2 "" H 2100 1500 50  0001 C CNN
F 3 "http://l0l.org.uk/2014/12/esp8266-modules-hardware-guide-gotta-catch-em-all/" H 2100 1500 50  0001 C CNN
	1    2100 1500
	1    0    0    -1  
$EndComp
Wire Notes Line
	500  500  500  3300
Text Notes 700  700  0    50   ~ 0
ESP8266
Wire Wire Line
	1200 1200 850  1200
Wire Wire Line
	1200 1400 850  1400
Wire Wire Line
	1200 1500 850  1500
Wire Wire Line
	850  1600 1200 1600
Wire Wire Line
	1200 1700 850  1700
Wire Wire Line
	1200 1800 850  1800
Wire Wire Line
	850  1900 1200 1900
Wire Wire Line
	1950 2400 1950 2800
Wire Wire Line
	2050 2400 2050 2800
Wire Wire Line
	2150 2400 2150 2800
Wire Wire Line
	2250 2400 2250 2800
Wire Wire Line
	2350 2400 2350 2800
Wire Wire Line
	3000 1200 3300 1200
Wire Wire Line
	3000 1300 3300 1300
Wire Wire Line
	3000 1400 3300 1400
Wire Wire Line
	3000 1500 3300 1500
Wire Wire Line
	3000 1600 3300 1600
Wire Wire Line
	3000 1700 3300 1700
Wire Wire Line
	3000 1800 3300 1800
Wire Wire Line
	3000 1900 3300 1900
Text GLabel 3300 1900 2    50   Input ~ 0
GND
Text GLabel 850  1200 0    50   Input ~ 0
RST
Text GLabel 850  1400 0    50   Input ~ 0
EN
Text GLabel 850  1500 0    50   Input ~ 0
GPIO16
$Comp
L Device:C C?
U 1 1 6036934F
P 3400 2800
F 0 "C?" H 3515 2846 50  0000 L CNN
F 1 "100uF" H 3515 2755 50  0000 L CNN
F 2 "" H 3438 2650 50  0001 C CNN
F 3 "~" H 3400 2800 50  0001 C CNN
	1    3400 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6036B509
P 3400 2950
F 0 "#PWR?" H 3400 2700 50  0001 C CNN
F 1 "GND" H 3405 2777 50  0000 C CNN
F 2 "" H 3400 2950 50  0001 C CNN
F 3 "" H 3400 2950 50  0001 C CNN
	1    3400 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 6036A9FE
P 3400 2650
F 0 "#PWR?" H 3400 2500 50  0001 C CNN
F 1 "+3.3V" H 3415 2823 50  0000 C CNN
F 2 "" H 3400 2650 50  0001 C CNN
F 3 "" H 3400 2650 50  0001 C CNN
	1    3400 2650
	1    0    0    -1  
$EndComp
Text GLabel 1350 3050 1    50   Input ~ 0
GND
$Comp
L power:GND #PWR?
U 1 1 604534AE
P 1350 3050
F 0 "#PWR?" H 1350 2800 50  0001 C CNN
F 1 "GND" H 1355 2877 50  0000 C CNN
F 2 "" H 1350 3050 50  0001 C CNN
F 3 "" H 1350 3050 50  0001 C CNN
	1    1350 3050
	1    0    0    -1  
$EndComp
Text GLabel 1000 3000 3    50   Input ~ 0
Vcc
$Comp
L power:+3.3V #PWR?
U 1 1 6036748F
P 1000 3000
F 0 "#PWR?" H 1000 2850 50  0001 C CNN
F 1 "+3.3V" H 1015 3173 50  0000 C CNN
F 2 "" H 1000 3000 50  0001 C CNN
F 3 "" H 1000 3000 50  0001 C CNN
	1    1000 3000
	1    0    0    -1  
$EndComp
Text GLabel 850  1600 0    50   Input ~ 0
GPIO14
Text GLabel 850  1700 0    50   Input ~ 0
GPIO12
Text GLabel 850  1800 0    50   Input ~ 0
GPIO13
Text GLabel 850  1900 0    50   Input ~ 0
Vcc
Text GLabel 1950 2800 3    50   Input ~ 0
MISO
Text GLabel 2250 2800 3    50   Input ~ 0
MOSI
Text GLabel 2050 2800 3    50   Input ~ 0
GPIO09
Text GLabel 2150 2800 3    50   Input ~ 0
GPIO10
Text GLabel 2350 2800 3    50   Input ~ 0
SCL
Text GLabel 3300 1800 2    50   Input ~ 0
GPIO15
Text GLabel 3300 1700 2    50   Input ~ 0
GPIO02
Text GLabel 3300 1600 2    50   Input ~ 0
GPIO00
Text GLabel 3300 1500 2    50   Input ~ 0
GPIO04
Text GLabel 3300 1400 2    50   Input ~ 0
GPIO05
Text GLabel 3300 1300 2    50   Input ~ 0
RXD
Text GLabel 3300 1200 2    50   Input ~ 0
TXD
$Sheet
S 1850 3600 950  850 
U 60485B0B
F0 "Sheet60485B0A" 50
F1 "RFID.sch" 50
$EndSheet
Text Notes 1650 3450 0    50   ~ 0
RFID
Text Notes 950  3450 0    50   ~ 0
Power supply
$Comp
L power:+12V #PWR?
U 1 1 604956A7
P 700 3000
F 0 "#PWR?" H 700 2850 50  0001 C CNN
F 1 "+12V" H 715 3173 50  0000 C CNN
F 2 "" H 700 3000 50  0001 C CNN
F 3 "" H 700 3000 50  0001 C CNN
	1    700  3000
	1    0    0    -1  
$EndComp
Text GLabel 700  3000 3    50   Input ~ 0
Vin
Wire Notes Line
	500  3350 1500 3350
Wire Notes Line
	1550 3350 2950 3350
Wire Notes Line
	2950 3350 2950 4550
Wire Notes Line
	2950 4550 1550 4550
Wire Notes Line
	1550 4550 1550 3350
$Comp
L Device:R R?
U 1 1 604A5EDF
P 4650 1000
F 0 "R?" V 4750 1000 50  0000 C CNN
F 1 "12k" V 4534 1000 50  0000 C CNN
F 2 "" V 4580 1000 50  0001 C CNN
F 3 "~" H 4650 1000 50  0001 C CNN
	1    4650 1000
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 604A70AC
P 4650 1350
F 0 "R?" V 4750 1350 50  0000 C CNN
F 1 "12k" V 4534 1350 50  0000 C CNN
F 2 "" V 4580 1350 50  0001 C CNN
F 3 "~" H 4650 1350 50  0001 C CNN
	1    4650 1350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 604A9907
P 4650 1750
F 0 "R?" V 4750 1750 50  0000 C CNN
F 1 "12k" V 4534 1750 50  0000 C CNN
F 2 "" V 4580 1750 50  0001 C CNN
F 3 "~" H 4650 1750 50  0001 C CNN
	1    4650 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 604A9FC3
P 4650 2150
F 0 "R?" V 4750 2150 50  0000 C CNN
F 1 "12k" V 4534 2150 50  0000 C CNN
F 2 "" V 4580 2150 50  0001 C CNN
F 3 "~" H 4650 2150 50  0001 C CNN
	1    4650 2150
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 604AAA90
P 4650 2850
F 0 "R?" V 4750 2850 50  0000 C CNN
F 1 "12k" V 4534 2850 50  0000 C CNN
F 2 "" V 4580 2850 50  0001 C CNN
F 3 "~" H 4650 2850 50  0001 C CNN
	1    4650 2850
	0    1    1    0   
$EndComp
Text GLabel 5550 1000 2    50   Input ~ 0
Vcc
Wire Wire Line
	4800 1000 5500 1000
Connection ~ 5500 1000
Wire Wire Line
	5500 1000 5550 1000
Wire Wire Line
	4800 1350 5500 1350
Connection ~ 5500 1350
Wire Wire Line
	5500 1350 5500 1000
Wire Wire Line
	4800 1750 5500 1750
Connection ~ 5500 1750
Wire Wire Line
	5500 1750 5500 1350
Wire Wire Line
	4800 2150 5500 2150
Wire Wire Line
	5500 2150 5500 1750
Text GLabel 4500 1000 0    50   Input ~ 0
GPIO00
Text GLabel 4500 1350 0    50   Input ~ 0
GPIO02
Text GLabel 4500 1750 0    50   Input ~ 0
EN
Text GLabel 4000 2150 0    50   Input ~ 0
RST
Wire Wire Line
	4000 2150 4100 2150
$Comp
L Device:C C?
U 1 1 604B8FCF
P 4100 2300
F 0 "C?" H 4215 2346 50  0000 L CNN
F 1 "100nF" H 4215 2255 50  0000 L CNN
F 2 "" H 4138 2150 50  0001 C CNN
F 3 "~" H 4100 2300 50  0001 C CNN
	1    4100 2300
	1    0    0    -1  
$EndComp
Connection ~ 4100 2150
Wire Wire Line
	4100 2150 4500 2150
$Comp
L power:GND #PWR?
U 1 1 604BC712
P 4100 2450
F 0 "#PWR?" H 4100 2200 50  0001 C CNN
F 1 "GND" H 4105 2277 50  0000 C CNN
F 2 "" H 4100 2450 50  0001 C CNN
F 3 "" H 4100 2450 50  0001 C CNN
	1    4100 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604BD57B
P 5500 2900
F 0 "#PWR?" H 5500 2650 50  0001 C CNN
F 1 "GND" H 5505 2727 50  0000 C CNN
F 2 "" H 5500 2900 50  0001 C CNN
F 3 "" H 5500 2900 50  0001 C CNN
	1    5500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2850 5500 2850
Wire Wire Line
	5500 2850 5500 2900
Text GLabel 4500 2850 0    50   Input ~ 0
GPIO15
Wire Notes Line
	5800 3300 5800 500 
Wire Notes Line
	500  3300 5800 3300
Wire Notes Line
	500  500  5800 500 
NoConn ~ 1850 2400
$Sheet
S 3300 3750 1100 950 
U 604CEF8B
F0 "Sheet604CEF8A" 50
F1 "Regulator.sch" 50
$EndSheet
Wire Notes Line
	4500 3350 3000 3350
Wire Notes Line
	3000 4800 4500 4800
Wire Notes Line
	4500 3350 4500 4800
Wire Notes Line
	3000 3350 3000 4800
Text Notes 3100 3450 0    50   ~ 0
Regulator
Text Notes 7450 7500 0    50   ~ 0
ACCESS CONTROL
Text Notes 10650 7650 0    50   ~ 0
1.0
NoConn ~ 1200 1300
$Sheet
S 4650 3700 1100 1000
U 60455E3F
F0 "Relay_Output" 50
F1 "Relay_output.sch" 50
$EndSheet
Wire Notes Line
	4550 4800 4550 3350
Wire Notes Line
	4550 3350 5800 3350
Wire Notes Line
	5800 3350 5800 4800
Wire Notes Line
	5800 4800 4550 4800
Text Notes 4600 3450 0    50   ~ 0
Relay
$Comp
L Terminal:Bornera2 U?
U 1 1 6045A657
P 950 3850
F 0 "U?" H 800 4300 50  0000 L CNN
F 1 "Bornera2" H 800 4200 50  0000 L CNN
F 2 "" H 950 4200 50  0001 C CNN
F 3 "" H 950 4200 50  0001 C CNN
	1    950  3850
	1    0    0    -1  
$EndComp
Text GLabel 700  3700 0    50   Input ~ 0
Vin
$Comp
L power:GND #PWR?
U 1 1 6045B47C
P 600 4050
F 0 "#PWR?" H 600 3800 50  0001 C CNN
F 1 "GND" H 605 3877 50  0000 C CNN
F 2 "" H 600 4050 50  0001 C CNN
F 3 "" H 600 4050 50  0001 C CNN
	1    600  4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	600  3950 600  4050
Wire Wire Line
	600  3950 700  3950
Wire Notes Line
	500  4300 1500 4300
Wire Notes Line
	1500 3350 1500 4300
Wire Notes Line
	500  3350 500  4300
$Comp
L Terminal:Bornera2 U?
U 1 1 60497C27
P 1250 5050
F 0 "U?" H 1100 5500 50  0000 L CNN
F 1 "Bornera2" H 1100 5400 50  0000 L CNN
F 2 "" H 1250 5400 50  0001 C CNN
F 3 "" H 1250 5400 50  0001 C CNN
	1    1250 5050
	1    0    0    -1  
$EndComp
Wire Notes Line
	500  4350 1500 4350
Wire Notes Line
	1500 4350 1500 5500
Wire Notes Line
	1500 5500 500  5500
Wire Notes Line
	500  5500 500  4350
Text Notes 550  4450 0    50   ~ 0
Output
Text GLabel 1000 4900 0    50   Input ~ 0
Rel_1_out
$Comp
L power:GND #PWR?
U 1 1 6049AE53
P 950 5200
F 0 "#PWR?" H 950 4950 50  0001 C CNN
F 1 "GND" H 955 5027 50  0000 C CNN
F 2 "" H 950 5200 50  0001 C CNN
F 3 "" H 950 5200 50  0001 C CNN
	1    950  5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5150 950  5150
Wire Wire Line
	950  5150 950  5200
$Sheet
S 2000 4800 850  700 
U 604AE6F7
F0 "FTDI_Conn" 50
F1 "FTDI_Conn.sch" 50
$EndSheet
Wire Notes Line
	1550 5650 1550 4600
Wire Notes Line
	1550 4600 2950 4600
Wire Notes Line
	2950 4600 2950 5650
Wire Notes Line
	2950 5650 1550 5650
Text Notes 1600 4700 0    50   ~ 0
FTDI
$Sheet
S 3400 5050 950  800 
U 604BEA43
F0 "LedIndicator" 50
F1 "LedIndicator.sch" 50
$EndSheet
Wire Notes Line
	3000 4850 3000 6000
Wire Notes Line
	3000 6000 4500 6000
Wire Notes Line
	4500 6000 4500 4850
Wire Notes Line
	4500 4850 3000 4850
Text Notes 3050 4950 0    50   ~ 0
Led indicators
$EndSCHEMATC
