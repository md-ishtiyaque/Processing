float pointCount = 200;
float timesTable = 3;
float theta, diameter1 = 200, diameter2 = 400;
float x1, y1, x2, y2;
float speed = 0.01;
void setup(){
  background(0);
  size(600, 600);
  noFill();
  theta = TWO_PI/pointCount;
  
}

void draw(){ 
  background(0);
  stroke( timesTable*100%360, 100, 100);    
  translate(width/2, height/2);
  ellipse(0, 0, diameter1, diameter1);
  ellipse(0, 0, diameter2, diameter2);
  for(int i=0;i<pointCount;i++){    
  x1 = 0.5*diameter1*cos(theta*i);
  y1 = 0.5*diameter1*sin(theta*i);
  x2 = 0.5*diameter2*cos(theta*i*timesTable);
  y2 = 0.5*diameter2*sin(theta*i*timesTable);
  line(x1, y1, x2, y2);
  }
  timesTable += speed;
  
}
