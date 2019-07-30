int BallCount = 10;
boolean flag[][] = new boolean[BallCount][BallCount];
Ball b[] = new Ball[BallCount];
void setup(){
  size(600, 600);
  fill(255);
  for(int i = 0; i < BallCount; i ++)
    b[i] = new Ball();  
  for(int i = 0; i < BallCount; i ++)
    for(int j = 0; j < BallCount; j ++)
      flag[i][j] = false;
}


void draw(){
  background(0);
  for(int i = 0; i < BallCount; i ++){
    b[i].compute();
    b[i].render();
  }
  checkCollision();
}


void checkCollision(){
  for(int i = 0; i < BallCount; i ++){
    for(int j = 0; j < BallCount && i != j && !flag[i][j]; j ++){
      if((abs(b[i].x - b[j].x) < b[i].radius + b[j].radius) &&(abs(b[i].y - b[j].y )< b[i].radius + b[j].radius)){
        fill(255);
        flag[i][j] = true;
        float b1velx = b[i].velx;
        float b1vely = b[i].vely;
        float b2velx = b[j].velx;
        float b2vely = b[j].vely;
        b[i].velx = (b1velx * (b[i].radius - b[j].radius) + 2 * b[j].radius * b2velx) / ( b[i].radius + b[j].radius);
        b[i].vely = (b1vely * (b[i].radius - b[j].radius) + 2 * b[j].radius * b2vely) / ( b[i].radius + b[j].radius);
        b[j].velx = (b2velx * (b[j].radius - b[i].radius) + 2 * b[i].radius * b1velx) / ( b[i].radius + b[j].radius);
        b[j].vely = (b2vely * (b[j].radius - b[i].radius) + 2 * b[i].radius * b1vely) / ( b[i].radius + b[j].radius);
      }
      else
        flag[i][j] = false;
    }
  }
}
