void setup() {
  size(800, 800);
  background(255);
  noStroke();
  triangleFractal(0, 700, 400, 0, 800, 700, 10);
  save("triangle.png");
}

void triangleFractal(float x1, float y1, float x2, float y2, float x3, float y3, int n ) {
  if ( n > 0 ) {
    colorMode(HSB, 360, 100, 100);
    fill(180, 100, map(n, 0, 10,  0, 100), map(n, 0, 10,  0, 100));
    triangle(x1, y1, x2, y2, x3, y3);
    float h1 = (x1+x2)/2.0;
    float w1 = (y1+y2)/2.0;
    float h2 = (x2+x3)/2.0;
    float w2 = (y2+y3)/2.0;
    float h3 = (x3+x1)/2.0;
    float w3 = (y3+y1)/2.0;
    triangleFractal(x1, y1, h1, w1, h3, w3, n-1);
    triangleFractal(h1, w1, x2, y2, h2, w2, n-1);
    triangleFractal(h3, w3, h2, w2, x3, y3, n-1);
  }
}
