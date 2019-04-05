int h = 200;
void setup(){
  background(0);
  size(800, 800);
  stroke(255);
  fill(255);
  rectMode(CENTER);
}


void draw(){
  translate(width/2, height/2);
  rect(0, 0, h, h);
  rectangle(h);
}


void rectangle(int h){
  if(h>=100){
    pushMatrix();
    translate(-3*h/4, -3*h/4);
    rect(0, 0, h/2, h/2);
    rectangle(h/2);
    popMatrix();
    
    
    pushMatrix();
    translate(3*h/4, -3*h/4);
    rect(0, 0, h/2, h/2);
    rectangle(h/2);
    popMatrix();
    
    
    pushMatrix();
    translate(-3*h/4, 3*h/4);
    rect(0, 0, h/2, h/2);
    rectangle(h/2);
    popMatrix();
    
    
    pushMatrix();
    translate(3*h/4, 3*h/4);
    rect(0, 0, h/2, h/2);
    rectangle(h/2);
    popMatrix();
  }
}
