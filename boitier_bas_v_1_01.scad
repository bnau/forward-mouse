// hauteur du boîtier (intérieur): z
haut = 40; 
// largeur du boîtier (intérieur): y
larg = 70; 
// longueur du boîtier (intérieur): x
long = 82; 
// épaisseur des parois
epa = 1.2;

difference(){
    translate([-epa,-epa,-haut])
        cube([long+2*epa,larg+2*epa,haut+epa]);
    union(){
        // intérieur de la boîte
        translate([0, 0, -haut-2])
		    cube([long, larg, haut+2]);
        
        // Trous de 4mm
		translate([4, larg-55, -1])
            cylinder(d=5, h=100, $fn=100);
        translate([4, larg-7, -1])
            cylinder(d=5, h=100, $fn=100);
        // Trous de 3mm au milieu
        translate([25, larg-55, -1])
            cylinder(d=3, h=100, $fn=100);
        translate([24, larg-7, -1])
            cylinder(d=3, h=100, $fn=100);
        
        translate([66, larg-48, -1])
            cylinder(d=3, h=100, $fn=100);
        translate([66, larg-10, -1])
            cylinder(d=3, h=100, $fn=100);
        
        translate([76, larg-38, -1])
            cylinder(d=3, h=100, $fn=100);
        translate([76, larg-10, -1])
            cylinder(d=3, h=100, $fn=100);
            
        // trou alim
        translate([-15, larg-11, -15])
            rotate([0,90,0])
                cylinder(d=9, h=20, $fn=100);
        
        // trou USB
        translate([-10, larg-48, -23])
			cube([20, 15, 10]);
            
        // trou mini-USB
        translate([-10, larg-45, -6])
			cube([20, 10, 5]);
	}
    }
