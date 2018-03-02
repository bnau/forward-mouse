difference() {
	union() {
		translate([0,0,.08]) cylinder(h=.16,r=2.05,$fn=72,center=true);
		translate([0,0,1.51]) cylinder(h=3,r=0.55,$fn=72,center=true);
	}
	translate([0,0,1.81]) cube([1.1,0.2,2.5],center=true);
}