int particleCount = 15;
Particle p[] = new Particle[particleCount];
void setup(){
  fullScreen();
  stroke(255);
  for(int i = 0; i < particleCount; i++)
    p[i] = new Particle();
}


void draw(){
  background(0);
  strokeWeight(40);
  for(int i = 0; i < particleCount; i++){
    p[i].update();
    p[i].display();
  }
  for(int i = 0; i < particleCount; i++)
    for(int j = 0; j < particleCount; j++){
      float distance = dist(p[i].loc.x, p[i].loc.y, p[j].loc.x, p[j].loc.y);
      if(distance < 300){
        //float lineThickness = map(distance, 0, 500, 25, 0);
        strokeWeight(5);
        line(p[i].loc.x, p[i].loc.y, p[j].loc.x, p[j].loc.y);
      }
    }
}
