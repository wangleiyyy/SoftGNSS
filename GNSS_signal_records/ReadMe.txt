This directory contains two data sets for use with the GNSS Software Defined Receiver (SDR).  

The primary data set is named 
"GPSdata-DiscreteComponents-fs38_192-if9_55.bin" and it is has been 
collected at the University of Colorado, Boulder, CO, USA. This was 
collected using the discrete component front end design described in the 
textbook and is the primary reference set. The parameters necessary for 
processing this data are as follows: 

 - Sampling Frequency: 38.192 MHz
 - Intermediate Frequency: 9.55 MHz (nominal)
 - signed character (8 bit) sample format

 
A second data second has also been included. This data set is unique as 
contains the usual GPS data but was taken when then experimental GALILEO 
GIOVE-A satellite was also visible and transmitting on the 1575.42 MHz 
frequency (so has data from various GPS satellites as well as the 
GIOVE-A satellite). This data set was collected using the NordNav R30 
sampling receiver in Turin, Italy and is courtesy of Marco Pini and 
Politecnico di Torino. It is named 
"GPS_and_GIOVE_A-NN-fs16_3676-if4_1304.bin". The parameters necessary 
for processing this data are as follows: 

 - Sampling Frequency: 16.3676 MHz
 - Intermediate Frequency: 4.1304 MHz (nominal)
 - signed character (8 bit) sample format
