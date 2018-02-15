$fn=20;

thickness = 5;

difference(){ 
cylinder(h=thickness, d=80, center=false);
cylinder(h=thickness, d=16, center=false);
translate([-35/2,-8,0]) 
	cylinder(h=thickness,r=3.5,center=false);
translate([35/2,-8,0])
	cylinder(h=thickness,r=3.5,center=false);
}