//  A foot for the bottom of toilet seat

// Change these
height=5;
topLength=14;
topWidth=8;
bottomLength=12;
bottomWidth=4;
$fn = 40;

// Leave these alone
topRadius=topWidth/2;
bottomRadius=bottomWidth/2;
polyLength=topLength-topRadius; // Not topLength-2*topRadius because 1st cylindar is centered on 0

//https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#polygon

CubePoints = [
  [  -bottomWidth/2,  0,  0 ],  //0
  [ bottomWidth/2,  0,  0 ],  //1
  [ bottomWidth/2,  polyLength,  0 ],  //2
  [  -bottomWidth/2,  polyLength,  0 ],  //3
  [  -topWidth/2,  0,  height],  //4
  [ topWidth/2,  0,  height ],  //5
  [ topWidth/2,  polyLength,  height ],  //6
  [  -topWidth/2,  polyLength,  height ]]; //7
  
CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
polyhedron( CubePoints, CubeFaces );

cylinder(r1=bottomRadius, r2=topRadius, h=height, center=false);

translate([0,polyLength,0])  cylinder(r1=bottomRadius, r2=topRadius, h=height, center=false);

