int n = 0;
float theta;
float x1, y1, x2, y2;
void setup(){
  background(0);
  size(600, 600);
  stroke(255);
  strokeWeight(2);
  frameRate(10);
  textSize(100);
}
void draw(){
  background(0);
  translate(width/2, height/2+50);
  theta = TWO_PI/n;
  for(int i=0;i<n;i++){
    line(200*cos(theta*i), 200*sin(theta*i),200*cos(theta*(i+1)), 200*sin(theta*(i+1)));
  }
  n++;
  text(n-1, -20, -260); 
}
