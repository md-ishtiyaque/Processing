int time=0, i=25, dir, temp, temp2;
float angle, rbx, rby, bbx, bby;
int[] j = new int[5];

void setup()
{
  size(350,600);
  frameRate(120);
  background(0);
  for(temp=0;temp<3;temp++)
  {
    j[temp+1] = j[temp]-height/3; 
  }
  
}
void draw()
{ time++;
  background_design();
  obstacles();
  //save("Duet.png");
}
void background_design()
{
  background(0);
  fill(0);
  stroke(80);
  ellipse(175, 450, 240, 240);
  balls();
  fill(50);
  if(random(1,3)<2){dir=1;}
  else{dir=-1;}
  rect(100-i/2, 100-i/2, i, i);
  rect(230-i/2, 100-i/2, i, i);
  rect(100-i/2, 300-i/2, i, i);
  rect(230-i/2, 300-i/2, i, i);
  rect(100-i/2, 500-i/2, i, i);
  rect(230-i/2, 500-i/2, i, i);
  i = i+5*dir;
  if(i<=10 || i>=50){i = 25;}
  
}
void obstacles()
{
  fill(255);
  obstacle1(0);
  obstacle2(1);
  obstacle1(2); 
} 
void keyPressed()
{
  if(keyCode == LEFT) {angle=angle-7;}
  if(keyCode == RIGHT) {angle=angle+7;}
}
void balls()
{
  fill(255, 0, 0);
  noStroke();
  rbx = 175 + 120*cos(radians(angle));
  rby = 450 + 120*sin(radians(angle));
  bbx = 175 + 120*cos(radians(angle)-PI);
  bby = 450 + 120*sin(radians(angle)-PI);
  ellipse(rbx, rby, 20, 20);
  fill(0, 0, 255);
  ellipse(bbx, bby, 20, 20);
}  
void obstacle1(int k)
{
     rect(0, j[k], 200, 30);
  j[k]++; 
  if(j[k]>height+30){j[k]=0;}
  if((rbx>0 && rbx<200) && (rby>j[k] && rby<j[k]+30) || (bbx>0 && bbx<200) && (bby>j[k] && bby<j[k]+30)){end();}
}  
void obstacle2(int k)
{
  rect(width-200, j[k], width, 30);
  j[k]++;
  if(j[k]>height+30){j[k]=0;} 
  if((rbx>width-200 && rbx<width) && (rby>j[k] && rby<j[k]+30) || (bbx>width-200 && bbx<width) && (bby>j[k] && bby<j[k]+30)){end();}

}  
void end()
{   noLoop();
  noStroke();
  fill(255);
  rect(0, 0, width, height);
  println("GAME OVER!");
}  
