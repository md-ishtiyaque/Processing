PImage[] imgSet = new PImage[1000];
int count = 521;
String[] filenames;

String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    return null;
  }
}


void setup(){
  size(300, 300);
  filenames = listFileNames("/home/mustaque/sketchbook/imageCompressor/data");
}

void draw(){
  for(String filename : filenames){
    try{
      imgSet[count] = loadImage("/home/mustaque/sketchbook/imageCompressor/data/"+filename);
      print(count + " " + filename + " loaded\n");
      image(imgSet[count], 0, 0, width, height);
      saveFrame("/home/mustaque/sketchbook/imageCompressor/compressedData/image-"+nf(count, 4)+".jpg");
      imgSet[count] = loadImage("pipe.png");
      count++;
      }
       catch (ArithmeticException e) {
    }
  }
  noLoop();
}
