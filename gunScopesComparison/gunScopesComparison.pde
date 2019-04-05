float radius = 300;
float area = PI*radius*radius;
void setup(){
  background(0);
  size(600, 600);
  stroke(255);
  noFill();
  strokeWeight(0.5);
  frameRate(1);
}


void draw(){
  translate(width/2, height/2);
  ellipse(0, 0, 2*radius, 2*radius);
  area = area/2;
  radius = sqrt(area/PI);
  if(frameCount>5){ noLoop(); }
}
