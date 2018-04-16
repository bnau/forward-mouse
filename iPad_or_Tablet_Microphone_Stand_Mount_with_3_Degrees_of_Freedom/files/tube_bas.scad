diam=.8;
/*
difference() {
    cylinder(h=15,r=diam,$fn=72);
    
    union(){
        rotate([0,90,0]) cylinder(h=0.4, r=2,$fn=72, center=true);
        translate([0,0,1]) rotate([0,90,0]) cylinder(h=5, r=0.2,$fn=72, center=true);
    }
}
*/
translate([0,0,0]) rotate([180,0,0])
difference(){
union() {
    difference(){
        cylinder(h=15,r=diam,$fn=72);
        //cube([2,2,2], center=true);
    }
    rotate([0,90,0]) cylinder(h=0.4, r=2,$fn=72, center=true);
}
union(){
    translate([0,0,-1.3]) rotate([0,90,0]) cylinder(h=5, r=0.2,$fn=72, center=true);
    
}
}
