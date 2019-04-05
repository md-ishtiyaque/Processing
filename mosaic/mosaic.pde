PImage[] imgSet = new PImage[645];
PImage[] newImgSet = new PImage[645];
PImage img;
PImage pixelatedImg;
int count;
int mosaicFactor = 20;


void setup(){
  size(2655, 5171);
  for(count=0;count<645;count++){
    imgSet[count] = loadImage("compressedData/image-" + nf(count, 4) +".jpg" );
  }
  for(count=0;count<645;count++){
    newImgSet[count] = loadImage("compressedData/image-" + nf(count, 4) +".jpg" );
  }
  img = loadImage("img.jpg");
  noLoop();
}

void draw(){
  pixelatedImg = pixelate(img, mosaicFactor);
  createMosaic(pixelatedImg, mosaicFactor);
  save("output.png");
  //exit();
}


int index(int x, int y, int cols) {
  return x + y * cols;
}


PImage pixelate(PImage img, int factor){
  img.loadPixels();
  for (int y = 0; y < img.height-factor+1; y+=factor) {
    for (int x = 0; x < img.width-factor+1; x+=factor) {
      int sumR = 0, sumG = 0, sumB = 0;
      for(int i = 0; i < factor; i++){
        for(int j = 0; j < factor; j++){
            color pix = img.pixels[index(x+i, y+j, img.width)];
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
            img.pixels[index(x+i, y+j, img.width)] = color(newR, newG, newB);
        }
      }
    }
  }
  img.updatePixels();
  return img;
}


void createMosaic(PImage pixelatedImg, int factor){
  for(count=0;count<645;count++){
    newImgSet[count] = pixelate(newImgSet[count], newImgSet[count].width);
  }
  int imgNumber;
  for (int y = 0; y < pixelatedImg.height-factor+1; y+=factor) {
    for (int x = 0; x < pixelatedImg.width-factor+1; x+=factor) {
      color pix = pixelatedImg.pixels[index(x, y, pixelatedImg.width)];
      float imgBrightness = brightness(pix);
      float imgHue = hue(pix);
      float imgSaturation = saturation(pix);
      float record = 1000;
      imgNumber = -1;
      for(count=0;count<645;count++){
        color imgSetPix = newImgSet[count].pixels[0];
        float imgSetBrightness = brightness(imgSetPix);
        float imgSetHue = hue(imgSetPix);
        float imgSetSaturation = saturation(imgSetPix);
        float newValue = abs(imgBrightness-imgSetBrightness) + abs(imgHue-imgSetHue) + abs(imgSaturation-imgSetSaturation);
        if(newValue<record){ record = newValue; imgNumber = count; }
      }
      image(imgSet[imgNumber], x, y, factor, factor);
    }
  }
}
