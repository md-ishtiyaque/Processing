class Ripple{
  PVector loc;
  float size, thickness, alpha;
  boolean exists;
  float hue;
  Ripple(float x, float y, float hue, boolean exists){
    loc = new PVector(x, y);
    this.hue = hue;
    this.exists = exists;
  }
  
  
 void update(){
    if(exists){
      size+=8;
      alpha = map(size, 3*width/4, width, 100, 0);
      thickness = map(size, 0, width/2, 1, 10);
      if(alpha == 0 ) 
        exists = false; 
    }
  }
  
  
  void display(){
    if(exists){
      noFill();
      stroke(this.hue, 50, 100, alpha);
      strokeWeight(thickness);
      ellipse(this.loc.x, this.loc.y, size, size);
    }
  } 
}
