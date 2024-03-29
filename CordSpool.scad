// Note: The "plug" is the little two-pronged thing that everyone loses.

plugWidth = 29;
plugHeight = 14.6;
plugDepth=18.41;

groundToBox = 4.58;

barrelThickness = 8;
barrelWidth=16.14;
barrelDepth=10.54;

roundRadius = 5;

bumpZmin = 43.8;
bumpRadius = 1.5;
bumpLength = 14;

module bump() {
	translate(v=[0,17.3,bumpZmin+bumpRadius]) difference() {
		rotate(a=[0,90,0]) cylinder(h=bumpLength,r=bumpRadius,center=true,$fn=20);
		translate(v=[0,-bumpRadius,0]) cube([25,2*bumpRadius,2*bumpRadius],center=true);
	}
}



module bracket() {
	import_stl("SpoolMountNoSupport.stl",convexity=5);
}

module plugBox() {
	translate(v=[0,26.5,plugHeight/2]) cube([plugWidth,plugDepth,plugHeight],center=true);
}

module plugBarrel() {
	translate(v=[0,21.7 + groundToBox,(barrelDepth/2) + (plugHeight - barrelDepth) + 0.1]) 
		cube([barrelWidth,barrelThickness,barrelDepth],center=true);
}

union() {
	bracket();
	difference() {
		plugBox();
		plugBarrel();
	}
	 bump();
}


