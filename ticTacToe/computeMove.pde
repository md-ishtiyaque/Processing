void computeMove(){
  int count = 0;
  for(int i = 0; i < 3; i++)
    for(int j = 0; j < 3; j++)
      if(flag[i][j] == emptyTile)
        count++;
  if(count > 0){
    x = floor(random(0, 3));
    y = floor(random(0, 3));
    if(flag[x][y] != emptyTile)
      computeMove();
    else
      println(x + " " + y);
      flag[x][y] = AITile;
  }
}
