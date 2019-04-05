int h = 200;
void setup(){
  background(0);
  size(800, 800);
  stroke(255);
  noFill();
}


void draw(){
  translate(width/2, height/2);
  ellipse(0, 0, h, h);
  circleUp(h);
  circleRight(h);
  circleDown(h);
  circleLeft(h);
}


void circleUp(int h){
  if(h>=100){
    pushMatrix();
    translate(0, -h/2);
    ellipse(0, 0, h/2, h/2);
    circleUp(h/2);
    popMatrix();
  }
}
void circleRight(int h){
  if(h>=100){ 
    pushMatrix();
    translate(h/2, 0);
    ellipse(0, 0, h/2, h/2);
    circleRight(h/2);
    popMatrix();
  }
}
void circleDown(int h){
  if(h>=100){
    pushMatrix();
    translate(0, h/2);
    ellipse(0, 0, h/2, h/2);
    circleDown(h/2);
    popMatrix();
  }
}
void circleLeft(int h){
  if(h>=100){
    pushMatrix();
    translate(-h/2, 0);
    ellipse(0, 0, h/2, h/2);
    circleLeft(h/2);
    popMatrix();
  }
}
