float theta;
float radius = 400;
float speedMultiplier = 2;
void setup(){
  background(0);
  stroke(255);
  strokeWeight(2);
  size(600, 600);
}
void draw(){
  int i = 0;
  translate(width/2, height/2);
  colorMode(HSB, 360, 100, 100);
  fill(i*360/4, 100, 100);
  ellipse(0, 0, radius, radius);
  for(i=1;i<5;i++){
  translate((0.5*radius/pow(2, i))*cos(i*theta),(0.5*radius/pow(2, i))*sin(i*theta));
  fill(map(i, 0, 5, 0, 360), 100, 100);
  ellipse(0, 0, radius/pow(2, i), radius/pow(2, i));
  }
  theta += PI/180;
}
