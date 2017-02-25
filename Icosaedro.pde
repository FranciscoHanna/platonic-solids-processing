class Icosaedro extends SolidoPlatonico {
  
  PVector topPoint;
  PVector[] topPent = new PVector[5];
  PVector bottomPoint;
  PVector[] bottomPent = new PVector[5];
  float angulo = 0;
  float triDist;
  float triHt;
  float a, b, c;

  // Constructores
  Icosaedro(float radio, float verticeRadio, boolean mostrarCaras, int transX, int transY, int transZ) {
    super(radio, verticeRadio, mostrarCaras, transX, transY, transZ);
    init();
  }

  Icosaedro(float radio, float verticeRadio) {
    super(radio, verticeRadio);
    init();
  }

  Icosaedro(float radio) {
    super(radio);
    init();
  }

  // calculate geometry
  void init() {
    c = dist(cos(0)*radio, sin(0)*radio, cos(radians(72))*radio, sin(radians(72))*radio);
    b = radio;
    a = (float)(Math.sqrt(((c*c)-(b*b))));

    triHt = (float)(Math.sqrt((c*c)-((c/2)*(c/2))));

    for (int i=0; i<topPent.length; i++) {
      topPent[i] = new PVector(cos(angulo)*radio, sin(angulo)*radio, triHt/2.0f);
      angulo+=radians(72);
    }
    topPoint = new PVector(0, 0, triHt/2.0f+a);
    angulo = 72.0f/2.0f;
    for (int i=0; i<topPent.length; i++) {
      bottomPent[i] = new PVector(cos(angulo)*radio, sin(angulo)*radio, -triHt/2.0f);
      angulo+=radians(72);
    }
    bottomPoint = new PVector(0, 0, -(triHt/2.0f+a));
  }

  // draws icosaedro 
  void crear() {
    translate(transX, transY, transZ);
    rotar();
    
    // vertexes
    if (verticeRadio > 0) {
      for (int i=0; i<5; i++) {
        verticeEsfera(topPent[i].x, topPent[i].y, topPent[i].z, verticeRadio);
        verticeEsfera(bottomPent[i].x, bottomPent[i].y, bottomPent[i].z, verticeRadio);
      }
      verticeEsfera(topPoint.x, topPoint.y, topPoint.z, verticeRadio);
      verticeEsfera(bottomPoint.x, bottomPoint.y, bottomPoint.z, verticeRadio);
    }

    if (!mostrarCaras) { 
      noFill();
    } else { 
      fill(carasColor[0], carasColor[1], carasColor[2], carasColor[3]);
    }

    for (int i=0; i<topPent.length; i++) {
      // icosaedro top
      beginShape();
      if (i<topPent.length-1) {
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPoint.x, y+topPoint.y, z+topPoint.z);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z);
      } else {
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPoint.x, y+topPoint.y, z+topPoint.z);
        vertex(x+topPent[0].x, y+topPent[0].y, z+topPent[0].z);
      }
      endShape(CLOSE);

      // icosaedro bottom
      beginShape();
      if (i<bottomPent.length-1) {
        vertex(x+bottomPent[i].x, y+bottomPent[i].y, z+bottomPent[i].z);
        vertex(x+bottomPoint.x, y+bottomPoint.y, z+bottomPoint.z);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z);
      } else {
        vertex(x+bottomPent[i].x, y+bottomPent[i].y, z+bottomPent[i].z);
        vertex(x+bottomPoint.x, y+bottomPoint.y, z+bottomPoint.z);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
      }
      endShape(CLOSE);
    }

    // icosaedro body
    for (int i=0; i<topPent.length; i++) {
      if (i<topPent.length-2) {
        beginShape();
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z);
        vertex(x+bottomPent[i+2].x, y+bottomPent[i+2].y, z+bottomPent[i+2].z);
        endShape(CLOSE);

        beginShape();
        vertex(x+bottomPent[i+2].x, y+bottomPent[i+2].y, z+bottomPent[i+2].z);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z);
        endShape(CLOSE);
      } else if (i==topPent.length-2) {
        beginShape();
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
        endShape(CLOSE);

        beginShape();
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z);
        endShape(CLOSE);
      } else if (i==topPent.length-1) {
        beginShape();
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
        vertex(x+bottomPent[1].x, y+bottomPent[1].y, z+bottomPent[1].z);
        endShape(CLOSE);

        beginShape();
        vertex(x+bottomPent[1].x, y+bottomPent[1].y, z+bottomPent[1].z);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPent[0].x, y+topPent[0].y, z+topPent[0].z);
        endShape(CLOSE);
      }
    }
  }
}