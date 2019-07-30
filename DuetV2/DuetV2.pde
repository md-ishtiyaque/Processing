float rbX, rbY, bbX, bbY;
float angle;
float ballDiameter;
boolean isMousePressed = false;
boolean gameOver = false;
int blockCount = 4;
int score;
Block[] b = new Block[blockCount];

void setup(){
  size(displayWidth, displayHeight);
  orientation(PORTRAIT);
  for(int i = 0; i < blockCount; i++)
    b[i] = new Block(i);
}


void draw(){
  drawBalls();
  for(int i = 0; i < blockCount; i++)
    b[i].Render();
  if(isMousePressed){
    if(mouseX < width/ 2)
      angle -= 5.5;
    else 
      angle += 5.5;
  }
  textSize(100); 
  fill(255);
  text(score, 20, 100);  
  text("difficulty:" + min((int)(frameCount / 200) , 100) + "%" , 400, 100);
}


void drawBalls()
{
  float ringX = width / 2;
  float ringY = 3 * height / 4;
  ballDiameter = 80;
  float ringRadius = 320;
  background(0);
  stroke(200);
  strokeWeight(2);
  noFill();
  ellipse(ringX, ringY, 2 * ringRadius, 2 * ringRadius);
  noStroke();
  rbX = ringX + ringRadius * cos(radians(angle));
  rbY = ringY + ringRadius * sin(radians(angle));
  bbX = ringX + ringRadius * cos(radians(angle)-PI);
  bbY = ringY + ringRadius * sin(radians(angle)-PI);
  fill(255, 0, 0);
  ellipse(rbX, rbY, ballDiameter, ballDiameter);
  fill(0, 200, 255);
  ellipse(bbX, bbY, ballDiameter, ballDiameter);
}  


void mousePressed(){
  isMousePressed = true;
}
void mouseReleased(){
  isMousePressed = false;
}
