coef = 10;
rotate([0,90,0])
difference() {
	union() {
		translate([0,0,.08*coef]) cylinder(h=.16*coef,r=2.05*coef,$fn=72,center=true);
		translate([0,0,1.51*coef]) cylinder(h=3*coef,r=0.55*coef,$fn=72,center=true);
	}
	translate([0,0,1.81*coef]) cube([1.1*coef,0.2*coef,2.5*coef],center=true);
}