$fs = 0.1;

module stem_cherry(w=4.9, d=4.9, h=15, cl_sub=0.0, cw1=1.40,cw2=1.40,ch=3.5){
    cl = w - cl_sub;
    difference() {
        
        translate([0, 0, h / 2])
            cube([w, d, h], center = true);
        translate([0, 0, ch / 2])
            cube([cw1, d, ch], center = true);
        translate([0, 0, ch / 2])
            cube([cl, cw2, ch], center = true);
    }
}



module stem_low(w=1, d=3, h=4, sw=4.5, h2=5) {
    translate([0, 0, h/2]){
        ttw = sw/2 + w/2;
        translate([-ttw, 0, 0])
        cube([w, d, h], center=true);
        translate([ttw, 0, 0])
        cube([w, d, h], center=true);
    }
    ww = sw + w*2;
    th = h2/2 + h;
    translate([0, 0, th])
    cube([ww, d, h2], center=true);
}

module round_cube(w, d, r){
    h = 0.0001;
    minkowski () {
        cube([w - r*2, d - r*2, h], center = true);
        cylinder(r = r, h = h);
    }
}

module keyouter(tw, td, tr, bw, bd, br, h, trx, try, trz){
    echo("trz", trz);
    hull() {
        translate([0, 0, h])
        rotate([trx, try, trz])
        round_cube(tw, td, tr);

        round_cube(bw, bd, br);
    }
}
function dish_r(w, d) = (w * w + 4 * d * d) / (8 * d);
module keyouter_dish(tw, td, tr, bw, bd, br, h, trx, try, trz, dd){
    difference() {
        keyouter(tw, td, tr, bw, bd, br, h, trx, try, trz);
        
        dr = dish_r(tw, dd);
        translate([0, 0, h])
        rotate([trx, try, trz])
        translate([0, 0, dr - dd])
                  rotate([90, 0, 0])
                    cylinder(r = dr, h = 60,center = true, $fn=300);
    }
}

module keyshape(tw, td, tr, bw, bd, br, h, trx, try, trz, dd, std=0, is_low_stem=false, cr=2, bar_r=0.5, arz=0) {
    intersection () {
      rotate([0, 0, arz])
      translate([0, std, 0]){
          if(is_low_stem) {
            stem_low();
          }else{
            stem_cherry();
          }
      }
      keyouter_dish(tw, td, tr, bw, bd, br, h, trx, try, trz, dd);
    }

    difference() {
        keyouter_dish(tw, td, tr, bw, bd, br, h, trx, try, trz, dd);
        keyouter_dish(tw-cr, td-cr, tr, bw-cr, bd-cr, br, h-cr, trx, try, trz, dd);
    }
    
    rotate([trx, try, trz])
    translate([0, td*0.4, h-dd])
    rotate([0, 90, 0])
    cylinder(r=bar_r, h=tw/2, center=true);
}


h = 7;
tr = 3;
tw = 14;
td = 14;
trx = 10;
try = 0;
trz = 0;
br = 0.5;
bw = 18;
bd = 18;
dd = 1.0;
arz = 0;
std = 0;

//stem_low();

//keyshape(tw, td, tr, bw, bd, br, h, trx, try, trz, dd, std, is_low_stem=false);
//keyshape(tw, td, tr, bw, bd, br, h, trx=0, try, trz, dd=1.0, std, is_low_stem=true, bar_r=0, arz=arz);


// low stem
// left1
//keyshape(tw, td, tr, bw, bd, br, h=7, trx=0, try=try, trz=20, dd=1.0, std=std, is_low_stem=true, bar_r=0, arz=arz);
// left2+right2
//ad = 4;
//keyshape(tw=tw, td=td+ad, tr=tr, bw=bw, bd=bd+ad, br=br, h=7, trx=10, try=try, trz=trz, dd=dd, std=2, is_low_stem=true, bar_r=0, arz=arz);
//keyshape(tw=tw, td=td+ad, tr=tr, bw=bw, bd=bd+ad, br=br, h=6.5, trx=5, try=try, trz=trz, dd=dd, std=2, is_low_stem=true, bar_r=0, arz=arz);
// left3
//keyshape(tw=tw, td=td+ad, tr=tr, bw=bw, bd=bd+ad, br=br, h=7, trx=10, try=try, trz=-20, dd=dd, std=2, is_low_stem=true, bar_r=0, arz=arz);
// right1
//keyshape(tw=tw, td=td+ad, tr=tr, bw=bw, bd=bd+ad, br=br, h=7, trx=10, try=try, trz=20, dd=dd, std=2, is_low_stem=true, bar_r=0, arz=arz);