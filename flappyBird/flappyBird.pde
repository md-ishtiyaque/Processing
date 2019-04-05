import processing.sound.*;

SoundFile file;
PImage birdImg[] = new PImage[8];
PImage pipeImg, backgroundImg;
int birdX = 300, birdY = 300, scoreCounter;
float birdFrameCount, prevX, prevY;
int i;
boolean gameOver, firstTime = true;
Pipe[] p = new Pipe[3];


void setup(){
  fullScreen();
  frameRate(100);
  stroke(0);
  fill(0);
  textMode(CENTER);
  textSize(50);
  for(int i=0;i<8;i++){
    String imageString = "bird" + i + ".png";
    birdImg[i] = loadImage(imageString);
  }
  pipeImg = loadImage("pipe.png");
  backgroundImg = loadImage("background.png");  
  p[0] = new Pipe(width);
  p[1] = new Pipe(4*width/3);
  p[2] = new Pipe(5*width/3);
  file = new SoundFile(this, "music.mp3");
  file.loop();
  file.rate(1.2);
}


void draw(){
  if(!gameOver){
    renderBackground();
    renderBird();
    renderPipes();
    text("SCORE:" + scoreCounter, 20, 50);
  }
  if(gameOver){
    text("CRASHED!!", width/2-200, height/2);
    gameOver = false;
  }
}


void renderBird(){
  imageMode(CENTER);
  birdFrameCount = (birdFrameCount+0.5)%8;
  image(birdImg[(int)birdFrameCount], birdX, birdY, 150, 130);
  birdY+=3;
}


void renderPipes(){
  for(int i = 0; i < 3; i++){
    p[i].update();
    p[i].display();
    p[i].checkCollision();
  }
}


void renderBackground(){
  imageMode(CORNER);
  image(backgroundImg, i--, 0, width + width/2, height);
  if(i == -width/2){ i = 0; }
  if(birdX>width/2)   {birdX = width/2;    }
  if(birdX<50)        {birdX = 50;         }
  if(birdY>height-50) {birdY = height - 50;}
  if(birdY<50)        {birdY = 50;         }
}


void mouseDragged(){
  if(firstTime){ 
    prevX = mouseX;
    prevY = mouseY;
     firstTime = false;
  }
  birdY += 4 * (mouseY - prevY);
  birdX += 4 * (mouseX - prevX);
  prevX = mouseX;
  prevY = mouseY;
}

void mouseReleased(){
  firstTime = true;
}
