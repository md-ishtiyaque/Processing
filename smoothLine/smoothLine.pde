float x;
float y;
float x_, y_, noizx, noizy;
void setup(){
  size(600, 600);
  background(0);
  stroke(255);
   x = noise(noizx)*width;
   y = noise(noizy)*height;
}
void draw(){
  //background(0);  
  x_ = noise(noizx)*width;
  noizx += 0.001;
  y_ = noise(noizy)*height;
  noizy += 0.002;
  line(x, y, x_, y_);
  x = x_;
  y = y_;
}
