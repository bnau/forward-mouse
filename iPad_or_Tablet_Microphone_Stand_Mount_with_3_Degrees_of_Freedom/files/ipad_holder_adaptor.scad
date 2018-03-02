difference() {
	union() {
		difference() {
			translate([0,0,1.5]) cylinder(h=3,r=.9,$fn=72,center=true);
			translate([0,0,1.25]) cylinder(h=2.6,r=0.58,$fn=72,center=true);
		}
		translate([0,0,1.25]) cube([1.2,0.15,2.5],center=true);
		translate([0,-.2,3.9]) cube([1.6,.4,1.8],center=true);
		translate([0,-.2,4.8]) rotate([90,0,0]) cylinder(h=.4,r=1.27,$fn=72,center=true);
	}
	union() {
		for (i = [0:10:360]) {
			translate([0,0,4.8]) rotate([0,i,0]) translate([1,0,0]) sphere(.1,$fs=.05);
		}
		translate([0,-.2,4.8]) rotate([90,0,0]) cylinder(h=.6,r=.2,$fn=72,center=true);
	}
}