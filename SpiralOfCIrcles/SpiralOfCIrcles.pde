float i, theta = TWO_PI/360;
void setup(){
  background(0);
  stroke(255);
  size(600, 600);
  noFill();
  strokeWeight(0.1);
  colorMode(HSB, 360, 100, 100);
  frameRate(100);
}

void draw(){
  stroke((theta*180/PI)%360, 100, 100);
  translate(width/2, height/2);
  ellipse(i*cos(theta), i*sin(theta), 34, 34);
  i+=0.1;
  theta += TWO_PI/360;
  //if(i*cos(theta)>width/2){ noLoop(); }
}
