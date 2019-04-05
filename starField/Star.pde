class Star
{
  PVector s, c, vel;
  Star()
  {
    c = new PVector(width/2, height/2);
    s = new PVector(round(random(width)), round(random(height)));
    vel = new PVector(s.y/dist(c.x, c.y,s.x, s.y), s.x/(dist(c.x, c.y, s.x, s.y)));
    point(s.x, s.y);    
  }
  void update() 
  {  
    if(s.x<=c.x && s.y<=c.y) { s.x-=vel.x;s.y-=vel.y; }  
    if(s.x<=c.x && s.y>=c.y) { s.x-=vel.x;s.y+=vel.y; }  
    if(s.x>=c.x && s.y>=c.y) { s.x+=vel.x;s.y+=vel.y; }  
    if(s.x>=c.x && s.y<=c.y) { s.x+=vel.x;s.y-=vel.y; }  
     point(s.x, s.y);    
    if(s.x>width || s.y> height || s.x<0 || s.y <0) {  
      s = new PVector(round(random(width)), round(random(height)));
    }

      
  }
}
