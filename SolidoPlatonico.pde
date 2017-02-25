class SolidoPlatonico { //<>//

  float x, y, z;
  float radio;
  float verticeRadio;
  boolean mostrarCaras;
  float[] carasColor = {255,106,213, 200};
  int transX, transY, transZ;
  boolean rotX, rotY;
  int degree = 0;
  float velRot  = 1;
  
  // Getters & Setter
  public void setCarasColor(int r, int g, int b, float a) { 
    this.carasColor[0] = r;
    this.carasColor[1] = g;
    this.carasColor[2] = b;
    this.carasColor[3] = a;
  }
  
  public float[] getCarasColor() { return this.carasColor; }
  
  // Constructores
  SolidoPlatonico(float radio, float verticeRadio, boolean mostrarCaras, int transX, int transY, int transZ) {
    this.radio = radio;
    this.verticeRadio = verticeRadio;
    this.mostrarCaras = mostrarCaras;
    this.transX = transX;
    this.transY = transY;
    this.transZ = transZ;
  }

  SolidoPlatonico(float radio, float verticeRadio) {
    this.radio = radio;
    this.verticeRadio = verticeRadio;
    this.mostrarCaras = true;
  }

  SolidoPlatonico(float radio) {
    this.radio = radio;
    this.verticeRadio = 0;
    this.mostrarCaras = true;
  }
  
  // Metodos
  void verticeEsfera(float x, float y, float z, float r) {
    pushMatrix();
    translate(x, y, z);
    noFill();
    sphereDetail(3);
    sphere(r);
    popMatrix();
  }

  void rotar() {
    if(degree == 360) { degree = 0; } 
    if (rotX) {  rotateX(radians(degree) * velRot); }
    if (rotY) {  rotateY(radians(degree) * velRot); }
    degree++;
  }

  void rotacion(boolean rotX, boolean rotY) {
    this.rotX = rotX;
    this.rotY = rotY;
  }
}