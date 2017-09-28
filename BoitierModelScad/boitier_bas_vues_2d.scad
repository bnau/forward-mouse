MARGIN = 1; // marge de sécurité sur les mesures pour les trous
HAUTEUR = 50; // hauteur du boîtier (intérieur): z
HAUTEUR_BAS = 3; // compenser en bas (z) (soudures en dessous de l'Arduino)
LARGEUR = 70; // largeur du boîtier (intérieur): y
LARGEUR_D = 4; // de combien la plaque dépasse à droite: y
LARGEUR_G = 14; // de combien la plaque dépasse à gauche: y
LONGUEUR = 82; // Longueur du boîtier (intérieur): x
EPAISSEUR = 1.2; // épaisseur des parois

module create_boitier() {
difference(){
    translate([-EPAISSEUR,-EPAISSEUR,-EPAISSEUR])
        cube([LONGUEUR+2*EPAISSEUR,LARGEUR+2*EPAISSEUR,HAUTEUR+EPAISSEUR]);
    
    union(){
        // intérieur de la boîte
        translate([0, 0, 0])
		    cube([LONGUEUR, LARGEUR, HAUTEUR+2]);
        
        // Trous de 3mm au fond du boîtier
        
        translate([25, 55, -EPAISSEUR-1])
            cylinder(d=3, h=100, $fn=100);
        translate([24, 7, -EPAISSEUR-1])
            cylinder(d=3, h=100, $fn=100);

        translate([76, 38, -EPAISSEUR-1])
            cylinder(d=3, h=100, $fn=100);
        translate([76, 10, -EPAISSEUR-1])
            cylinder(d=3, h=100, $fn=100);
        
        // trou pour l'alimentation
        translate([-15, 8+LARGEUR_D, 9+HAUTEUR_BAS])
            rotate([0,90,0])
                cylinder(d=6+2*MARGIN, h=20, $fn=100);
        
        // trou pour USB
        translate([-10, 32+LARGEUR_D-MARGIN, 17-MARGIN+HAUTEUR_BAS])
			cube([20, 15+2*MARGIN, 10+2*MARGIN]);
            
        // trou pour mini-USB
        translate([-10, 32+LARGEUR_D-MARGIN, MARGIN+HAUTEUR_BAS])
			cube([20, 8+2*MARGIN, 5]);
            
        // trou pour la diode (IR receiver)
        translate([LONGUEUR-10, 18-MARGIN, 32-MARGIN+HAUTEUR_BAS])
			cube([20, 8+2*MARGIN, 10+2*MARGIN]);
	}
    }
}

// Créer le modèle 3D du boîtier
create_boitier();

// VUES: pour mesure sur QCAD

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
//    translate([0,0,LONGUEUR+EPAISSEUR/2]) {
//        rotate([0,90,0]) {
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