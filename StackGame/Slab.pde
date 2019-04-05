class Slab{
  float   dirx = 1,diry = 1, k = -height/2, j =-198;
  int index, i, count;
  Slab(){
    k = -height/10;
    j =-198;
    
  }
  
  void drawSlab(){
    
  noStroke();
  fill(255, 0, 0);
  beginShape();
  vertex(200 + j, height/2 + k);
  vertex(width/2 + j, 350 + k);
  vertex(400 + j, height/2 + k);
  vertex(width/2 + j, 250 + k);
  endShape(CLOSE);
  fill(230, 0, 0);
  beginShape();
  vertex(200 + j, height/2 + k);
  vertex(width/2 + j, 350 + k);
  vertex(width/2 + j, 360 + k);
  vertex(200 + j, height/2+10 + k);
  endShape();
  fill(180, 0, 0);
  beginShape();
  vertex(width/2 + j, 350 + k);
  vertex(400 + j, height/2 + k);
  vertex(400 + j, height/2+10 + k);
  vertex(width/2 + j, 350+10 + k);
  endShape();  
  }
  void updatetop(){
  if(j + 400>width || j + 200<0 ) { dirx*=-1;diry*=-1; }
  j+=2*dirx;
  k+=diry;
  }
  void endTop(){
    k+=10;
  }
}
