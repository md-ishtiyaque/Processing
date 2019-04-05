float i, angle, s = -PI/2, m = -PI/2, h = -PI/2;

void setup()
{
  size(500,500);
  background(0);
  stroke(255);
  //loop();
  frameRate(30);
  //i=width;
 // translate(width/2, height/2);
}
void draw()
{  background(0);
   stroke(255, 1);
  for(i=0;i<12;i++)
{  angle = i/12*2*PI;
   ellipse(250 + 200 *cos(angle), 250 + 200 *sin(angle), 10, 10);
}
strokeWeight(3);
stroke(255, 0, 0);
line(250, 250, 250+180*cos(s),250+180*sin(s));
strokeWeight(5);
stroke(0, 255, 0);
line(250, 250, 250+160*cos(m),250+160*sin(m));
strokeWeight(7);
stroke(0, 0, 255);
line(250, 250, 250+140*cos(h),250+140*sin(h));
s += 2*PI/60;
m += 2*PI/3600;
h += 2*PI/216000;
     
}  
