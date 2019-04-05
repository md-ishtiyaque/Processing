float x, y, d, circount, rectcount, pie, i, diff=1;
void setup(){
  background(0);
  noFill();
  size(800, 800);
  stroke(255);
  translate(width/2, height/2);
  ellipse(0, 0, 600, 600);
  rectMode(CENTER);
  rect(0, 0, 600, 600);
  strokeWeight(0.01);  
}


void draw(){
  translate(width/2, height/2);
  for(i=0;i<100000;i++){
    rectcount++;
    x = random(-300, 300);
    y = random(-300, 300);
    d = dist(0, 0, x, y);
   if(d<300){circount++;stroke(0, 255, 0);}
   else stroke(0, 0, 255);
   if(random(0, 1)<0.1)point(x, y); 
   pie = 4 * (circount / rectcount); 
  } 
  if(abs(pie-PI)<0.001){ println(pie);}
}
