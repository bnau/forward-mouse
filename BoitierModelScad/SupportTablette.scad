DIAMETRE_G = 13;
DIAMETRE_D = 16;
LONG_TUBE_G = 130;
LONG_TUBE_D = 120; // droit pour Bertrand
ECART_TUBES = 160;

LONG_SUPPORT = 220; // y
LARG_SUPPORT = 10; // x
PROF_SUPPORT = 10; // z
ECART_SUPPORT = 190;

LONG_HOR = 10; // y
LARG_HOR = 260; // x
PROF_HOR = PROF_SUPPORT; // z

HAUT_HOR_B = 60; // hauteur de la barre du bas.
HAUT_HOR_H = 180; // hauteur de la barre du bas.

union(){
    // cylindres
//    translate([DIAMETRE_G/2,0,0])
//        rotate([90,0,0])
//            cylinder(d=DIAMETRE_G, h=LONG_TUBE_G, $fn=100);
//    
//    translate([ECART_TUBES+DIAMETRE_G/2,0,0])
//        rotate([90,0,0])
//            cylinder(d=DIAMETRE_D, h=LONG_TUBE_D, $fn=100);
    
    // barres verticales
    translate([0,0,0])
        rotate([60,0,0])
            cube([LARG_SUPPORT,LONG_SUPPORT,PROF_SUPPORT]);
    
    translate([ECART_SUPPORT,0,0])
        rotate([60,0,0])
            cube([LARG_SUPPORT,LONG_SUPPORT,PROF_SUPPORT]);
    
    // barres horizontales
    rotate([60,0,0])
        translate([(ECART_SUPPORT+LARG_SUPPORT-LARG_HOR)/2,HAUT_HOR_B,0])
            cube([LARG_HOR,LONG_HOR,PROF_HOR]);
            
    rotate([60,0,0])
        translate([(ECART_SUPPORT+LARG_SUPPORT-LARG_HOR)/2,HAUT_HOR_H,0])
            cube([LARG_HOR,LONG_HOR,PROF_HOR]);
    
   
}

