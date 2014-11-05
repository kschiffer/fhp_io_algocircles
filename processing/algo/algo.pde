ArrayList<int[]> circles;
color[] colors = {color(255,0,0), color(0,255,0), color(255,255,0)};

void setup(){
  size(500,500);
  background(255);
  
  stroke(0);
  noFill();
  int s;
  int[] values = new int[3];
  circles = new ArrayList<int[]>();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      if (floor(random(15000)) == 1) {
        s = floor(random(300));
        values = new int[3];
        values[0] = x;
        values[1] = y;
        values[2] = s;
        circles.add(values);
        //ellipse(x,y,s,s);
      }
    }
  }
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int counter = 0;
      for (int i = 0; i < circles.size(); i++) {
        if (sqrt( pow(( x - circles.get(i)[0]),2) + pow((y - circles.get(i)[1]),2)) <= circles.get(i)[2]/2){
          counter++;
        }
      }
      if (counter > 1) {
      set(x-1,y-1,colors[(counter - ((counter / 3) * 3))]);
      //println(counter);
      }
    }
  }
  
  for (int i = 0; i < circles.size(); i++) {
    ellipse(circles.get(i)[0],circles.get(i)[1],circles.get(i)[2],circles.get(i)[2]);
  }
  
  fill(0);
  rectMode(CENTER);
  rect(width/2,height/2,width*.1,height*.1);
  line(0,0,width,height);
}

void draw(){
}

void mousePressed(){
int counter = 0;
  for (int i = 0; i < circles.size(); i++) {
    if (sqrt( pow(( mouseX - circles.get(i)[0]),2) + pow((mouseY - circles.get(i)[1]),2)) <= circles.get(i)[2]){
      counter++;
    }
  }
  println(counter);
}
