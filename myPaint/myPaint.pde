float prevX, prevY;
boolean firstTime = true;
float H, S, B;
float thickness = 1;
boolean colorSelector;


void setup(){
  fullScreen();
  H = S = B = 255;
  background(0);
  strokeWeight(thickness);
  strokeJoin(ROUND);
  stroke(H, S, B);
}


void draw(){
  /*fill(H, S, B);
  ellipse(width-50, 10, 8, 8);
  ellipse(width-50, 30, 8, 8);
  ellipse(width-50, 50, 8, 8);

  if(colorSelector)
    selectionScreen();*/
}


void mousePressed(){
  if(mouseX>width-60 && mouseY<60){
    colorSelector = true;
  }
}


void mouseDragged(){
  if(firstTime){ prevX = mouseX; prevY = mouseY; firstTime = false; }
  //point(mouseX, mouseY);
  line(mouseX, mouseY, prevX, prevY);
  prevX = mouseX;
  prevY = mouseY;
}

void mouseReleased(){
  firstTime = true;
}

void selectionScreen(){
  background(0);
  
}
