PImage shooterImage, backgroundImage, obstacleImage, blastImage, bulletImage;
int maxObstacle = 10;
int maxBullet = 250;
int shooterX = width/2;
int bulletCount;
int  score;
Boolean gameOver;
Obstacle[] O = new Obstacle[maxObstacle];
Bullet[] B = new Bullet[maxBullet];
void setup(){
  fill(0);
  background(0);
  size(displayWidth, displayHeight);
  textSize(100);
  imageMode(CENTER);
  shooterImage = loadImage("shooterImg.png");
  //backgroundImage = loadImage("background.png");
  obstacleImage = loadImage("obstacle.png");
  blastImage = loadImage("blast.png");
  bulletImage = loadImage("bulletImage.png");
  
  for(int i =0; i < maxObstacle; i++)
    O[i] = new Obstacle();
    
  for(int i =0; i < maxBullet; i++)
    B[i] = new Bullet(0, false);
  
  gameOver = false;
  score = 0;
  shooterX = width/2;
}


void draw(){
  background(255);
  image(backgroundImage, width/2, height/2, 1.6 * height, height);
  image(shooterImage, shooterX, height - height / 16, height / 10, height / 10);
  
  //Loop over obstacles
  for(int i = 0; i < maxObstacle; i++){
    if(O[i].alive){
      O[i].calculate();
      O[i].render();
    }
    else{
      O[i] = new Obstacle(); 
    }
  }
  
  //Loop over bullets
  for(int i = 0; i < maxBullet; i++){
    if(B[i].alive){
      B[i].calculate();
      B[i].render();
    }
  }
  if(bulletCount % 3 == 0){
    B[bulletCount] = new Bullet(shooterX, true);
  }
  bulletCount++;
  bulletCount %= maxBullet;  
  text(nf(score, 5), 0 , 80);
  if(gameOver){
      setup();
  }
}


void mouseDragged(){
  shooterX = mouseX;
  if(shooterX > width - height / 18) shooterX = width -height / 18;
  if(shooterX < height / 18) shooterX = height / 18; 
}
