int maxSparkCount = 300;
int sparkCount;
Spark[] s = new Spark[maxSparkCount];


void setup(){
  fullScreen();  
  for(int i=0;i<maxSparkCount;i++)
    s[i] = new Spark(false);
  colorMode(HSB, 360, 100, 100);
  strokeCap(ROUND);
  frameRate(60);
  smooth(8);
}


void draw(){
  fill(0, 25);
  noStroke();
  rect(0, 0, width, height);
  for(int i=0;i<maxSparkCount;i++){
    s[i].update();
    s[i].display();
    if(s[i].duration % 250 == floor(random(250)) ){
      s[i].duration = 0;
      s[i].alive = false;
    }
  }
}


void mousePressed(){
  for(int i =0; i < 20; i++){
    s[sparkCount] = new Spark(true);
    sparkCount = (sparkCount + 1) % maxSparkCount;
  }
}


void mouseDragged(){
  s[sparkCount] = new Spark(true);
  sparkCount = (sparkCount + 1) % maxSparkCount;
}
