float a=40, x=1.5*a, y=10+sin(PI/3)*a, i=0;
float theta, rowCount;
void setup(){
  size(600, 600);
  background(0);
  fill(255);
  frameRate(100);
  colorMode(HSB, 360, 100, 100);
  stroke(0, 100, 100);
}

void draw(){
  reset();
  hexagon();


}


void hexagon(){
  pushMatrix();
  translate(x, y);
  theta = TWO_PI/6;
  for(int i=0;i<6;i++){
    line(a*cos(theta*i), a*sin(theta*i),a*cos(theta*(i+1)), a*sin(theta*(i+1)));
  }
  x+=3*a;  
  popMatrix();
}


void reset(){
  if(x>width-10){
    y+=sin(PI/3)*a;
    if(rowCount++%2==0)
      x=3*a;
    else
      x= 1.5*a;
  }
  if(y>height-20){
    y=10+sin(PI/3)*a;
    strokeWeight(i+=2);
    stroke(map(i, 0, 70,0, 360), 100, 100); 
  }
}
