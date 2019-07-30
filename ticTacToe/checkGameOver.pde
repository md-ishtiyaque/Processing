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
  
  //Checks if it was a draw.
  int emptyTileCount = 0;
  for(int i = 0; i < 3; i++)
    for(int j = 0; j < 3; j++)
      if(flag[i][j] == emptyTile)
        emptyTileCount++;
  if(emptyTileCount == 0){
    gameOverStatus = 1;
      text("DRAW", 160, 300);
      return;
  }
}
