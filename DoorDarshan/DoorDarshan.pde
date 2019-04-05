float i, theta = TWO_PI/360;
int radius=200;
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
  translate(width/2, height/2);
  for(i=1;i<91;i+=1){
    stroke(map(i, 1, 90, 180, 360), 100, 100);
    line(radius*cos(radians(180-i)), radius*sin(radians(180-i)), radius*cos(radians(i)), radius*sin(radians(i)));
  }
  translate(0, 7);
  for(i=-1;i>-91;i-=1){
    stroke(map(i, -1, -90, 180, 0), 100, 100);
    line(radius*cos(radians(180-i)), radius*sin(radians(180-i)), radius*cos(radians(i)), radius*sin(radians(i)));
  }
  theta += TWO_PI/360;
}
