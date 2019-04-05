class  Pipe
{
  int x, y,  speed;
  Pipe(int x)
  {
    this.x = x;
    y = floor(random(height-400));
    speed = 4;
  }
  
  
  void update()
  {
    x -= speed;
    if(x<-120)
    {
      x = width;
      y = floor(random(height-400));
      scoreCounter++;
    }  
  }
  
  
  void display()
  {
    imageMode(CORNER);
    image(pipeImg, x, 0, 120, y);  
    image(pipeImg, x, y+200, 120, height-y-200);
  }
  
  
  void checkCollision(){
    if(x<birdX + 60 && x>birdX - 60){
      if(birdY>y+180 || birdY<y+20){
        gameOver = true;
    }
   }
  }
}
