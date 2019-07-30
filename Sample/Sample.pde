int z = -1000;
void setup(){
  background(0);
  stroke(255);
  size(500, 500, P3D);
}


void draw(){
  background(0);
  lights();
  translate(width/2, height/2, -300);
  drawTrain();
}

void drawTrain(){
  z += 10;
  if(z >= 500) { z = - 1000; }
  
  pushMatrix();
  translate(-300, 100, z);
  box(200);
  popMatrix();
  
  pushMatrix();
  translate(0, 100, z);
  box(200);
  popMatrix();
  
  pushMatrix();
  translate(300, 100, z);
  box(200);
  popMatrix();
}
