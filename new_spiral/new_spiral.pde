float oldx, oldy, newx, newy, r, angle, i=50, j=50, k=50;

void setup(){
  size(600, 600);
  background(0);
  frameRate(500);
  strokeWeight(2);
}
void draw(){
  strokeWeight(1);
  stroke(floor(random(0, 255)), floor(random(0, 255)), floor(random(0, 255)));
  /*stroke(i, i, 0);
  i++;
  if(i>255){
    j++;
    stroke(0, j, j);
    if(j>255){
      k++;
      stroke(k, 0, k);
      if(k>255){
        i=50;j=50;k=50;
      }
    }
  }*/
  line(width/2 +oldx,height/2 + oldy, width/2 +newx,height/2 + newy);
  r+=0.1;
  oldx = newx;
  oldy = newy;
  newx=r*cos((angle));
  newy=r*sin((angle));
  angle+=0.05;
  
 
}
