PImage img;

void setup() {
  size(512, 512);
  noLoop();
  img = loadImage("img.jpg");
  //img.filter(GRAY);
  image(img, 0, 0, 512, 256);
}

int index(int x, int y) {
  return x + y * img.width;
}

void draw() {
  img.loadPixels();
  int factor = 430;
  for (int y = 0; y < img.height-factor; y+=factor) {
    for (int x = 0; x < img.width-factor; x+=factor) {
      int sumR = 0, sumG = 0, sumB = 0;
      for(int i = 0; i < factor; i++){
        for(int j = 0; j < factor; j++){
            color pix = img.pixels[index(x+i, y+j)];
            sumR += red(pix);
            sumG += green(pix);
            sumB += blue(pix);
        }
      }
      
      int newR = round(sumR/(factor*factor));
      int newG = round(sumG/(factor*factor));
      int newB = round(sumB/(factor*factor));
      
     for(int i = 0; i < factor; i++){
        for(int j = 0; j < factor; j++){
            img.pixels[index(x+i, y+j)] = color(newR, newG, newB);
        }
      }
    }
  }
  img.updatePixels();
  image(img, 0, 256, 512, 256);
}
