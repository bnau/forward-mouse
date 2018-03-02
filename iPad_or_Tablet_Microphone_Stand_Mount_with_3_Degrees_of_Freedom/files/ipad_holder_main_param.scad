    // These are the outside dimensions of the tablet
    coef = 10;
    
    width=18.6*coef;
    height=24*coef;
    thickness=1.1;
    
    
    difference() {
    
    union() {
    
    difference() {
    
    translate([-(height+1.2*coef)/2+.15*coef,-(width+1.2*coef)/2+.3*coef,0]) {
        
    // cube général, extrude pour avoir les crochets au bout des bras
    difference() {
        translate([-.15*coef,-.3*coef,0]) cube([height+1.2*coef,width+1.2*coef,thickness+0.4]);
        translate([0.45*coef,0.3*coef,0.4]) cube([height,width,thickness+0.4]);
    }
    }
    union() {
         // on supprime le bras en y+
        translate([0,width/2+1.5*coef,0]) cube([height*2,width,thickness+10],center=true);
        
        translate([-10.5*coef,10.5*coef,.8]) cube([20*coef,20*coef,thickness+.7],center=true);
        translate([10.5*coef,10.5*coef,.8]) cube([20*coef,20*coef,thickness+.7],center=true);
        
        translate([13*coef,-9*coef,.8]) cube([20*coef,14*coef,thickness+.7],center=true);
        translate([-13*coef,-9*coef,.8]) cube([20*coef,14*coef,thickness+.7],center=true);
        
        translate([0,width/2+2.5*coef,.8]) cube([8*coef,4*coef,thickness+.7],center=true);
        
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
       
        translate([height/2+.3*coef,-2.5*coef,1.1]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);
        translate([height/2+.3*coef,2.5*coef,1.1]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);
        translate([-height/2-.3*coef,0,1.1]) cylinder(h=1*coef,r=0.1*coef,$fn=18,center=true);
    }
    }
    translate([0,0,.21]) cylinder(h=.42*coef,r=2.5*coef,$fn=36,center=true);
    }
    union() {
    translate([0,0,.4]) cylinder(h=.42*coef,r=2.1*coef,$fn=36,center=true);
    translate([0,0,0]) cylinder(h=.8*coef,r=0.6*coef,$fn=36,center=true);
    }
    }
