int h = 400;
void setup(){
  background(0);
  size(800, 800);
  stroke(255);
  noFill();
}


void draw(){
  translate(width/2, height/2);
  ellipse(0, 0, h, h);
  circle(h);
}


void circle(int h){
  if(h>=100){
    pushMatrix();
    translate(-h/4, 0);
    ellipse(0, 0, h/2, h/2);
    circle(h/2);
    popMatrix();
    
    
    pushMatrix();
    translate(h/4, 0);
    ellipse(0, 0, h/2, h/2);
    circle(h/2);
    popMatrix();
    
    
    pushMatrix();
    translate(0, -h/4);
    ellipse(0, 0, h/2, h/2);
    circle(h/2);
    popMatrix();
    
    
    pushMatrix();
    translate(0, h/4);
    ellipse(0, 0, h/2, h/2);
    circle(h/2);
    popMatrix();
  }
}
