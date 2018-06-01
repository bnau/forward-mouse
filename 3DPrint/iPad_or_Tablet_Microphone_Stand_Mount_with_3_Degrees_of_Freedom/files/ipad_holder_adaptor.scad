coef = 10; 

difference() {
	union() {
		difference() {
			translate([0,0,1.5*coef]) cylinder(h=3*coef,r=.9*coef,$fn=72,center=true);
			translate([0,0,1.25*coef]) cylinder(h=2.6*coef,r=0.58*coef,$fn=72,center=true);
		}
		translate([0,0,1.25*coef]) cube([1.2*coef,0.15*coef,2.5*coef],center=true);
		translate([0,-.2*coef,3.9*coef]) cube([1.6*coef,.4*coef,1.8*coef],center=true);
		translate([0,-.2*coef,4.8*coef]) rotate([90,0,0]) cylinder(h=.4*coef,r=1.27*coef,$fn=72,center=true);
	}
	union() {
		for (i = [0:10:360]) {
			translate([0,0,4.8*coef]) rotate([0,i,0]) translate([1*coef,0,0]) sphere(.1*coef,$fs=.05);
		}
		translate([0,-.2*coef,4.8*coef]) rotate([90,0,0]) cylinder(h=.6*coef,r=.2*coef,$fn=72,center=true);
	}
}