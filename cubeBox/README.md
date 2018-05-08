# KETCube box modification and rendering

[OpenSCAD](http://www.openscad.org/) has been used to create KETCube box.

4 variants of KETCube box can be rendered from the box.scad source file 
(uncomment a single line in the "Main geometry" section:
* KETCube box with the hole for the permanent magnet (magnetic holder)
  * plus the lid with the logo of UWB (boxUWBLogo())
  * plus the lid withouth the logo of UWB (boxBasic())
* KETCube box with the screw-holder
  * plus the lid with the logo of UWB (boxUWBLogo_holder())
  * plus the lid withouth the logo of UWB (boxBasic_holder())

## 3D Printer Settings  

Note that when printing the KETCube box on a 3D printer, 
the lid must be printed precisely to fit the box. Modify the 
"$cover_small" variable according to your printer accuracy 
(you have to test):
according to our experience with several low-cost printers, 
0.5 to 1.5 is the right range

## Optional Magnetic Holder
The box is ready to use with a magnetic holder. 
Permanent magnet of size 20x20x3 mm is recomended.

Tested permanent magnets:
* (https://www.unimagnet.cz/597-kv-20-20-03-n50-neodymovy-magnet.html)[https://www.unimagnet.cz/597-kv-20-20-03-n50-neodymovy-magnet.html)
