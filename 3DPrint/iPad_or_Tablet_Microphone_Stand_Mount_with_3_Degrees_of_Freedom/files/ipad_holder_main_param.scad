    // These are the outside dimensions of the tablet
    coef = 10;
    
    width=16.1*coef; // 161
    height=26.1*coef; // 261
    thickness=1*coef;
    
    
    difference() {
    
    union() {
    
    difference() {
    
    translate([-(height+1.2*coef)/2+.15*coef,-(width+1.2*coef)/2+.3*coef,0]) {
        
    // cube général, extrude pour avoir les crochets au bout des bras
    difference() {
        translate([0,-.15*coef,0]) cube([height+0.6*coef,width+1.2*coef,thickness+0.4*coef]);
        translate([0.3*coef,0.15*coef,0.4*coef]) cube([height,width,thickness+0.4*coef]);
    }
    }
    union() {
         // on supprime le bras en y+
        translate([0,width/2+1.5*coef,0]) cube([height*2,width,thickness+10*coef],center=true);
        
        translate([-10.5*coef,10.5*coef,.8*coef]) cube([20*coef,20*coef,thickness+.7*coef],center=true);
        translate([10.5*coef,10.5*coef,.8*coef]) cube([20*coef,20*coef,thickness+.7*coef],center=true);
        
        translate([13*coef,-9*coef,.8*coef]) cube([20*coef,17*coef,thickness+.7*coef],center=true);
        translate([-13*coef,-9*coef,.8*coef]) cube([20*coef,17*coef,thickness+.7*coef],center=true);
        
        translate([0,width/2+2.5*coef,.8*coef]) cube([8*coef,4*coef,thickness+.7*coef],center=true);
        translate([0,-width/2-2.5*coef,.8*coef]) cube([4*coef,12*coef,thickness+.7*coef],center=true);
        
        translate([-7*coef,-2*coef,.8]) cube([12*coef,3*coef,thickness+.7],center=true);
        translate([7*coef,-2*coef,.8]) cube([12*coef,3*coef,thickness+.7],center=true);
        //translate([-10.5*coef,-10.5*coef,.8]) cube([20*coef,20*coef,thickness+.7],center=true);
        //translate([height/4-1.5*coef,-11*coef,.8]) cube([height/2-4*coef,20*coef,thickness+.7],center=true);
        //translate([height/4-1.5*coef,11*coef,.8]) cube([height/2-4*coef,20*coef,thickness+.7],center=true);
        
       

        //translate([9*coef,-13*coef,.8]) cube([14*coef,20*coef,thickness+.7],center=true);
        //translate([9*coef,13*coef,.8]) cube([14*coef,20*coef,thickness+.7],center=true);
        //translate([height/2+2.5*coef,0,.8]) cube([8*coef,4*coef,thickness+.7],center=true);
        //translate([0,-width/2-.3*coef,1.1]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);
        //translate([0,width/2+.3*coef,1.1]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);
        
        // double bras
        /*translate([9*coef,-13*coef,.8]) cube([14*coef,20*coef,thickness+.7],center=true);
        translate([9*coef,13*coef,.8]) cube([14*coef,20*coef,thickness+.7],center=true);
        translate([height/2+2.5*coef,0,.8]) cube([8*coef,4*coef,thickness+.7],center=true);
        translate([0,-width/2-.3*coef,1.1]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);
        translate([0,width/2+.3*coef,1.1]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);*/
       
        translate([-2.5*coef,-width/2-.3*coef,1.1*coef]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);
        translate([2.5*coef,-width/2-.3*coef,1.1*coef]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);
        translate([-height/2-.3*coef,0,1.1*coef]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);
        translate([height/2,0,1.1*coef]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);
    }
    }
    translate([0,0,.21*coef]) cylinder(h=.42*coef,r=2.5*coef,$fn=36,center=true);
    }
    union() {
    translate([0,0,.4*coef]) cylinder(h=.42*coef,r=2.1*coef,$fn=36,center=true);
    translate([0,0,0]) cylinder(h=.8*coef,r=0.6*coef,$fn=36,center=true);
    }
    }
//translate([height/2+.1*coef,0,1.1*coef]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);