float pointCount = 390/2;
float timesTable;
float theta, diameter;
float x1, y1, x2, y2;
float speed = 0.005;
boolean play = true, forward = true;
float diameterController;
float pointCountController;
float lineThickness;


void setup(){
  size(1080, 2160);
  theta = TWO_PI/pointCount;
  colorMode(HSB, 360, 100, 100);
  diameter = (200+width-20)/2-20;
  diameterController = map(diameter, 200, width-20, width/10, 9*width/10);
  pointCountController = map(pointCount, 10, 400, width/10, 9*width/10);
  lineThickness = 3.9/2;
}


void draw(){
 renderFigure();
 renderControls();
}
 
 
void mousePressed(){
  if(mouseY>height/2+30 && mouseY<height/2+150){
    if(mouseX>20 && mouseX<width/3-20)
      speed/=2;
    if(mouseX>width/3+20 && mouseX<2*width/3-20)
      play = !play;
    if(mouseX>2*width/3+20 && mouseX<width-20)
      speed*=2;
  }
  if(mouseY>height/2+200 && mouseY< height/2+200+150){
    if(mouseX>20 && mouseX<width/2-20){
      timesTable = 0;
      speed = 0.005;
    }
    if(mouseX>width/2+20 && mouseX<width-20){ 
      if(forward == true) speed = -abs(speed);
      else speed = abs(speed);
      forward = !forward;
     }
  }
}


void mouseDragged(){
  if(mouseX>width/10 && mouseX<9*width/10){
    if(mouseY>3*height/4-100 && mouseY<3*height/4+60-10){
      diameterController = mouseX;
      diameter = map(diameterController, width/10, 9*width/10, 200, width-20);
    }
    if(mouseY>height-290-80-60 && mouseY<height-290-80+90){
      pointCountController = mouseX;
      pointCount = map(pointCountController, width/10, 9*width/10, 10, 400);
      theta = TWO_PI/pointCount;
    }
    if(mouseY>height-60-80-60 && mouseY<height-60-80+90){
      lineThickness = map(mouseX, width/10, 9*width/10, 0.1, 4);
    }
  }
} 
 
 
void renderFigure(){
  background(0);
  noFill();
  strokeWeight(lineThickness);
  stroke( abs(timesTable*100%360), 100, 100);  
  translate(width/2, width/2);
  ellipse(0, 0, diameter, diameter);
  for(int i=0;i<pointCount;i++){    
    x1 = 0.5*diameter*cos(theta*i);
    y1 = 0.5*diameter*sin(theta*i);
    x2 = 0.5*diameter*cos(theta*i*timesTable);
    y2 = 0.5*diameter*sin(theta*i*timesTable);
      line(x1, y1, x2, y2);
  }
  if(play == true){
    timesTable += speed;
  }
}
 
void renderControls(){
  translate(-width/2, -width/2);
  strokeWeight(2);
  fill(100);
  //play slower
  rect(20, height/2 + 30, width/3-20, 150, 20);
  //play/pause
  rect(width/3+20, height/2+30, width/3-20, 150, 20);
  //play faster
  rect(2*width/3+20, height/2+30, width/3-20, 150, 20);
  //reset
  rect(20, height/2+200, width/2-20, 150, 20);
  // forward/backward
  rect(width/2+20, height/2+200, width/2-20, 150, 20);
  //diamter
  rect(width/10, 3*height/4-40, 8*width/10, 30, 20);
  rectMode(CENTER);
  rect(diameterController, 3*height/4-40+15, 40, 80, 20);
  rectMode(CORNER);
  //point density
  rect(width/10, height-290-80, 8*width/10, 30, 20);
  rectMode(CENTER);
  rect(pointCountController, height-290-80+15, 40, 80, 20);
  rectMode(CORNER);
  //line thickness
  rect(width/10, height-60-80, 8*width/10, 30, 20);
  rectMode(CENTER);
  rect(map(lineThickness, 0.1, 4, width/10, 9*width/10), height-60-80+15, 40, 80, 20);
  rectMode(CORNER);
  
  
  fill(255);
  textSize(80);
  //play slower
  text("SLOW", 20+60, height/2 +30 +100);
  //play or pause
  if(play == false){ text("PLAY", width/3+20+60, height/2+30+100); }
  else            { text("PAUSE", width/3+20+50, height/2+30+100); }
  //play faster
  text("FAST", 2*width/3+20+70, height/2+30+100);
  //reset
  text("RESET", 20+130, height/2+200+100);
  //forward/backward
  if(forward == true){ text("BACKWARD", width/2+20+60, height/2+200+100); }
  else                { text("FORWARD", width/2+20+80, height/2+200+100); }
  //diameter
  text("DIAMETER", 330, 3*height/4-90);
  //Line density
  text("LINE DENSITY", 260, height-440);
  //Line thickness
  text("LINE THICKNESS", 220, height-230);
}
