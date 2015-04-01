int go() {
  //randomSeed(1200);
  color[] colors = {color(#FF0032), color(#40667B), color(#85F03B), color(#FF9C1A), color(#FFCD72)};
  size(1000, 1000);
  int s = 100; // base size
  int h = floor(s/2);
  int ts = s;
  int tsh;
  int p = 2; // padding
  color circleColor = color(255);
  ArrayList<int[]> circles = new ArrayList<int[]>();
  int[] values;
  background(255);
  int xLimit = floor(width / s);
  int yLimit = floor(height / s);
  boolean canDraw = true;
  noStroke();
  //stroke(130);
  noFill();
  //fill(circleColor);
  ellipseMode(CENTER);
  int n = floor(random(3))+3;
  int sizeLevels = 4;
  println(n);
  for (int l = sizeLevels; l != 0; l--){
    n = floor(random(3))+3;
    for (int i = 0; i <= n; i++){
      int st = s*l;
      boolean found = false;
      int count = 0;
      int iterationLimit = 20;
      while (!found && count < iterationLimit && count < circles.size() || circles.size() == 0 ) {
        int xRan = floor(random(xLimit));
        int yRan = floor(random(yLimit));
        if (circles.size() == 0) {
          xRan = xLimit/2;
          yRan = yLimit/2;
          found = true;
          //print ("first ");
        } else {
          //print ("not first ");
          int comparable = max(circles.get(count)[2], st);
          //println(dist(xRan * s, yRan*s, circles.get(count)[0], circles.get(count)[1]), comparable);
          // if the circle center lies outside the comparison circle
          if (dist(xRan * s, yRan*s, circles.get(count)[0], circles.get(count)[1]) < comparable/2)
          {
            found = true;
            //println("found free spot");
          }
        }
          if (!found) {
            count++;
            //println("increase count");
          } else {
            //println("adding to ");
            values = new int[3];
            values[0] = xRan*s;
            values[1] = yRan*s;
            values[2] = st;
            circles.add(values);
            ellipse(values[0],values[1],values[2],values[2]);
          }
          //println();
      } // while
      
    } // for    
  } // for
  
  // fill intersect areas
  if (true) {
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int counter = 0;
        int id = 0;
        for (int i = 0; i < circles.size(); i++) {
          if (sqrt( pow(( x - circles.get(i)[0]),2) + pow((y - circles.get(i)[1]),2)) <= circles.get(i)[2]/2){
            counter++;
            
            id = circles.get(i)[0] + circles.get(i)[1] + circles.get(i)[2];
            randomSeed(id);
            id = floor(random(10));
            randomSeed(9;
          }
          
        }
        if (counter > 1) {
        //println(id);
        set(x,y,colors[(id -((id/5)*5))]);
        //println(id);
        }
      }
    }
  }
  
  return circles.size();
}

void setup() {
  frameRate(1);
  while (true){
    if (go() != 1) break;
  }
}
void draw() {
}
void mousePressed(){
  go();
}
