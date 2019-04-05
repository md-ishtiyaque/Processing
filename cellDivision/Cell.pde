class Cell{
  PVector loc;
  PVector vel;
  PVector acc;
  float angle;
  int baseColor;
  boolean alive;
  int duration;
  
  Cell(boolean alive) {
    this.alive = alive;
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    baseColor = (int) random(0, 360);
  }
  
  void update() {
    if(alive){
      duration++;
      strokeWeight(map(duration, 0, 1000, 10, 40));
      if(duration % (int)random(500, 1000) == 0) alive = false;
      angle += random(0, TWO_PI);
      float magni = random(0, 3);
      acc.x += cos(angle) * magni;
      acc.y += sin(angle) * magni;
      acc.limit(0.2);
      vel.add(acc);
      vel.limit(1);
      loc.add(vel);
      handleBoundary();
    }
  }
  
  void display() {
    if(alive){
      point(loc.x, loc.y);
    }
  }
  
  
  void handleBoundary(){
    if (loc.x > width)
        loc.x -= width;
      if (loc.x < 0)
        loc.x += width;
      if (loc.y > height)
        loc.y -= height;
      if (loc.y < 0)
        loc.y += height;  
    }

}
