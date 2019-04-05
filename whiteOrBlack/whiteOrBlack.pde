PImage img;

void setup() {
  size(512, 512);
  img = loadImage("img.jpg");
  //img.filter(GRAY);
  image(img, 0, 0, 512, 256);
}

int index(int x, int y) {
  return x + y * img.width;
}

void draw() {
  img.loadPixels();
  for (int y = 0; y < img.height-1; y++) {
    for (int x = 1; x < img.width-1; x++) {
      color pix = img.pixels[index(x, y)];
      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);
      
      float avg = (oldR+oldB+oldG)/3;
      
      if(avg<=256/4)
        img.pixels[index(x, y)] = color(0, 0, 0);
      else if(avg<=256/2)
        img.pixels[index(x, y)] = color(255/3, 255/3, 255/3);
      else if(avg<=3*256/3)
        img.pixels[index(x, y)] = color(2*255/3, 2*255/3, 2*255/3);
      else
        img.pixels[index(x, y)] = color(255, 255, 255); 
    }
  }
  img.updatePixels();
  image(img, 0, 256, 512, 256);
}
