import ketai.camera.*;

KetaiCamera cam;

void setup() {
  orientation(PORTRAIT);
  imageMode(CENTER);
  cam = new KetaiCamera(this, displayWidth, displayHeight, 4);
  cam.setCameraID(1);
}

void draw() {
  image(cam, width/2 - width/30, height/2);
}

void onCameraPreviewEvent()
{
  cam.read();
}

// start/stop camera preview by tapping the screen
void mousePressed()
{
  if (cam.isStarted())
  {
    cam.stop();
  }
  else
    cam.start();
  if (cam.isFlashEnabled())
        cam.disableFlash();
      else
        cam.enableFlash();  
}
