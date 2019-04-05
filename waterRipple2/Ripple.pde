class Ripple{
  float centerX, centerY;
  float size, thickness, alpha;
  boolean exists;
  
  
  Ripple(float x, float y, boolean exists_){
    centerX = x;
    centerY = y;
    size = 0;
    thickness = 2;
    alpha = 100;
    exists = exists_;
  }
  
  
  
  void update(){
    if(exists){
      size+=8;
      alpha = map(size, width/2, 3*width/4, 100, 0);
      thickness = map(size, 0, width/2, 1, 10);
      if(alpha == 0 ){ exists = false; }
    }
  }
  
  
  void display(){
    if(exists){
      stroke(210, 50, 100, alpha);
      strokeWeight(thickness);
      ellipse(centerX, centerY, size, size);
    }
  }
}
