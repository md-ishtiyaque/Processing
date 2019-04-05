PShape cube;
float count, i;
float prevX, prevY;
float X, Y;
boolean firstTime = true;
void setup(){
  fullScreen(P3D);
  cube = createShape(BOX, 300);
  colorMode(HSB, 360, 100, 100);
}


void draw(){
  count+=PI/180;
  background(0);
  //i+=1;
  pointLight(72*0, 100, 100, width/2, 0, 0);
  pointLight(72*1, 100, 100, width, height/2, 0);
  pointLight(72*2, 100, 100, width/2, height, 0);
  pointLight(72*3, 100, 100, 0, height/2, 0);
  pointLight(72*4, 100, 100, width/2, height/2, 300);

  translate(width/2, height/2);
  rotateX(X+=0.02);
  rotateY(Y+=0.02);
  ambientLight(0, 0, 30);
  shape(cube);
}


void mouseDragged(){
  if(firstTime){ 
    prevX = mouseX;
    prevY = mouseY;
     firstTime = false;
  }
  Y +=  (mouseY - prevY)/100;
  X +=  (mouseX - prevX)/100;
  prevX = mouseX;
  prevY = mouseY;
}

void mouseReleased(){
  firstTime = true;
}
