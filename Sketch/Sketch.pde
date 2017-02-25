import peasy.*; //<>//
PeasyCam cam;

void setup() {
  //fullScreen(P3D);
  size(1024, 768, P3D);

  stroke(255);
  strokeWeight(2);

  // noStroke();

  /**** CAMARA SETUP ****/
  //cam = new PeasyCam(this, 100);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(500);
}

int radios = 80;
int verticeRadios = 1;
boolean mostrarCaras = true;

// Class var = new Class(radio, verticeRadio, mostrarCaras, transX, transY, transZ)
Tetraedro t = new Tetraedro(90, verticeRadios, mostrarCaras, 0, -230, 0);
Hexaedro h = new Hexaedro(radios, verticeRadios, mostrarCaras, 0, 0, 0);
Octaedro o = new Octaedro(100, verticeRadios, mostrarCaras, 0, 250, 0);
Icosaedro i = new Icosaedro(radios, verticeRadios, mostrarCaras, -250, 0, 0);
Dodecaedro d = new Dodecaedro(radios, verticeRadios, mostrarCaras, 250, 0, 0);


int r = 0;
boolean flagR = true;
void draw() {

  background(148, 208, 255);
  lights();
  translate(width/2, height/2);

  if (r == 360) { 
    flagR = false;
    r = 0;
  }
  rotateZ(radians(r));
  r++;
  
  

  pushMatrix();
  t.crear();
  t.rotacion(false, true);
  popMatrix();

  pushMatrix();
  h.crear();
  h.rotacion(false, true);
  popMatrix();

  pushMatrix();
  o.crear();
  o.rotacion(false, true);
  popMatrix();

  pushMatrix();
  i.crear();
  i.rotacion(false, true);
  popMatrix();

  pushMatrix();
  d.crear();
  d.rotacion(false, true);
  popMatrix();
}