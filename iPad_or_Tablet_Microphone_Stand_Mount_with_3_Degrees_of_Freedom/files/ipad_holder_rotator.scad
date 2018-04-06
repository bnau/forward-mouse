

difference() {
	union() {
		difference() {
			translate([0,0,2.5]) cylinder(h=1.2,r=1.15,$fn=72,center=true);
			union() {
				translate([0,0,2.5]) cylinder(h=0.4,r=.9,$fn=72,center=true);
				translate([1,0,2.5]) cube([2.8,2.8,.4],center=true);
				translate([0,0,2.5]) cylinder(h=1.4,r=.2,$fn=72,center=true);
			}
		}
		translate([0,-.2,3.9]) cube([1.6,.4,1.8],center=true);
		translate([0,-.2,4.8]) rotate([90,0,0]) cylinder(h=.4,r=1.27,$fn=72,center=true);
		for (i = [0:10:360]) {
			translate([0,0,4.8]) rotate([0,i,0]) translate([1,0,0]) sphere(.1,$fs=.05 );
		}
	}
	union() {
		translate([0,-.2,4.8]) rotate([90,0,0]) cylinder(h=.6,r=.2,$fn=72,center=true);
	}
}