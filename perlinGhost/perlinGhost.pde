float ns1, ns2, ns3, x, y, r=10;
void setup(){
  size(800, 400);
  frameRate(100);
  background(25);

}
void draw(){
  fill(0, 10);
  rectMode(CENTER);
  rect(width/2, height/2,width,height);
  generateNoiseValues();
  renderGhost();
}


void  generateNoiseValues(){
  
  ns1 += 0.003; 
  ns2 += 0.002;
  ns3 += 0.008;
  noStroke();
  x = noise(ns1)*width;
  y = noise(ns2)*height;
  r = map(noise(ns3), 0, 1, 20, 80);
}


void renderGhost(){
  fill(200);
  ellipse(x, y, r, r);
  rect(x, y+2*r, r, 2.8*r, r*0.45);
  stroke(255, 0, 0);
  strokeWeight(4);
  point(x-r*0.25, y-r*0.25);
  point(x+r*0.25, y-r*0.25);
  noStroke(); 
}

void mousePressed(){
  save("ghost.png");
}
