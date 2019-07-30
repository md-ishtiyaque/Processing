class Ball{
  float radius, x, y, velx, vely;
  Ball(){
    radius = random(5, 20);
    x = random(radius, width - radius);
    y = random(radius, height - radius);
    velx = random(10, 20);
    vely = random(10, 20);
  }
  void compute(){
    x += velx;
    y += vely;
    if(x < radius) velx = abs(velx);
    if(x > width - radius) velx = -abs(velx);
    if(y < radius) vely = abs(vely);
    if(y > height - radius) vely = -abs(vely);
  }
  void render(){
    ellipse(x, y, 2 * radius, 2 * radius);
  }
}
