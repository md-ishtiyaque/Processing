float R = 125/2;
float r = 75/2;
float theta;
float x, y, d = 125/2;
void setup(){
  size(600, 600);
  background(0);
  frameRate(100);
  stroke(255);
  strokeWeight(2);
}
void draw(){
  translate(width/2, height/2);
  theta+=1;
  float thetaRadian = theta/180*PI;
  x = (R + r)*cos(thetaRadian) - d*cos((R + r)/r*thetaRadian);
  y = (R + r)*sin(thetaRadian) - d*sin((R + r)/r*thetaRadian);  
  point(x, y);
}
void mousePressed(){
  save("myFlower.png");
}
