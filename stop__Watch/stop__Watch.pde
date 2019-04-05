int csec, sec, min, flag;
void setup(){
  size(800, 600);
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
  textSize(60);
  //rectMode(CENTER);
  fill(100);
  rect(50, 345, 190, 60, 7);
  fill(255);
  text("START", 50, 400);
  fill(100);
  rect(300, 345, 190, 60, 7);
  fill(255);
  text("PAUSE", 300, 400);
  fill(100);
  rect(550, 345, 190, 60, 7);
  fill(255);
  text("RESET", 550, 400);
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
  text(min, 220, 200);
  text(":", 300, 200);
  text(sec, 320, 200);
  text(":", 400, 200);
  text(csec, 420, 200);
}
void mousePressed(){
  flag = 1;
  if(mouseX>50&&mouseX<240 && mouseY>345&&mouseY<405){
      frameRate(100);
  }
  if(mouseX>300&&mouseX<490 && mouseY>345&&mouseY<405){
      flag = 0;
  }
  if(mouseX>550&&mouseX<740 && mouseY>345&&mouseY<405){
      csec = 0;
      flag =0;
      sec =0;
      min = 0;
  }
}
