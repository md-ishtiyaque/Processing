class Obstacle{
  float locx, locy;
  float  velx, vely;
  Boolean alive;
  int multiplexer;
  int health;
  boolean obstacleBlast;
  Obstacle(){
    this.alive = true;
    locx = random(height / 18 - 10, width - height / 18 + 10);
    locy = random(-height);
    velx = 0;
    vely = height / 500;
    multiplexer = ceil(random(3));
    health = 7 * multiplexer;
  }
  void calculate(){
    locx += velx;
    locy += vely;
    if(locy > height){ alive = false; gameOver = true; }
    for(int i = 0; i < maxBullet; i++)
      if(abs(B[i].locx - this.locx) < height / 20 * multiplexer &&
      abs(B[i].locy - this.locy) < height / 40 * multiplexer&& B[i].alive){
        health--;
        score++;
        B[i].alive = false;
        if(health <= 0){ this.alive = false; obstacleBlast = true;}
      } 
    
  }
  void render(){
    if(obstacleBlast)
        image(blastImage, locx, locy,multiplexer * height / 10, multiplexer * height / 10);
    else
        image(obstacleImage, locx, locy,multiplexer * height / 10, multiplexer * height / 20);
    obstacleBlast = false;    
  }
  Boolean checkGameOver(){
    if(locy > height)
      return true;
    else{
     return false;
    }
  }
}
