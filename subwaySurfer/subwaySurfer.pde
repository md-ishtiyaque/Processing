int z = -1000;
PImage trainImage;
PShape train;
void setup(){
  size(500, 500, P3D);
  trainImage = loadImage("Train.png");
  train = createShape(BOX, 300);
  train.setTexture(trainImage);
  
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
  shape(train);
  popMatrix();
  /*
  pushMatrix();
  translate(0, 100, z);
  shape(train);
  popMatrix();
  
  pushMatrix();
  translate(300, 100, z);
  shape(train);
  popMatrix();
  */
}
