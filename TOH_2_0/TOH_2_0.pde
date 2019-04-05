int[] A = new int[10];
int[] B = new int[10];
int[] C = new int[10];
boolean gameOver, tapped;
boolean selectA;
boolean selectB;
boolean selectC;
int topA;
int topB;
int topC;
int discCount = 3;
int movesCount;
boolean discCountSelect;


void setup(){
  background(0);
  fullScreen();
  rectMode(CENTER);
  colorMode(HSB, 360,  100, 100);
  discCountSelect = false;
  fill(255);
  textSize(width/20);
  text("SELECT THE NUMBER OF DISCS.", width/7, height/4);
  for(int i = 2; i < 11; i ++ ){
    stroke(255);
    text(i, (i-2) * width/10 + width/15, height/2);
  }
  noStroke();
}


void initialize(){
  for(int i =0; i < discCount; i++){
    A[i] = discCount - i;
    B[i] = 0;
    C[i] = 0;
  }
  selectA = selectB = selectC = false;
  gameOver = tapped = false;
  topA = discCount - 1; topB = topC = -1;
  movesCount = 0;
}


void draw(){
   
}

void mousePressed(){
  if(!discCountSelect){
    discCount = 1 + (int)(map(mouseX, 0, width, 1, 10));
    discCountSelect = true;
    initialize();
    renderBackground();
    renderDisks(); 
  }
  else{
    if(gameOver) tapped = true;
    
    if(mouseX < width / 3)
    selectA = !selectA;
    if(mouseX >= width / 3 && mouseX <= 2 * width/3)
      selectB = !selectB;
    if(mouseX > 2 * width/3 )
      selectC = !selectC;
  }
}


void mouseReleased(){
  if(discCountSelect){
    //Tower A
    if(mouseX < width / 3){
      selectA = !selectA;
      if(selectB && selectA && topB > -1 && (topA == -1 || B[topB] < A[topA])){
        A[++topA] = B[topB--];
        B[topB + 1] = 0;
        movesCount++;
      }
      if(selectC && selectA && topC > -1 && (topA == -1 || C[topC] < A[topA])){
        A[++topA] = C[topC--];
        C[topC + 1] = 0;
        movesCount++;
      }
    }
    
    //Tower B
    if(mouseX >= width / 3 && mouseX <= 2 * width/3){
      selectB = !selectB;
      if(selectA && selectB && topA > -1 && (topB == -1 || A[topA] < B[topB])){
        B[++topB] = A[topA--];
        A[topA + 1] = 0;
        movesCount++;
      }
      if(selectC && selectB && topC > -1 && (topB == -1 || C[topC] < B[topB])){
        B[++topB] = C[topC--];
        C[topC + 1] = 0;
        movesCount++;
      }
    }
    
    //Tower C
    if(mouseX > 2 * width/3 ){
      selectC = !selectC;
      if(selectA && selectC && topA > -1 && (topC == -1 || A[topA] < C[topC])){
        C[++topC] = A[topA--];
        A[topA + 1] = 0;
        movesCount++;
      }
      if(selectB && selectC && topB > -1 && (topC == -1 || B[topB] < C[topC])){
        C[++topC] = B[topB--];
        B[topB + 1] = 0;
        movesCount++;
      }
    }
  }
  renderBackground();
  renderDisks();
  checkGameOver();
  selectA = selectB = selectC = false;
}
void renderBackground(){
  /*loadPixels();
  for(int i = 0, index = i * width; i < height; i++) { 
    for(; index < (i + 1) * width; index++){
      pixels[index] = color(200 + i * 0.025, 100, 100);
    }
  }
  updatePixels();*/
  background(210, 100, 80);
  noStroke();
  fill(60, 100, 100);
  rect(1 * width / 6, height/2, 30, 3 * height/5, 10);
  rect(3 * width / 6, height/2, 30, 3 * height/5, 10);
  rect(5 * width / 6, height/2, 30, 3 * height/5, 10);
  
  fill(20, 100, 100, 50);
  rect(width/2, 9 * height / 10, width, height / 5);
  fill(4, 0, 100);
  textSize(width/20);
  int optimalCount = (int)pow(2, discCount) - 1;
  text("OPTIMAL:" + optimalCount + " NUMBER OF MOVES:" + movesCount,  width/10, 4.5 * height / 5);
}


void renderDisks(){
  for(int i = 0; i < discCount; i++){
    if(A[i] > 0){
      fill(map(A[i], 1, discCount + 1, 0, 360), 100, 100);
      rect(width/6, 4 * height / 5  - 25 - (i) * 50, map(A[i], 1, discCount, width/12, width/4), 50, 15); 
    }
    if(B[i] > 0){
      fill(map(B[i], 1, discCount + 1, 0, 360), 100, 100);
      rect(width/2, 4 * height / 5 - 25 - (i) * 50, map(B[i], 1, discCount, width/12, width/4), 50, 15); 
    }if(C[i] > 0){
      fill(map(C[i], 1, discCount + 1, 0, 360), 100, 100);
      rect(5*width/6, 4 * height / 5 - 25 - (i) * 50, map(C[i], 1, discCount, width/12, width/4), 50, 15); 
    }
  }
}


void checkGameOver(){
  gameOver = true;
  for(int i =0; i < discCount; i++)
    if(C[i] != discCount - i)
      gameOver = false; 
  if(gameOver){
    fill(180, 0, 100);
    textSize(width/20);
    text("YOU WON, TAP ANYWHERE TO RESTART.", width/20, 100);
  }
  if(gameOver && tapped)
    setup();
}
