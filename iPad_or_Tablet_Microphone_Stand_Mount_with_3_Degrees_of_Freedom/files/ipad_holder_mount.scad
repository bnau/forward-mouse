difference() {
	union() {
		cylinder(h=1.2,r=.9,$fn=72,center=true);
		translate([.9,0,.3]) cube([1.5,3.0,1.8],center=true);
		translate([.8,0,1.8]) rotate([90,0,0]) cylinder(h=5,r=1.2,$fn=72,center=true);
	}
	union() {
		translate([0,0,0]) cube([2.6,2.6,0.425],center=true);
		cylinder(h=1.4,r=.2,$fn=72,center=true);
		translate([0,0,1.7]) cylinder(h=2.4,r=.4,$fn=72,center=true);
		translate([.8,0,1.8]) rotate([90,0,0]) cylinder(h=5.2,r=.85,$fn=72,center=true);
	}
}
