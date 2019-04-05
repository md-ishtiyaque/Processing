int n = 6;
int a[][] =
{  {0, 3, 99, 99, 6, 5},
   {3, 0, 1, 99, 99, 4},
   {99, 1, 0, 6, 99, 4},
   {99, 99, 6, 0, 8, 5},
   {6, 99, 99, 8, 0, 2},
   {5, 4, 4, 5, 2, 0}
};
/*{  
   {0, 1, 4, 5},
   {1, 0, 99, 2},
   {4, 99, 0, 3},
   {5, 2, 3, 0 }
};*/
int[] parent = new int[n];
int count;
int[] vArr =  new int[n];
int[] uArr =  new int[n];
int[] aArr = new int[n];
int count2;

void setup(){
  fullScreen();
  background(0);
  frameRate(1);
  int u, v, min, k, i, j, sum;
  u = v = k = sum = 0;
  while(k < n - 1){
    min = 99;
    for(i = 0; i < n; i++)
      for(j = 0; j < n; j++)
        if(a[i][j] < min && i != j){
          min = a[i][j];
          u = i;
          v = j;
        }
    i = find(u);
    j = find(v);
    if(i != j){
      union(i, j);
      println("(" + u + "," + v + ")" + "=" + a[i][j]);
      saveValues(u, v);
      sum += a[i][j];
    }
    k++;
    a[u][v] = a[v][u] = 99;
  }
    println("min cost tree is:" + sum);
  drawPoints();

}

int find(int m){
  int p = m;
  while(parent[p] != 0)
    p = parent[p];
  return p;
}


void union(int i, int j){
  if(i < j)
    parent[i] = j;
  else
    parent[j] = i;
}


void saveValues(int u_, int v_){
  uArr[count] = u_;
  vArr[count] = v_;
  aArr[count] = a[u_][v_];
  count++;
}

void draw(){
  drawPoints();
  drawConnections();
}


void drawPoints(){
  pushMatrix();
  stroke(255);
  strokeWeight(2);
  noFill();
  textSize(100);
  translate(width/2, height/2);
  float theta = TWO_PI/n;
  for(int i = 0; i < n; i++){
    ellipse(300 * cos(PI - i * theta), 300 * sin(PI - i * theta), 100, 100);
    text((i+1), 300 * cos(PI - i * theta) - 30, 300 * sin(PI - i * theta) + 30);
  }
  popMatrix();
}

void drawConnections(){
  pushMatrix();
  stroke(255);
  strokeWeight(2);
  int u = uArr[count2];
  int v = vArr[count2];
  float theta = TWO_PI/n;
  translate(width/2, height/2);
  line(300 * cos(PI - u * theta), 300 * sin(PI - u * theta), 300 * cos(PI - v * theta), 300 * sin(PI - v * theta));
  strokeWeight(5);
  text(aArr[count2], (300 * cos(PI - u * theta) + 300 * cos(PI - v * theta))/2,
  (300 * sin(PI - u * theta) + 300 * sin(PI - v * theta))/2 );
  count2 = (count2 + 1) % count;
  popMatrix();
}
