int csec, sec, min, flag;
void setup(){
  size(displayWidth, displayHeight);
  background(0);
  stroke(255);
  frameRate(100);
  displayOptions();
}
void draw(){
  if(flag == 0){ csec--; }
  background(0);
  displayOptions();
  displayTime();

}
void displayOptions(){
  textSize(100);
  fill(100);
  rect(width/3-25, 4*height/10-100, width/3, height/15, 20);
  fill(255);
  text("START", width/3, 4*height/10);
  fill(100);
  rect(width/3-25, 6*height/10-100, width/3, height/15, 20);
  fill(255);
  text("PAUSE", width/3, 6*height/10);
  fill(100);
  rect(width/3-25, 8*height/10-100, width/3, height/15, 20);
  fill(255);
  text("RESET", width/3, 8*height/10);
}
void displayTime(){
  csec++;
  if(csec>=99){
    sec++;
    csec = 0;
  }
  if(sec>=59){
    min++;
    sec=0;
  }
  textSize(160);
  fill(HSB, 360, 100, 100);
  text(min, 220, height/5);
  text(":", 400, height/5);
  text(sec, 450, height/5);
  text(":", 620, height/5);
  text(csec, 670, height/5);
}
void mousePressed(){
  flag = 1;
  if(mouseX>width/3-25&&mouseX<width/3-25+width/3 && mouseY>4*height/10-100&&mouseY<4*height/10-100+height/15){
      frameRate(100);
  }
  if(mouseX>width/3-25&&mouseX<width/3-25+width/3 && mouseY>6*height/10-100&&mouseY<6*height/10-100+height/15){
      flag = 0;
  }
  if(mouseX>width/3-25&&mouseX<width/3-25+width/3 && mouseY>8*height/10-100&&mouseY<8*height/10-100+height/15){
      csec = 0;
      flag =0;
      sec =0;
      min = 0;
  }
}
