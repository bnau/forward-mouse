MARGIN = 1; // marge de sécurité sur les mesures pour les trous
HAUTEUR = 50; // hauteur du boîtier (intérieur): z
HAUTEUR_BAS = 3; // compenser en bas (z) (soudures en dessous de l'Arduino)
LARGEUR = 70; // largeur du boîtier (intérieur): y
LARGEUR_D = 4; // de combien la plaque dépasse à droite: y
LARGEUR_G = 14; // de combien la plaque dépasse à gauche: y
LONGUEUR = 82-5; // Longueur du boîtier (intérieur): x - 5mm pour la prise USB qui dépasse
EPAISSEUR = 1.2; // épaisseur des parois
EPA_COUVERCLE = 4; // epaisseur du couvercle

PROF_RAIL = 2; // profondeur du rail
LARG_RAIL = EPA_COUVERCLE/2; // largeur du rail

module boitier() {
difference(){
    translate([-EPAISSEUR,-EPAISSEUR-PROF_RAIL,-EPAISSEUR-PROF_RAIL])
        cube([LONGUEUR+EPAISSEUR+EPA_COUVERCLE,LARGEUR+2*EPAISSEUR+2*PROF_RAIL,HAUTEUR+2*EPAISSEUR+PROF_RAIL]);
    
    union(){
        // intérieur de la boîte
        translate([0, 0, 0])
		    cube([LONGUEUR+EPA_COUVERCLE+2, LARGEUR, HAUTEUR]);
        
        // couvercle
        translate([LONGUEUR, 0, 2])
		    cube([EPA_COUVERCLE+2, LARGEUR, HAUTEUR]);
        
        // rail gauche
        translate([LONGUEUR,-PROF_RAIL,0]){
            cube([LARG_RAIL,PROF_RAIL+1,HAUTEUR+EPAISSEUR]);  
            }
       // rail droit
       translate([LONGUEUR,LARGEUR-1,0]){
            cube([LARG_RAIL,PROF_RAIL+1,HAUTEUR+EPAISSEUR]);  
            }
            
       // rail bas
       translate([LONGUEUR,-PROF_RAIL,-PROF_RAIL+1]){
            cube([LARG_RAIL,LARGEUR+2*LARG_RAIL,PROF_RAIL+1]);  
            }
        
//        // Trous de 3mm au fond du boîtier
//        translate([25, 55, -EPAISSEUR-1])
//            cylinder(d=3, h=10, $fn=100);
//        translate([24, 7, -EPAISSEUR-1])
//            cylinder(d=3, h=10, $fn=100);
//
//        translate([76, 38, -EPAISSEUR-1])
//            cylinder(d=3, h=10, $fn=100);
//        translate([76, 10, -EPAISSEUR-1])
//            cylinder(d=3, h=10, $fn=100);
        
        // trou pour l'alimentation
        translate([-15, 8+LARGEUR_D, 9+HAUTEUR_BAS])
            rotate([0,90,0])
                cylinder(d=6+2*MARGIN, h=20, $fn=100);
        
        // trou pour USB
        translate([-10, 30+LARGEUR_D-MARGIN, 17-MARGIN+HAUTEUR_BAS])
			cube([20, 15+2*MARGIN, 10+2*MARGIN]);
            
        // trou pour mini-USB
        translate([-10, 32+LARGEUR_D-MARGIN, MARGIN+HAUTEUR_BAS])
			cube([20, 8+2*MARGIN, 5]);
            
        // trou pour la diode (IR receiver)
//        translate([LONGUEUR-10, 18-MARGIN, 32-MARGIN+HAUTEUR_BAS])
//			cube([20, 8+2*MARGIN, 10+2*MARGIN]);
	}
    }
}

// Module de création du couvercle
module couvercle(){
    margin = 0.2;
    difference(){
        // couvercle
        translate([margin, -PROF_RAIL+margin, -PROF_RAIL+margin]){
        cube([LARG_RAIL-margin, LARGEUR+2*PROF_RAIL-2*margin, HAUTEUR+EPAISSEUR+PROF_RAIL-2*margin]);
        }
        
        // trou pour la diode (IR receiver)
        translate([-2, 18-MARGIN, 32-MARGIN+HAUTEUR_BAS])
            cube([20, 8+2*MARGIN, 10+2*MARGIN]);
    }
}


// Créer le modèle 3D du boîtier
translate([LONGUEUR, 0, 0]){
        couvercle();
    }
boitier();


// VUES: pour mesure sur QCAD - boîtier

// vue de devant (USB, alim, mini-USB)
//projection(cut = true){
//    translate([0,0,-EPAISSEUR/2]) {
//        rotate([0,90,0]) {
//            create_boitier();
//        }
//    }
//}

// vue de derrière (diode)
//projection(cut = true){
//    translate([0,0,-LONGUEUR-EPAISSEUR/2]) {
//        rotate([0,270,0]) {
//            create_boitier();
//        }
//    }
//}

//vue de dessous (vis)
//projection(cut = true){
//    translate([0,0,EPAISSEUR/2]) {
//        rotate([0,0,0]) {
//            create_boitier();
//        }
//    }
//}