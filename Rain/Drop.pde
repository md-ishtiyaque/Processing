class  Drop{
  float len, thick, x, y, speed, wind, windDirection;
  Drop(){
    len = random(5, 15);
    thick = map(len, 5, 15, 2, 4);
    speed = map(len, 10, 30, 10, 30); 
    x = random(0, width);
    y = random(0, -height);
    //wind = 0;
    //windDirection = 0.5;
  }
  void update(){
    y += speed;
    if(y>height){y = 0;} 
    /*if(noise(windDirection)>0.5)  
      x += noise(wind)*speed;
    else 
      x -= noise(wind)*speed;
    wind += 0.0001;
    windDirection += 0.002;
    if(x>width){x = 0;}
    if(x<0) { x = width; }*/
  }
  void display(){
    for (float i = 0.4; i < thick; i+=0.9 ) {
      ellipse(x,y + i*4,i*2,i*2);
    }
  }
}
