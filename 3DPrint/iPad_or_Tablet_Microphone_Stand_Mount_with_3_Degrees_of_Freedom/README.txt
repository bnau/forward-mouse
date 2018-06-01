                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


http://www.thingiverse.com/thing:736296
iPad or Tablet Microphone Stand Mount with 3 Degrees of Freedom by sludtke42 is licensed under the Attribution - Non-Commercial - Share Alike license.
http://creativecommons.org/licenses/by-nc-sa/3.0/

# Summary

Note the remix link, which links to an improved design for a few of the pieces.

Assemble these 5 pieces to produce an iPad or other tablet mount for a microphone stand with arm. It will allow you to tilt, rotate and spin (portrait/landscape) the iPad. With simple modifications to one of the 5 pieces could easily accommodate pretty much any tablet/phone. I take no responsibility if your prints are insufficiently solid and drop the tablet on the floor! (see instructions for tips)  

You will obviously need a printer with a sufficiently large print bed for the holder_main part. The OpenSCAD file for holder_main is parametric, so you can adjust for the dimensions of your tablet. 

# Instructions

DISCLAIMER - While I haven't had any problems so far, if a piece breaks and drops your iPad onto the floor, I take no responsibility. I use mine over a nice soft chair or a bed, so if it falls, no harm done. For this project to work well, you need to print the parts in the correct orientation for optimal part strength, and have your printer settings well tuned.  

Instructions:  
I had purchased an iPad stand from Amazon so I could play games and read in bed without neck strain. It used a microphone stand with an extension arm, with the iPad at the end. While great, unfortunately it only permitted the iPad to be in landscape orientation. Fine for movies, but not so great with apps that work only in portrait.  

Note that the main part that holds the iPad is iPad sized, so you will need a printer with a large print bed to do it as-provided. I have now provided a parametric .scad file for this part. You can simply adjust the tablet width,height and thickness and regenerate (F6) with OpenSCAD.   

This project includes 5 pieces. When connected in sequence, they produce a mount which can rotate with respect to the support bar ~45 degrees, can tilt up and down (with fixed increments), and can spin freely from landscape to portrait mode. In addition to the 5 printed pieces, you will need a couple of M4 (or similar sized) screws, preferably with a wing nut for one of them, another larger screw to hold the unit fixed on the microphone stand arm, and a few appropriately sized rubber grommets.   

While I do have a 2-head printer, it should be possible to print all of these parts with external support only (one possible exception), and they should clean up pretty easily. I printed with PLA, to avoid warping issues, but you may get better strength from ABS. It is critical that the parts be printed in an orientation to provide maximal strength in the correct direction, or there may be a risk of parts failing unpredictably. Suggest using a high fill-factor when printing for added strength. This project puts the parts under expansion stress, not compression stress, and if printed with a bad layer orientation, layer delamination can be a real risk!   

All of the parts were designed in OpenSCAD in cm units, so if your printer uses mm, you'll need a scale factor of 10 when printing. OpenSCAD files are included in case you want to modify things.  

ipad_holder_mount - Slides onto the microphone stand bar, and sandwiches with the next part. MUST BE PRINTED SO THE MAIN CYLINDER IS VERTICAL ON THE PRINT BED. Need to have a thumb-screw or a wing-screw to keep it in fixed position on the microphone stand arm, and you'll need to drill an appropriate hole for that (or modify my SCAD file to include one). An M6 screw works well.  

ipad_holder_rotator - There is only one good orientation for printing this without much internal support! THE DISK WITH LUMPS SHOULD BE VERTICAL, AND THE SCREW HOLE THROUGH THE SANDWICH SHOULD BE HORIZONTAL. If you print with the screw holes vertical, there is a severe risk of the layers delaminating and the part breaking under strain!  Sandwiches with the previous part. There is a hole through the middle of the sandwiched parts, with a cutout in the holder_mount for inserting an M4 screw, which can then be screwed through all 4 layers so it can rotate freely. You may need to do a little sanding on the sandwiching surfaces so they are smooth and rotate freely without binding.   

ipad_holder_adaptor - Do NOT print this part with the cylinder vertical on the bed, or it may break. Instead, PRINT WITH THE CYLINDER HORIZONTAL AND THE DISK WITH SMALL DEPRESSIONS VERTICAL. The disk with depressions fits on top of the corresponding lumpy disk on the previous part. An M4 screw with wing-nut can be used to hold the disks together. Loosening the wing-nut is how you tilt the iPad up and down.  

ipad_holder_spindle - This part can be printed in its obvious orientation, with the base flat on the bed. I used ABS for this one part for somewhat better layer strength. This part inserts through holder_main into holder_adaptor. I used a large rubber grommet between holder_main and holder_adaptor to provide some friction in the landscape/portrait rotation. The holder_spindle must be attached to the holder_adaptor. I did this by drilling a very small hole through the two parts when they were in the desired position (with a little pressure on the grommet, but not too much) and used a paper-clip through the hole to hold the pieces together as a sort of cotter-pin.  

ipad_holder_main_param - This is the part that the iPad sits in. You may consider printing this part in ABS for strength as well, though you may have issues with warping given its geometry. This piece brackets the iPad on 5 sides, but doesn't have anything on it to hold the iPad in place. I used 5 grommets screwed into the 5 support arms so the iPad pops in and out easily. You may also consider putting some electrical or other tape on the support arms if you're worried about scratching the case. If the holder_spindle is properly tensioned, then it should not rub on the surface of the tablet when you change orientation.