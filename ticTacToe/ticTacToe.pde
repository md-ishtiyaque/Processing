int flag[][];
int x, y;
int emptyTile = 0, AITile = 2, playerTile = 1;
int gameOverStatus;


void setup(){
  size(600, 600);
  background(0);
  stroke(255);
  flag = new int[3][3];
}


void draw(){
  drawBoard();
}


void mousePressed(){
  if(gameOverStatus == 1){
    noLoop();return; }
  int x_ = floor(mouseX / (width / 3));
  int y_ = floor(mouseY / (height / 3));
  if(flag[x_][y_] == emptyTile){
    flag[x_][y_] = playerTile;
    checkGameOver();
  }
  else{ 
    print("Invalid move\n");
    return;
  }
  textMode(CENTER);
  textSize(100);
  text("O", (x_+0.3)*200, (y_+0.7)*200);
  computeMove();
  text("X", (x+0.3)*200, (y+0.7)*200); 
  checkGameOver();
}
