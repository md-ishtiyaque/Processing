int[][] grid, count;
int i, j, squareLen, magFactor=4;
void setup()
{
  size(600, 600);background(255);frameRate(5);rectMode(CENTER);
  squareLen = width/magFactor;
  grid = new int[squareLen][squareLen];
  count = new int[squareLen][squareLen];  
  grid[width/(2*magFactor)][height/(2*magFactor)]=1;
}
void draw()
{
  calculate();
  display();
}


void calculate()
{
 for(i=1;i<squareLen-1;i++){for(j=1;j<squareLen-1;j++)
 {
      if(grid[i][j] == 0){ count[i][j]=0;
        for(int x=i-1;x<=i+1;x++){for(int y=j-1;y<=j+1;y++){
            if(grid[x][y]==1)count[i][j]++; }}}}
 }
}


void display()
{
  translate(width/2, -height/4);rotate(PI/4);
  for(i=0;i<squareLen;i++){for(j=0;j<squareLen;j++){if(count[i][j] == 1)
  {
        stroke(0); fill(0);grid[i][j]=1;
        rect(i*magFactor, j*magFactor, 0.75*magFactor, 0.75*magFactor); }}
  }    
}
