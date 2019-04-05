float R = 125/2;
float r = 75/2;
float theta;
float x, y, d = 125/2;
void setup(){
  size(600, 600);
  background(0);
  frameRate(50);
  stroke(255);
  strokeWeight(2);
  noFill();
}
void draw(){
  translate(width/2, height/2);
  theta+=360/20;
  float thetaRadian = theta/180*PI;  
  ellipse(100*cos(thetaRadian), 100*sin(thetaRadian), 250, 250);
}
void mousePressed(){
  save("myFlower.png");
}
