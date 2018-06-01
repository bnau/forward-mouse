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
LARG_HOR = 265; // x
PROF_HOR = PROF_SUPPORT; // z

HAUT_HOR_B = 60; // hauteur de la barre du bas.
HAUT_HOR_H = 180; // hauteur de la barre du bas.

use <nuts_and_bolts_v1.95.scad>

module rondVissable(){
        cylinder(h=LARG_SUPPORT, r=10);
    }
module vis(){
    rotate([0,90,0])
        hex_bolt (40, 20, 5, 5, 0.01, 32, 1, "metric", 28);
    }

module barreVerticale(){
    rotate([60,0,0])
        //difference(){
            // barre avec bout rond
            union(){
                    cube([LARG_SUPPORT,LONG_SUPPORT,PROF_SUPPORT]);
                    rotate([0,90,0])
                        rondVissable();
            };  
           // trou de la vis
           //vis();
    //}  
}
/*
translate([-100,0,0])
    vis();*/
    /*translate ([-10, 0, 0]) 
        hex_nut (1/8, 1/4, 3/8, 1/128, 32, 1, "imperial", 28);*/
//hex_bolt (3/8, 2/8, 1/8, 3/8, 1/128, 32, 1, "imperial", 28);


module support() {
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
            barreVerticale();
        
        translate([ECART_SUPPORT,0,0])
            barreVerticale();
        
        // barres horizontales
        
        // barre du bas avec gouttière
        rotate([60,0,0])
            translate([(ECART_SUPPORT+LARG_SUPPORT-LARG_HOR)/2,HAUT_HOR_B,0])
                difference(){
                    cube([LARG_HOR,LONG_HOR,PROF_HOR+15]);
                    translate([2,2,PROF_SUPPORT]){
                        cube([LARG_HOR-4,LONG_HOR-2,PROF_HOR+10-PROF_SUPPORT]);
                    }
                };
        
        // barre du haut avec crochets  
        rotate([60,0,0])
            translate([(ECART_SUPPORT+LARG_SUPPORT-LARG_HOR)/2,HAUT_HOR_H,0])
                difference(){
                cube([LARG_HOR+4,LONG_HOR,PROF_HOR+12]);
                union(){
                    translate([2,-1,PROF_SUPPORT]){
                        cube([LARG_HOR,LONG_HOR+5,10]);
                    }
                    translate([5,-1,PROF_SUPPORT]){
                        cube([LARG_HOR+4-10,LONG_HOR+5,100]);
                }
           
                }
         }
        
        /*rotate([60,0,0])
            translate([LARG_SUPPORT+2,HAUT_HOR_B,0])
                cube([LARG_SUPPORT,LONG_SUPPORT,PROF_SUPPORT]);*/
    }
}
support();