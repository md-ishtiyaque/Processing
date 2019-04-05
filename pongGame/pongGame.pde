int x1 = 20;
int y1 = 400/2;
int x2 = 600-20;
int y2 = 400/2;
int ballx = (int)random(0, width) + 25;
int bally = (int)random(0, height) + 25;
int xdir = 1;
int ydir = 1;
int controlSpeed = 8;
void setup(){
  size(600, 400);
  background(0);
  stroke(255);
  rectMode(CENTER);
  frameRate(100);
}
void draw(){
  displayRectangles();
  checkBoundary();
  updateBallLoc();
  displayBall();
}
void keyPressed(){
  if(key == 'z'){
   y1 += controlSpeed/2; 
   displayRectangles();   
   y1 += controlSpeed/2;  
  }
  if(key == 'w'){
   y1 -= controlSpeed/2; 
   displayRectangles();
   y1 -= controlSpeed/2; 
   
  }
  if(key == '7'){
   y2 -= controlSpeed/2; 
   displayRectangles();
   y2 -= controlSpeed/2; 
  
  }
  if(key == '1'){
   y2 += controlSpeed/2;    
   displayRectangles();
   y2 += controlSpeed/2;   
  }
  if(y1 <= 35){ y1 += controlSpeed; }
  if(y1 >= height-35){ y1 -= controlSpeed; }
  if(y2 <= 35){ y2 += controlSpeed; }
  if(y2 >= height-35){ y2 -= controlSpeed; }
}


void displayRectangles(){
  background(0);
  strokeWeight(1);
  rect(x1, y1, 7, 80);
  rect(x2, y2, 7, 80);
}


void checkBoundary(){
  if(bally >= height-15 || bally <= 15){
    ydir *= -1;
  }
  if(ballx >= width-39){
      if(bally>y2-35 && bally<y2+35){
        xdir = -1;
      }
  }
  if(ballx <= 39){
      if(bally>y1-35 && bally<y1+35){
        xdir = 1;
      }
  }
}
void displayBall(){
  ellipse(ballx, bally, 30, 30);
}

void updateBallLoc(){
  ballx+=xdir;
  bally+=ydir;
}
