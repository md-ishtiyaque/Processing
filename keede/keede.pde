ArrayList<Spark> sparks;

void setup() {
  size(600, 600);
  
  sparks = new ArrayList<Spark>();
  
  colorMode(HSB, 360, 100, 100);
  strokeCap(ROUND);
  
  frameRate(60);
  smooth(8);
}

void draw() {
  fill(0, 25);
  noStroke();
  rect(0, 0, width, height);
  
  for (Spark spark : sparks) {
    spark.update();
    spark.display();
  }
}

void mousePressed(){
  for(int i=0;i<1;i++){
    sparks.add(new Spark());
  }
}
