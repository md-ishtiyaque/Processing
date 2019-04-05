int rows = 4, cols = 4;
Block b[][] = new Block[rows][cols];
int rowWidth, colHeight;
boolean gameOver;
int direction = -1;


void setup(){
  size(400, 400);
  background(200);
  stroke(150);
  fill(255);
  rowWidth = width/rows;
  colHeight = height/cols;
  for(int x=0;x<4;x++){
    for(int y=0;y<4;y++){
      b[x][y] = new Block(x*rowWidth,  y*colHeight);
    }
  }
  spawn();
}


void draw(){
  if(gameOver){
    noLoop();
  }
  background(0);
  for(int x=0;x<4;x++){
    for(int y=0;y<4;y++){
      b[x][y].display();
    }
  }
}


void spawn(){
  int count = 0;
  for(int x=0;x<4;x++){
    for(int y=0;y<4;y++){
      if(b[x][y].contains){
        count++;
      }
    }
  }
  if(count >= rows*cols){
    gameOver = true;
    return;
  }
  PVector spawnLocation = new PVector(floor(random(4)), floor(random(4)));
  if (b[(int)spawnLocation.x][(int)spawnLocation.y].contains == false){
    b[(int)spawnLocation.x][(int)spawnLocation.y].contains = true;
    b[(int)spawnLocation.x][(int)spawnLocation.y].value = 2;
  }
  else spawn();
}


void calculate(){
  if(direction == 0){
    for(int x = 0; x < rows; x++){
      for(int y = 0; y < cols; y++){
         for(int j =1; y + j < cols; j++){
           if(b[x][y].value == b[x][y+j].value){
             b[x][y].value += b[x][y+j].value;
             b[x][y+j].contains = false;
             
           }
         }
      }
    }
  }
}


void keyPressed(){
  if(keyCode == UP) direction = 0;
  if(keyCode == RIGHT) direction = 1;
  if(keyCode == DOWN) direction = 2;
  if(keyCode == LEFT) direction = 3;
  calculate();
  spawn();
}
