class Block{
  float x, y, vel;
  float w, h;
  Block(int i){
    w = 0.6 * width;
    h = 0.05 * height;
    if(random(1) > 0.5)
      x = 0.3 * width;
    else 
      x = 0.7 * width;
    y = - h / 2 - i * height / 4;
    vel = 16;
  }
  void Render(){
    y += vel;
    if(y + h / 2 > height){
      float temp = random(1);
      if(temp > 0.60)
        x = 0.3 * width;
      else if( temp < 0.40) 
        x = 0.7 * width;
      else x = 2 * width;  
      y = 0;
    }
    if(checkCollison(x, y, w, h, bbX, bbY, ballDiameter) 
    | checkCollison(x, y, w, h, rbX, rbY, ballDiameter))
      gameOver = true;  
    rectMode(CENTER);
    noStroke();
    
      if(gameOver)
        fill(255, 0, 0);
      else 
        fill(255);
      rect(x, y, w, h);
    
    if(gameOver){
      gameOver = false;
      score -= min((int) frameCount / 100, 2000);
    }
    else {
      score ++;
    }
  }
  boolean checkCollison(float rx, float ry, float rw, float rh, float bx, float by, float d) {

  if (bx+d/2 >= rx-rw/2 && bx-d/2 <= rx+rw/2 && abs(ry-by) <= d/2) {
    return true;
  }
  else if (by+d/2 >= ry-rh/2 && by-d/2 <= ry+rh/2 && abs(rx-bx) <= d/2) {
    return true;
  }

  // upper-left
  float xDist = (rx-rw/2) - bx;  
  float yDist = (ry-rh/2) - by;
  float shortestDist = sqrt((xDist*xDist) + (yDist * yDist));

  // upper-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry-rh/2) - by;
  float distanceUR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceUR < shortestDist) {  
    shortestDist = distanceUR;      
  }

  // lower-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLR < shortestDist) {
    shortestDist = distanceLR;
  }

  // lower-left
  xDist = (rx-rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLL = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLL < shortestDist) {
    shortestDist = distanceLL;
  }

  if (shortestDist < d/2) {  
    return true;            
  }
  else {
    return false;
  }
}
}
