//  A foot for the bottom of toilet seat

// Change these
height=13;
topLength=42;
bottomLength=52;
topWidth=15;
bottomWidth=19;
lipHeight=4;
lipDepth=2;
$fn = 60;

// Leave these alone
topRadius=topWidth/2;
bottomRadius=bottomWidth/2;
polyLength=topLength-topRadius; // Not topLength-2*topRadius because 1st cylindar is centered on 0

hull(){

  translate([0,0,lipHeight])
    cylinder(r1=bottomRadius, r2=topRadius, h=height-lipHeight, center=false);

  translate([0,polyLength,lipHeight])
    cylinder(r1=bottomRadius, r2=topRadius, h=height-lipHeight, center=false);
}

// Now the lip
hull(){

  translate([0,0,0])
    cylinder(r1=bottomRadius+lipDepth, r2=bottomRadius+lipDepth,, h=lipHeight, center=false);

  translate([0,polyLength,0])
    cylinder(r1=bottomRadius+lipDepth, r2=bottomRadius+lipDepth, h=lipHeight, center=false);
}

