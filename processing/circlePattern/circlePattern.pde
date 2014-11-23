void setup() {
  //randomSeed(1200);
  size(1000, 1000);
  int s = 100; // base size
  int h = floor(s/2);
  int ts = s;
  int tsh;
  int p = 2; // padding
  color circleColor = color(255);
  background(23,20,180);
  int xLimit = floor(width / s);
  int yLimit = floor(height / s);
  boolean canDraw = false;
  noStroke();
  //stroke(0);
  //noFill();
  fill(circleColor);
  ellipseMode(CORNER);
  for (int x = 0; x <= xLimit; x+=1) {
    for (int y = 0; y <= yLimit; y+=1) {
      if (floor(random(20)) == 1) {
        ts = floor(s*pow(2,(floor(random(3)))+1));
        println("making bigger: "+ ts + "; x="+x+"; y="+y);
      }
      
      canDraw = false;
      tsh = ts / 2;

      while (ts >= s) {
        if (get(x*s+1, y*s+1) == circleColor //upper left
          || get(x*s+tsh, y*s+1) == circleColor // upper half
          || get(x*s+ts-1, y*s+1) == circleColor // upper right
          || get(x*s+ts-1, y*s+tsh) == circleColor // right half
          || get(x*s+ts-1, y*s+ts-1) == circleColor // bottom right
          || get(x*s+tsh, y*s+ts-1) == circleColor // bottom half
          || get(x*s+1, y*s+ts-1) == circleColor // bottom left
          || get(x*s+1, y*s+tsh) == circleColor // left half
          || (x*s+ts-1 > width || y*s+ts-1 > height)) // small enough to fit screen
          {
            ts = ts / 2;
            tsh = ts / 2;
            if (ts > s)
              println(ts + "; " + s);
          } else {
          if (ts >= s)
            canDraw = true;
          break;
        }
      }
      if (canDraw) {
          ellipse(x*s, y*s, ts, ts);
        if (ts > s) {   
          if (floor(random(4)) == 1)
            triangle(x*s, y*s+tsh, x*s+tsh, y*s, x*s, y*s);
          if (floor(random(4)) == 1)
            triangle(x*s+tsh, y*s, x*s+ts, y*s+tsh, x*s+ts, y*s);
          if (floor(random(4)) == 1)
            triangle(x*s+tsh, y*s+ts, x*s+ts, y*s+tsh, x*s+ts, y*s+ts);
          if (floor(random(4)) == 1)
            triangle(x*s, y*s+tsh, x*s+tsh, y*s+ts, x*s, y*s+ts);
        }
      }
    }
  }
}

