class Spark{
  PVector loc;
  PVector vel;
  PVector acc;
  float angle;
  int baseColor;
  boolean alive;
  int duration;
  
  Spark(boolean alive_) {
    alive = alive_;
    loc = new PVector(mouseX, mouseY);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    baseColor = (int) random(0, 360);
  }
  
  void update() {
    if(alive){
      duration++;
      angle += random(0, TWO_PI);
      float magni = random(0, 3);
      acc.x += cos(angle) * magni;
      acc.y += sin(angle) * magni;
      acc.limit(3);
      vel.add(acc);
      vel.limit(6);
      loc.add(vel);
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
  
  void display() {
    if(alive){
      stroke((baseColor + millis() / 25.0) 
          % 360, 80, 80, 204);
      strokeWeight(10);
      point(loc.x, loc.y);
    }
  }
}
