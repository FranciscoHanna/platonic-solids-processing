class Tetraedro extends SolidoPlatonico {

  PVector[] vert = new PVector[4];
  int[][] caras;

  // Constructores
  Tetraedro(float radio, float verticeRadio, boolean mostrarCaras, int transX, int transY, int transZ) {
    super(radio, verticeRadio, mostrarCaras, transX, transY, transZ);
    init();
  }

  Tetraedro(float radio, float verticeRadio) {
    super(radio, verticeRadio);
    init();
  }

  Tetraedro(float radio) {
    super(radio);
    init();
  }

  void init() {
    float a = radio;
    vert[0] = new PVector(a, -a/sqrt(3), -a/sqrt(6)); 
    vert[1] = new PVector(-a, -a/sqrt(3), -a/sqrt(6));  
    vert[2] = new PVector(0, 2*a/sqrt(3), -a/sqrt(6)); 
    vert[3] = new PVector(0, 0, 3*a/sqrt(6) ); 
  }

  

  // Mostrar Tetraedro 
  void crear() {
    translate(transX, transY, transZ);
    rotar();
  
    rotateX(radians(90));

    // Vertices
    if (verticeRadio > 0) {
      for (int i=0; i<4; i++)
        verticeEsfera(vert[i].x, vert[i].y, vert[i].z, verticeRadio);
    }

    if (!mostrarCaras) { 
      noFill();
    } else { 
      fill(carasColor[0], carasColor[1], carasColor[2], carasColor[3]);
    }

    beginShape(TRIANGLE_STRIP);
    vertex(vert[0].x, vert[0].y, vert[0].z);  // vertex 1
    vertex(vert[1].x, vert[1].y, vert[1].z);    // vertex 2
    vertex(vert[2].x, vert[2].y, vert[2].z);  // vertex 3
    vertex(vert[3].x, vert[3].y, vert[3].z);   // vertex 4
    vertex(vert[0].x, vert[0].y, vert[0].z);  // vertex 1
    vertex(vert[1].x, vert[1].y, vert[1].z);    // vertex 2
    vertex(vert[3].x, vert[3].y, vert[3].z);   // vertex 4
    vertex(vert[2].x, vert[2].y, vert[2].z);  // vertex 3
    vertex(vert[1].x, vert[1].y, vert[1].z);    // vertex 2
    endShape(CLOSE);
  }
}