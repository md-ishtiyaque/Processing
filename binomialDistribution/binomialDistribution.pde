float colSize;
int colCount = 100, mid;
float[] a;
float SD;

void setup(){
  fullScreen();
  noStroke();
  fill(255);
  frameRate(1000);
  colSize = width/colCount;
  a = new float[(int)colCount];
  SD = 0.5;
}


void draw(){
  background(0);
  mid = colCount/2;
  for(int i = 0; i < mid; i++){
    float randVal = random(1);
    if(randVal>1-SD)mid++;
    if(randVal<SD) mid--;
  }
  a[mid]+=10;
  for(int i = 0; i < colCount; i++)
    rect(i * colSize, 3 * height / 4, colSize, -a[i]);
  renderControlls();  
}


void renderControlls(){
  rect(width / 10, 4.5 * height / 5, 8 * width / 10, 30, 20);
  rectMode(CENTER);
  float x = map(SD, 0.5, 0, width / 10, 9 * width / 10);
  if(x < width / 10){ x = width / 10; }
  if(x > 9 * width / 10){ x = 9 * width / 10; }
  rect(x, 4.5 * height / 5 + 15, 40, 80, 20);
  rectMode(CORNER);
}


void mouseDragged(){
    SD = map(mouseX, width / 10, 9 * width / 10, 0.5, 0);
}
