int divisions = 8;
float i, distance;
float angle = 2*PI/divisions;
void setup(){
  background(0);
  frameRate(50);
  size(600, 600);
  stroke(255);
  translate(300, 300);
  noFill();
  rectMode(CENTER);
  rect(0, 0, width-1, height-1);
  translate(-300, -300);
  fill(255);
}
void draw(){
}
void mouseDragged(){
  point(mouseX, mouseY);
  point(width-mouseX, mouseY);
  point(mouseX, height-mouseY);
  point(width-mouseX, height-mouseY);
  //point(width/2-mouseX, mouseY);
  //point(mouseX, height/2-mouseY);
  //point(width/2-mouseX, height/2-mouseY);
  
  //println("X:%d",mouseX);
  //println("Y:%d",mouseY);
}
/*void mouseDragged(){
  for(i=1;i<=divisions;i++){
    distance = dist(width/2, height/2, mouseX, mouseY);
    ellipse(width/2 +  distance*cos(angle*i), height/2 + distance*sin(angle*i), 10, 10);
  }
}*/
