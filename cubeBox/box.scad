// Global resolution
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

$bf = 5;
$edge=1;
$outer_size = 33 + (2 * $bf);
$screw=10;

// Modify depending on the 3D printer accuracy
$cover_small=0.5;


// ---------------------------
// Main geometry -- select one
//boxBasic();
//boxBasic_holder();

boxUWBLogo();
//boxUWBLogo_holder();
// ---------------------------

module boxBasic() {
  difference() {
    body();
    cover();
    magnet();
  }

  coverHole();
}

module boxUWBLogo() {
  difference() {
    body();
    cover();
    magnet();
  }

  coverLogo();
}

module boxBasic_holder() {
  union() {
    difference() {
      body();
      cover();
      //magnet();
    }

    coverHole();
  
    holder();
  }
}

module boxUWBLogo_holder() {
  union() {
    difference() {
      body();
      cover();
      //magnet();
    }

    coverLogo();
  
    holder();
  }
}

module holder() {
  difference() {
    translate([0,0,(-$outer_size/2 + $bf/2)]) color("Yellow") cube([3 * $outer_size ,$outer_size, $bf], center=true);
      
    translate([-$outer_size,0,(-$outer_size/2 + $bf/2)]) color("Red") cube([$outer_size/2 ,$screw, $bf], center=true);
      
    translate([$outer_size,0,(-$outer_size/2 + $bf/2)]) color("Red") cube([$outer_size/2 ,$screw, $bf], center=true);
  }
}

module coverLogo() translate([0,0,($outer_size/2+$bf)]) {
    difference() {
        union() {
            coverBaseSmall();
            rotate([0, 0, 45])  coverXSmall();
            rotate([0, 0, -45])  coverXSmall();
        }   
        translate([0,0,$bf/4]) logo();
    }
}

module coverHole() translate([0,0,($outer_size/2+$bf)]) {
    difference() {
        union() {
            coverBaseSmall();
            rotate([0, 0, 45])  coverXSmall();
            rotate([0, 0, -45])  coverXSmall();
        }   
        translate([0,0,$bf/4]) hole();
    }
}

module body() {
  difference() {
    intersection() {
        mainCube();
        edges();
        edges2();
        rotate([0, 90, 0]) edges2();
        rotate([90, 0, 0]) edges2();
    }
    mainCubeMinus();
  }
}

module edges() {
    color("Blue") sphere($outer_size - 7);
}

module edges2() {
    cylinder(h = 2*$outer_size, r1 = sqrt(2 * ($outer_size-$edge)/2 * ($outer_size-$edge)/2), r2 = sqrt(2 * ($outer_size-$edge)/2 * ($outer_size-$edge)/2), center = true);
}

module mainCube() {
    color("Red") cube($outer_size, center=true);
}

module mainCubeMinus() {
    color("Green") cube($outer_size - (2 * $bf), center=true);
}

module mainCubeMinusMoved()  translate([$bf,$bf,$bf]) mainCubeMinus();

module cover() translate([0,0,($outer_size-$bf)/2]) {
        union() {
            coverBase();
            rotate([0, 0, 45])  coverX();
            rotate([0, 0, -45])  coverX();
        }
}

module logo() {
    include <../resources/zcu-logo.scad>;
    linear_extrude(height = $bf/2, center = true) color("Blue")logo_u();    
    hole();
}

module hole() {
    include <../resources/zcu-logo.scad>;
    linear_extrude(height = 2*$bf, center = true) color("Blue") logo_tri();
}

module coverBase() {
    color("Yellow") cube([$outer_size - (1.5 * $bf),$outer_size - (1.5 * $bf),$bf], center=true);
}

module coverBaseSmall() {
    color("Yellow") cube([$outer_size - (1.5 * $bf) - $cover_small,$outer_size - (1.5 * $bf) - $cover_small,$bf], center=true);
}

module coverX() {
    color("Red") cube([sqrt(($outer_size-2*$bf)*($outer_size-2*$bf)*2),2*$bf-$bf/2,$bf], center=true);
}

module coverXSmall() {
    color("Red") cube([sqrt(($outer_size-2*$bf-$cover_small)*($outer_size-2*$bf-$cover_small)*2),2*$bf-$bf/2-$cover_small,$bf], center=true);
}

module magnet() translate([0,0, -($outer_size-$bf-3)/2]) {
    color("Blue") cube([21,21,3.5], center=true);
}