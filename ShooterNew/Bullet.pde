class Bullet{
  float locx, locy;
  float  velx, vely;
  Boolean alive;
  Bullet(float locx, Boolean alive){
    this.alive = alive;
    this.locx = locx;
    locy = height - height/10;
    velx = 0;
    vely = -height / 20;
  }
  void calculate(){
    locx += velx;
    locy += vely;
    if(locy < 0)
      alive = false;
  }
  void render(){
      image(bulletImage, locx, locy, height/20, height/20);
  }
}
