int squareLen = 80;
int[][] grid;
int i, j;
int x = squareLen/2;
int y = squareLen/2;
int up     = 1;
int right  = 2; 
int down   = 3;
int left   = 4;
int dir    = up;
int count;


void setup(){
  size(800, 800);
  frameRate(10000);
  noStroke();
  grid = new int[squareLen][squareLen];
  for(i=0;i<squareLen;i++){
    for(j=0;j<squareLen;j++){
      grid[i][j] = 255;
    }
  }
}


void draw(){
  println(count++);
  decideDirection();
  moveForward();
  displayGrid();
} 


void turnRight(){
  if(dir== left){ dir = up;}
  else dir++;
}


void turnLeft(){
  if(dir == up){ dir =left;}
  else dir--;
}


void moveForward(){
  if(dir == up)   { y--; }
  if(dir == right){ x++; }
  if(dir == down) { y++; }
  if(dir == left) { x--; }
}


void displayGrid(){ 
  for(i=0;i<squareLen;i++){
    for(j=0;j<squareLen;j++){
      fill(grid[i][j]);
      rect(i*width/squareLen, j*height/squareLen, width/squareLen, height/squareLen);
    }
  }
 fill(255, 0, 0);
 rect(x*width/squareLen, y*height/squareLen, width/squareLen, height/squareLen);
}


void decideDirection(){
  int state = grid[x][y];
  if(state == 255){
    grid[x][y] = 0;
    turnRight();   
  }
  if(state == 0){
    grid[x][y] = 255;
    turnLeft(); 
  }
}
