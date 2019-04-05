float pointCount = 200;
float timesTable = 0;
float theta, diameter;
float x1, y1, x2, y2;
float speed = 0.005;
void setup(){
  size(displayWidth, displayHeight);
  stroke(255);
  noFill();
  theta = TWO_PI/pointCount;
  frameRate(100);
  strokeWeight(1);
  colorMode(HSB, 360, 100, 100);
  diameter = width-50;
}

 void draw(){
  background(0);
  stroke( timesTable*100%360, 100, 100);  
  translate(width/2, height/2);
  //ellipse(0, 0, diameter, diameter);
  for(int i=0;i<pointCount;i++){    
  x1 = 0.5*diameter*cos(theta*i);
  y1 = 0.5*diameter*sin(theta*i);
  x2 = 0.5*diameter*cos(theta*i*timesTable);
  y2 = 0.5*diameter*sin(theta*i*timesTable);
  line(x1, y1, x2, y2);
  }
  timesTable += speed;
 }
