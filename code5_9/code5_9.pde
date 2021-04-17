ArrayList<BubblesBase> bubbles = new ArrayList<BubblesBase>();
float targetx;
float targety;
float rotx = 0.0;
float roty = 0.0;
void setup () {
  pixelDensity (displayDensity ());
  size(800, 500, P3D);
  frameRate(24);
  colorMode (RGB, 256);
  background (0);
}
void draw () {
  background (0);
  ambientLight (30, 20, 80);
  pointLight (255, 0, 0, 200.0, 0.0, 200.0);
  pointLight (255, 0, 0, -200.0, 0.0, -200.0);
  pointLight (0, 255, 0, 0.0, 200.0, 200.0);
  pointLight (0, 255, 0, 0.0, -200.0, -200.0);
  pointLight (100, 0, 0, 200.0, 0.0, 200.0);
  pointLight (100, 0, 0, -200.0, 0.0, -200.0);
  pointLight (0, 100, 0, 0.0, 200.0, 200.0);
  camera (0.0, 0.0, -1000.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  targetx = mouseY;
  targety = mouseX;
  rotx += (targetx - rotx) * 0.04;
  roty += (targety - roty) * 0.04;
  rotateX (rotx * 0.01);
  rotateY (roty * 0.01);
  bubbles.add (new BubblesBase (random (width), height + 40.0, random (-1000.0, 1000.0), random (10,0), random (0.1, 20.0)));
  for (int i = 0; i < bubbles.size(); i++) {
    bubbles.get(i).update ();
    bubbles.get(i).render ();
    if (bubbles.get(i).by < 0) {
      bubbles.remove(i);
    }
  }
}
class BubblesBase { 
  float bx, by, bz, br,bup; 
  BubblesBase (float x, float y, float z, float r, float up) {  
    this.bx = x;
    this.by = y;
    this.bz = z;
    this.br = r;
    this.bup = up;
  } 
  void update() { 
    this.by -= this.bup;
  }
  void render(){
    noStroke ();
    push ();
    translate (this.bx - width / 2.0, this.by - height / 2.0, this.bz);
    sphere (this.br * 6.0);
    pop ();
  } 
}
