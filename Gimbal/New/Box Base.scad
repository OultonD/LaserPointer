$fn = 30;

mount_hole_y = 75.4/2;
mount_hole_x = 31.4/2;
hole_diameter = 2.8;

tripod_mount_hole = 6.35;

wall_thickness = 2.5;

pcb_height = 36;
pcb_length = 80;

screen_height = 23.8;
screen_length = 70.7;

faceplate_height = pcb_height + 15;
faceplate_length = pcb_length + 20;
box_depth = 70;

union(){
faceplate();
sidewalls();
baseplate();

}

module faceplate(){
	difference(){
		translate([faceplate_height/-2,faceplate_length/-2]){
			difference(){
				cube([faceplate_height,faceplate_length,wall_thickness]);
				translate([(faceplate_height-screen_height)/2,(faceplate_length-screen_length)/2]){
					cube([screen_height,screen_length,wall_thickness]);
				}	
			}
		}
		translate([mount_hole_x,mount_hole_y]){cylinder(wall_thickness, d=hole_diameter, true);}
		translate([-mount_hole_x,mount_hole_y]){cylinder(wall_thickness, d=hole_diameter, true);}
		translate([mount_hole_x,-mount_hole_y]){cylinder(wall_thickness, d=hole_diameter, true);}
		translate([-mount_hole_x,-mount_hole_y]){cylinder(wall_thickness, d=hole_diameter, true);}
	}
}

module sidewalls(){
	difference(){
	translate([faceplate_height/-2,faceplate_length/-2]){
		cube([faceplate_height,wall_thickness, box_depth]);
	}
	translate([0,(faceplate_length/-2)+3,box_depth/4]){
		rotate([90,0,0]){
			cylinder(wall_thickness+2,d=5,true);
		}
	}
	}
	translate([faceplate_height/-2,faceplate_length/2]){
		cube([faceplate_height,wall_thickness, box_depth]);
	}
}

module baseplate(){
	difference(){
		translate([faceplate_height/2,faceplate_length/-2]){
			cube([wall_thickness,faceplate_length+wall_thickness, box_depth]);
		}
translate([(faceplate_height/2)-1,0,box_depth/2]){
		rotate([0,90,0]){
			cylinder(wall_thickness+2,d=tripod_mount_hole,true);}
		}
	}
	
}