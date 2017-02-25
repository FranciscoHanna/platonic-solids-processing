class Hexaedro extends SolidoPlatonico {

  float a;
  PVector[] vert = new PVector[8];
  int[][] caras;

  // Constructores
  Hexaedro(float radio, float verticeRadio, boolean mostrarCaras, int transX, int transY, int transZ) {
    super(radio, verticeRadio, mostrarCaras, transX, transY, transZ);
    init();
  }

  Hexaedro(float radio, float verticeRadio) {
    super(radio, verticeRadio);
    init();
  }

  Hexaedro(float radio) {
    super(radio);
    init();
  } //<>//

  // Calcular geometria
  void init() {
    a = radio/1.1414;
    caras = new int[6][4];
    vert[0] = new PVector(  a, a, a );
    vert[1] = new PVector(  a, a, -a );
    vert[2] = new PVector(  a, -a, -a );
    vert[3] = new PVector(  a, -a, a );
    vert[4] = new PVector( -a, -a, a );
    vert[5] = new PVector( -a, a, a );
    vert[6] = new PVector( -a, a, -a );
    vert[7] = new PVector( -a, -a, -a );

    caras[0] = new int[] {0, 1, 2, 3};
    caras[1] = new int[] {4, 5, 6, 7};
    caras[2] = new int[] {0, 3, 4, 5};
    caras[3] = new int[] {1, 2, 7, 6};
    caras[4] = new int[] {2, 3, 4, 7};
    caras[5] = new int[] {0, 5, 6, 1};
  }

  // Mostrar hexaedro
  void crear() { 
    translate(transX, transY, transZ);
    rotar();
    
    // Vertices
    if (verticeRadio > 0) {
      for (int i=0; i<8; i++)
        verticeEsfera(vert[i].x, vert[i].y, vert[i].z, verticeRadio);
    }

    if (!mostrarCaras) { 
      noFill();
    } else { 
      fill(carasColor[0], carasColor[1], carasColor[2], carasColor[3]);
    }

    for (int i=0; i<6; i++) {
      beginShape();
      for (int j=0; j<4; j++)
      {
        vertex(vert[caras[i][j]].x, vert[caras[i][j]].y, vert[caras[i][j]].z);
      }
      endShape();
    }
  }
}