class Block{
  PVector loc;
  boolean contains;
  int value;
  
  Block(int locx, int locy){
    loc = new PVector(locx, locy);
    value = 0;
    contains = false;
  }
  
  
  void update(){
    spawn();
  }
  
  
  void display(){
    fill(255);
    rect(loc.x+3, loc.y+3, rowWidth-6, colHeight-6, 20);
    if(this.contains){
      stroke(0);
      fill(0);
      textSize(50);
      text(this.value, loc.x  + rowWidth / 3, loc.y + 2 * colHeight / 3);
    }
  }
  
  
  
}
