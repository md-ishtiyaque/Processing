class Star
{
  float x, y, brightness, noiz;
  Star()
  {
    this.x = random(0, width);
    this.y = random(0, height);
    this.brightness = random(100, 255);    
  }
  
  
  void update()
  {
    this.brightness=noise(noiz)*255;
    noiz+=0.03*random(1, 7);
  }
  void display()
  {
    stroke(100+brightness);
    point(this.x, this.y);
  }
}
