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





void drawBoard(){
  line(width/3, 0, width/3, height);
  line(2*width/3, 0, 2*width/3, height);
  line(0, height/3, width, height/3);
  line(0, 2*height/3, width, 2*height/3);
}





void mousePressed(){
  if(gameOverStatus == 1){
    noLoop();return; }
  int x_ = floor(mouseX/200);
  int y_ = floor(mouseY/200);
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

  
  
  
  
void computeMove(){
  x = -1; y = -1;
  //NOTE: Commments are from the AI's perspective.
  //Checks if it's p0ssible to win by completing a row.
  for(int j=0;j<3;j++){
    int count = 0;
    for(int i=0;i<3;i++){ 
      if(flag[j][i] == AITile){
        count++;
      }
      if(count==2){
        for(i=0;i<3;i++){
          if(flag[j][i] == emptyTile){
            x = j;y = i;flag[j][i] = AITile;
          }
        }
      }
    }
  }
  //If compution is over it returns the control back down the stack.
  if(x != -1 && y != -1){
    return;
  }
  
  
  //Checks if its possible to win completing a column.
  for(int i=0;i<3;i++){
    int count = 0;
    for(int j=0;j<3;j++){ 
      if(flag[j][i] == AITile){
        count++;
      }
      if(count==2){
        for(j=0;j<3;j++){
          if(flag[j][i] == emptyTile){
            x = j;y = i;flag[j][i] = AITile;
          }
        }
      }
    }
  }
  //If compution is over it returns the control back down the stack.
  if(x != -1 && y != -1){
    return;
  }
  
  
  int diagCount;
  //Checks if it is possible to win by completing a left to right diagonal.
  diagCount = 0;
  for(int i=0;i<3;i++){
    if(flag[i][i] == AITile)
      diagCount++;
    if(diagCount == AITile){
      for(i=0;i<3;i++){
        if(flag[i][i] == emptyTile){
          x = y = i; flag[i][i] = AITile;
        }
      }
    }
  }
  //If compution is over it returns the control back down the stack.
  if(x != -1 && y != -1){
    return;
  }
  //Checks if it is possible to win by completing a right to left diagonal.  
  diagCount = 0;
  for(int i=0;i<3;i++){
    if(flag[i][2-i] == AITile)
      diagCount++;
    if(diagCount == AITile){
      for(i=0;i<3;i++){
        if(flag[i][2-i] == emptyTile){
          x = y = i; flag[i][i] = AITile;
        }
      }
    }
  }
  //If compution is over it returns the control back down the stack.
  if(x != -1 && y != -1){
    return;
  }
  
  
  //Checks if opponent is gonna win by completing a row.
  for(int j=0;j<3;j++){
    int count = 0;
    for(int i=0;i<3;i++){ 
      if(flag[j][i] == playerTile){
        count++;
      }
      if(count==2){
        for(i=0;i<3;i++){
          if(flag[j][i] == emptyTile){
            x = j;y = i;flag[j][i] = AITile;
          }
        }
      }
    }
  }
  //If compution is over it returns the control back down the stack.
  if(x != -1 && y != -1){
    return;
  }
  
  
  //Checks if opponent is gonna win completing a column.
  for(int i=0;i<3;i++){
    int count = 0;
    for(int j=0;j<3;j++){ 
      if(flag[j][i] == playerTile){
        count++;
      }
      if(count==2){
        for(j=0;j<3;j++){
          if(flag[j][i] == emptyTile){
            x = j;y = i;flag[j][i] = AITile;
          }
        }
      }
    }
  }
  //If compution is over it returns the control back down the stack.
  if(x != -1 && y != -1){
    return;
  }
  
  
  //Checks if opponent is gonna win by completing a left to right diagonal.
  diagCount = 0;
  for(int i=0;i<3;i++){
    if(flag[i][i] == playerTile)
      diagCount++;
    if(diagCount == AITile){
      for(i=0;i<3;i++){
        if(flag[i][i] == emptyTile){
          x = y = i; flag[i][i] = AITile;
        }
      }
    }
  }
  //If compution is over it returns the control back down the stack.
  if(x != -1 && y != -1){
    return;
  }
  //Checks opponent is gonna win by completing a right to left diagonal.  
  diagCount = 0;
  for(int i=0;i<3;i++){
    if(flag[i][2-i] == playerTile)
      diagCount++;
    if(diagCount == AITile){
      for(i=0;i<3;i++){
        if(flag[i][2-i] == emptyTile){
          x = y = i; flag[i][i] = AITile;
        }
      }
    }
  }
  //If compution is over it returns the control back down the stack.
  if(x != -1 && y != -1){
    return;
  }
  
  
  //FilledNodes is used to check if there is any space left on the board.
  int filledNodes = 0;
  for(int i=0;i<3;i++){ 
    for(int j=0;j<3;j++){
      if(flag[i][j] != 0)
          filledNodes++;
    }
  }
  
  //If none of the criterias are met then a random spot is selected on the board.
  randomCase(filledNodes);
  flag[x][y] = AITile;  
  
}





void randomCase(int f){
  if(f>8){ 
  if(gameOverStatus != 1)
    text("IT,S DRAW", 80, 300);
    return;
  }
  x = floor(random(0, 2.99));
  y = floor(random(0, 2.99));
  if(flag[x][y] != 0){
    randomCase(f);//recurssion is used to make sure that the assign x and y values are valid
  }
}





void checkGameOver(){
  int count = 0, diagCount = 0;
  //Comments are from the user's perspective.
  //Checks if you won by completing a row.
  for(int i=0;i<3;i++){ 
    count = 0;
    for(int j=0;j<3;j++){
      if(flag[i][j] == playerTile)
        count++;
        if(count == 3){
          gameOverStatus = 1;
          text("YOU WON", 80, 300);
          return;
        }
    }
  }
  
  
  
  //Checks if you won by completing a column.
  for(int j=0;j<3;j++){
    count = 0;   
    for(int i=0;i<3;i++){ 
      if(flag[i][j] == playerTile)
        count++;
        if(count == 3){
            gameOverStatus = 1;
          text("YOU WON", 80, 300);
          return;
        }
    }
  }
 
 
  //Checks you won by completing a left to right diagonal.
  diagCount = 0;
  for(int i=0;i<3;i++){
    if(flag[i][i] == playerTile)
      diagCount++;
    if(diagCount == 3){
      gameOverStatus = 1;
          text("YOU WON", 80, 300);
          return;
    }
  }
  
  //Checks you won by completing a right to left  diagonal.
  diagCount = 0;
  for(int i=0;i<3;i++){
    if(flag[i][2-i] == playerTile)
      diagCount++;
    if(diagCount == 3){
      gameOverStatus = 1;
      text("YOU WON", 80, 300);
      return;
    }
  }
 
 //Checks if your opponent won by completing a row.
  for(int i=0;i<3;i++){ 
    count = 0;
    for(int j=0;j<3;j++){
      if(flag[i][j] == AITile)
        count++;
        if(count == 3){
          gameOverStatus = 1;
          text("YOU LOSE", 80, 300);
          return;
        }
    }
  }
    
  
  //Checks if your opponent won by completing a column.
  for(int j=0;j<3;j++){
    count = 0;   
    for(int i=0;i<3;i++){ 
      if(flag[i][j] == AITile)
        count++;
        if(count == 3){
          gameOverStatus = 1;
          text("YOU LOSE", 80, 300);
          return;
        }
    }
  }
  
  //Checks your opponent won by completing a left to right diagonal.
  diagCount = 0;
  for(int i=0;i<3;i++){
    if(flag[i][i] == AITile)
      diagCount++;
    if(diagCount == 3){
      gameOverStatus = 1;
      text("YOU LOSE", 80, 300); 
      return;
    }
  }
  
  //Checks your opponent won by completing a right to left diagonal.
  diagCount = 0;
  for(int i=0;i<3;i++){
    if(flag[i][2-i] == AITile)
      diagCount++;
    if(diagCount == 3){
      gameOverStatus = 1;
      text("YOU LOSE", 80, 300);
      return;
    }
  }  
}
