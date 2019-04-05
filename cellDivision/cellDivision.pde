int cellCount = 400;
int loop;
Cell[] c = new Cell[cellCount];
void setup(){
  size(600, 600);
  stroke(255, 100);
  strokeWeight(40);
  for(int i = 0; i < cellCount; i++)
    c[i] = new Cell(false);
}


void draw(){
  background(0);
  for(int i = 0; i < cellCount; i++){
    c[i].update();
    c[i].display();
  }
}


void mouseDragged(){
  c[loop].alive = true;
  c[loop].loc = new PVector(mouseX, mouseY);
  c[loop].duration = 0;
  loop = (loop + 1) % cellCount;
}
